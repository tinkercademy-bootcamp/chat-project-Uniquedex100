#include <unistd.h>

#include "spdlog/spdlog.h"

#include "../net/chat-sockets.h"
#include "../utils.h"
#include "chat-server.h"

tt::chat::server::Server::Server(int port)
    : socket_(tt::chat::net::create_socket()),
      address_(tt::chat::net::create_address(port)),
      epoll_fd{epoll_create1(0)} {
  using namespace tt::chat;
  setSocketOptions(socket_, 1);

  address_.sin_addr.s_addr = INADDR_ANY;
  auto err_code = bind(socket_, (sockaddr *)&address_, sizeof(address_));
  check_error(err_code < 0, "bind failed\n");
  err_code = listen(socket_, 3);
  check_error(err_code < 0, "listen failed\n");
  std::cout << "Server listening on port " << port << "\n";

  check_error(epoll_fd == -1, "epoll_create1 failed");
  socket_event.events = EPOLLIN | EPOLLET;  
  socket_event.data.fd = socket_;
  int status = epoll_ctl(epoll_fd, EPOLL_CTL_ADD, socket_, &socket_event);
  check_error(status == -1, "epoll_ctl socket failed");

}

void tt::chat::server::Server::setSocketOptions(int sock, int opt) {
  using namespace tt::chat;
  auto err_code = setsockopt(sock, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT,
                             &opt, sizeof(opt));
  check_error(err_code < 0, "setsockopt() error\n");
}

tt::chat::server::Server::~Server() { close(socket_); }

void tt::chat::server::Server::acceptNewConnection() {
  sockaddr_in client_addr;
  socklen_t addr_len = sizeof(client_addr);
  int status;

  int client_fd = accept(socket_, (sockaddr*)&client_addr, &addr_len);
  check_error(client_fd == -1, "Accept error n ");
  int flags = fcntl(client_fd, F_GETFL, 0);
  check_error(flags == -1, "fcntl get flags failed");
  status = fcntl(client_fd, F_SETFL, flags | O_NONBLOCK);
  check_error(status == -1, "fcntl set flags O_NONBLOCK failed");

  epoll_event ev{};
  ev.events = EPOLLIN | EPOLLET;
  ev.data.fd = client_fd;
  status = epoll_ctl(epoll_fd, EPOLL_CTL_ADD, client_fd, &ev);
  check_error(status == -1, "epoll_ctl add client failed");

  std::cout << "Accepted new client: " << client_fd << "\n";
}

void tt::chat::server::Server::readIncomingInput(int fd){
  char recv_buffer[kBufferSize] = {0};
  ssize_t bytes_read = read(fd, recv_buffer, sizeof(recv_buffer));
  if (bytes_read > 0) {
    SPDLOG_INFO("Received: {}", recv_buffer);
    std::string incoming_input = recv_buffer;
    std::string incoming_command = getCommandFromInput(incoming_input);
    std::string incoming_message = getMessageFromInput(incoming_input);

    if (incoming_command == "msg"){
      handleClientMsg(incoming_message, fd);
    }
    else if (incoming_command == "register"){
      handleClientRegister(incoming_message, fd);
    }
    else if (incoming_command == "goto"){
      handleClientGoto(incoming_message, fd);
    }
    else if (incoming_command == "create"){
      handleChannelCreate(incoming_message, fd);
    }
    else if (incoming_command == "list"){
      handleChannelList(incoming_message, fd);
    }
    else{
      std::cout<<"Inappropriate command found on server"<<std::endl;
      std::cout<<"Available commands: msg, register, goto, create, list"<<std::endl;
    }
  } else if (bytes_read == 0) {
    SPDLOG_INFO("Client disconnected.");
    epoll_ctl(epoll_fd, EPOLL_CTL_DEL, fd, nullptr);
    close(fd);
  } else {
    SPDLOG_ERROR("Read error on client socket {}", fd);
    epoll_ctl(epoll_fd, EPOLL_CTL_DEL, fd, nullptr);
    close(fd);
  }
}

void tt::chat::server::Server::handleClientMsg(const std::string incoming_message, int fd){
  int client_id = fd;
  int channel_id = db.fetchClientsChannel(client_id);
  std::string message_to_send;
  if (channel_id == -1){
    message_to_send = "Please Goto some channel to send any message\n";
    send(fd, message_to_send.c_str(), message_to_send.size(), 0);
    return;
  }
  message_to_send = std::to_string(client_id) + ": " + incoming_message;
  std::vector<int> clients_in_channel = db.fetchChannelsClients(channel_id);
  for(auto clt: clients_in_channel){
    send(clt, message_to_send.c_str(), message_to_send.size(), 0);
  }
  return;
}
void tt::chat::server::Server::handleClientRegister(const std::string incoming_message, int fd){
  int client_id = fd;
  int channel_id;
  std::string message_to_send;

  try {
    channel_id = std::stoi(incoming_message);
  } catch (...) {
    message_to_send = "Invalid channel ID. Please enter a number.\n";
    send(fd, message_to_send.c_str(), message_to_send.size(), 0);
    return;
  }

  int status = db.addClientToChannel(client_id, channel_id);
  if (status == -1){
    message_to_send = "Please select a valid channel\n";
    send(fd, message_to_send.c_str(), message_to_send.size(), 0);
  }
  else{
    message_to_send = "You are now on channel: " + std::to_string(channel_id) + "\n";
    send(fd, message_to_send.c_str(), message_to_send.size(), 0);
  }
  return;
}
void tt::chat::server::Server::handleClientGoto(const std::string incoming_message, int fd){
  int client_id = fd;
  int channel_id;
  std::string message_to_send;

  try {
    channel_id = std::stoi(incoming_message);
  } catch (...) {
    message_to_send = "Invalid channel ID. Please enter a number.\n";
    send(fd, message_to_send.c_str(), message_to_send.size(), 0);
    return;
  }

  int status = db.addClientToChannel(client_id, channel_id);
  if (status == -1){
    message_to_send = "Please select a valid channel\n";
    send(fd, message_to_send.c_str(), message_to_send.size(), 0);
  }
  else{
    message_to_send = "You are now on channel: " + std::to_string(channel_id) + "\n";
    send(fd, message_to_send.c_str(), message_to_send.size(), 0);
  }
  return;
}
void tt::chat::server::Server::handleChannelCreate(const std::string incoming_message, int fd){
  int client_id = fd;
  int channel_id = db.createNewChannel();
  check_error(channel_id == -1, "Error creating new channel");
  int status = db.addClientToChannel(client_id, channel_id);
  check_error(status == -1, "Error adding client to channel");
  std::string message_to_send = "Channel ID created: " + std::to_string(channel_id) + "\n";
  send(fd, message_to_send.c_str(), message_to_send.size(), 0);
  return;
}
void tt::chat::server::Server::handleChannelList(const std::string incoming_message, int fd){
  std::string message_to_send = "Available Channels: ";
  std::vector<int> channels_list = db.fetchChannelList();
  for(auto channel_id: channels_list){
    std::string to_add = std::to_string(channel_id);
    message_to_send = message_to_send + to_add;
  }
  message_to_send += "\n";
  send(fd, message_to_send.c_str(), message_to_send.size(), 0);
  return;
}