#include <iostream>
#include <netinet/in.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>

#include "net/chat-sockets.h"
#include "utils.h"

namespace tt::chat {

class Server {
 public:
  int server_port;
  int server_socket;
  sockaddr_in server_address{};


  explicit Server(int port) : server_port(port) {
    server_socket = create_server_socket();
    server_address = create_server_address();
  }

  void start() {
    bind_address_to_socket(server_socket, server_address);
    listen_on_socket(server_socket);

    std::cout << "Server listening on port " << server_port << "\n";
    handle_connections(server_socket, server_address);
  }

  void set_socket_options(int sock, int opt) {
    auto err_code = setsockopt(sock, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT,
                             &opt, sizeof(opt));
    check_error(err_code < 0, "setsockopt() error\n");
  }

  int create_server_socket() {
    int sock = net::create_socket();
    set_socket_options(sock, 1);
    return sock;
  }

  sockaddr_in create_server_address() {
    sockaddr_in address = net::create_address(server_port);
    address.sin_addr.s_addr = INADDR_ANY;
    return address;
  }

  void bind_address_to_socket(int sock, sockaddr_in &address) {
    auto err_code = bind(sock, (sockaddr *)&address, sizeof(address));
    check_error(err_code < 0, "bind failed\n");
  }

  void listen_on_socket(int sock) {
    auto err_code = listen(sock, 3);
    check_error(err_code < 0, "listen failed\n");
  }

  void handle_connections(int sock, sockaddr_in &address) {
    socklen_t address_size = sizeof(address);

    while (true) {
      int accepted_socket = accept(sock, (sockaddr *)&address, &address_size);
      check_error(accepted_socket < 0, "Accept error n ");
      handle_accept(accepted_socket);
    }
  }

  void handle_accept(int sock) {
    const int kBufferSize = 1024;
    char buffer[kBufferSize] = {0};
    ssize_t read_size = read(sock, buffer, kBufferSize);

    check_error(read_size < 0,
                    "Read error on client socket " + std::to_string(sock));
    if (read_size > 0) {
      std::cout << "Received:" << buffer << "\n";
      send(sock, buffer, read_size, 0);
      std::cout << "Echo message sent\n";
    } else if (read_size == 0) {
      std::cout << "Client disconnected.\n";
    } else {
      std::cerr << "Read error on client socket " << sock << "\n";
    }
    close(sock);
  }
};
}  // namespace tt::chat

int main() {
  const int kPort = 8080;

  tt::chat::Server server(kPort);
  server.start();
  return 0;
}
