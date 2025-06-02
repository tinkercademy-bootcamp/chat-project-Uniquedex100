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

void tt::chat::server::Server::readIncomingMessage(int fd){
  char recv_buffer[kBufferSize] = {0};
  ssize_t bytes_read = read(fd, recv_buffer, sizeof(recv_buffer));
  if (bytes_read > 0) {
    SPDLOG_INFO("Received: {}", recv_buffer);
    send(fd, recv_buffer, bytes_read, 0);  // echo
    SPDLOG_INFO("Echo message sent");
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

void tt::chat::server::Server::setSocketOptions(int sock, int opt) {
  using namespace tt::chat;
  auto err_code = setsockopt(sock, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT,
                             &opt, sizeof(opt));
  check_error(err_code < 0, "setsockopt() error\n");
}