#include "chat-client.h"
#include "../net/chat-sockets.h"
#include "../utils.h"

tt::chat::client::Client::Client(int port, const std::string &server_address)
    : socket_{tt::chat::net::create_socket()},
    epoll_fd{epoll_create1(0)} {
  int status = 0;
  check_error(epoll_fd == -1, "epoll_create1 failed");

  sockaddr_in address = createServerAddress(server_address, port);
  connectToServer(socket_, address);
  
  int flags = fcntl(socket_, F_GETFL, 0);
  check_error(flags == -1, "fcntl get flags failed");
  status = fcntl(socket_, F_SETFL, flags | O_NONBLOCK);
  check_error(status == -1, "fcntl set flags O_NONBLOCK failed");

  socket_event.events = EPOLLIN | EPOLLET;
  socket_event.data.fd = socket_;
  status = epoll_ctl(epoll_fd, EPOLL_CTL_ADD, socket_, &socket_event);
  check_error(status == -1, "epoll_ctl socket failed");

  stdin_event.events = EPOLLIN | EPOLLET;
  stdin_event.data.fd = STDIN_FILENO;
  status = epoll_ctl(epoll_fd, EPOLL_CTL_ADD, STDIN_FILENO, &stdin_event);
  check_error(status == -1, "epoll_ctl stdin failed");
}

std::string tt::chat::client::Client::send_and_receive_message(
    const std::string &message) {
  using namespace tt::chat;
  char recv_buffer[kBufferSize] = {0};

  // Send the message to the server
  send(socket_, message.c_str(), message.size(), 0);
  std::cout << "Sent: " << message << "\n";

  // Receive response from the server
  ssize_t read_size = read(socket_, recv_buffer, kBufferSize);
  if (read_size > 0) {
    return std::string(recv_buffer);
  } else if (read_size == 0) {
    return "Server closed connection.\n";
  } else {
    return "Read error.\n";
  }
}

void tt::chat::client::Client::clientSendMsg(const std::string &message){
  using namespace tt::chat;
  send(socket_, message.c_str(), message.size(), 0);
  std::cout << "Sent: " << message << "\n";
}
void tt::chat::client::Client::clientSendRegister(const std::string &message){
  using namespace tt::chat;
  send(socket_, message.c_str(), message.size(), 0);
  std::cout << "Sent: " << message << "\n";
}
void tt::chat::client::Client::clientSendGoto(const std::string &message){
  using namespace tt::chat;
  send(socket_, message.c_str(), message.size(), 0);
  std::cout << "Sent: " << message << "\n";
}
void tt::chat::client::Client::clientSendCreate(const std::string &message){
  using namespace tt::chat;
  send(socket_, message.c_str(), message.size(), 0);
  std::cout << "Sent: " << message << "\n";
}
void tt::chat::client::Client::clientSendList(const std::string &message){
  using namespace tt::chat;
  send(socket_, message.c_str(), message.size(), 0);
  std::cout << "Sent: " << message << "\n";
}
void tt::chat::client::Client::clientSendUsername(const std::string &message){
  using namespace tt::chat;
  send(socket_, message.c_str(), message.size(), 0);
  std::cout << "Sent: " << message << "\n";
}

tt::chat::client::Client::~Client() { close(socket_); close(epoll_fd);}

sockaddr_in tt::chat::client::Client::createServerAddress(
    const std::string &server_ip, int port) {
  using namespace tt::chat;
  sockaddr_in address = net::create_address(port);
  // Convert the server IP address to a binary format
  auto err_code = inet_pton(AF_INET, server_ip.c_str(), &address.sin_addr);
  check_error(err_code <= 0, "Invalid address/ Address not supported\n");
  return address;
}

void tt::chat::client::Client::connectToServer(
    int sock, sockaddr_in &server_address) {
  using namespace tt::chat;
  auto err_code =
      connect(sock, (sockaddr *)&server_address, sizeof(server_address));
  check_error(err_code < 0, "Connection Failed.\n");
}
