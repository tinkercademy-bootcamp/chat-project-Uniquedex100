#include <arpa/inet.h>
#include <cstdlib>
#include <iostream>
#include <netinet/in.h>
#include <string>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>

#include "net/chat-sockets.h"
#include "utils.h"


namespace tt::chat {

class Client{
  public: 
  int kPort; 
  std::string kServerAddress;
  std::string message;
  int my_socket; 
  sockaddr_in server_address{};

  explicit Client(int argc, char *argv[]){
    kPort = 8080;
    kServerAddress = "127.0.0.1";
    message = read_args(argc, argv);
    my_socket = net::create_socket();
    server_address = create_server_address(kServerAddress, kPort);
  }

  void start(){
    connect_to_server(my_socket, server_address);
    send_and_receive_message(my_socket, message);
    close(my_socket);
  }

  sockaddr_in create_server_address(const std::string &server_ip, int port) {
    sockaddr_in address = net::create_address(port);
    // Convert the server IP address to a binary format
    auto err_code = inet_pton(AF_INET, server_ip.c_str(), &address.sin_addr);
    check_error(err_code <= 0, "Invalid address/ Address not supported\n");
    return address;
  }

  void connect_to_server(int sock, sockaddr_in &server_address) {
    auto err_code = connect(sock, (sockaddr *)&server_address, sizeof(server_address));
    check_error(err_code < 0, "Connection Failed.\n");
  }

  void send_and_receive_message(int sock, const std::string &message) {
    const int kBufferSize = 1024;
    char recv_buffer[kBufferSize] = {0};

    // Send the message to the server
    send(sock, message.c_str(), message.size(), 0);
    std::cout << "Sent: " << message << "\n";

    // Receive response from the server
    ssize_t read_size = read(sock, recv_buffer, kBufferSize);
    check_error(read_size < 0, "Read error.\n");
    if (read_size > 0) {
      std::cout << "Received: " << recv_buffer << "\n";
    } else if (read_size == 0) {
      std::cout << "Server closed connection.\n";
    }
  }

  std::string read_args(int argc, char *argv[]) {
    std::string message = "Hello from client";
    if (argc == 1) {
      std::cout << "Usage: " << argv[0] << " <message>\n";
      exit(EXIT_FAILURE);
    }
    if (argc > 1) {
      message = argv[1];
    }
    return message;
  }
};
}

int main(int argc, char *argv[]) {

  tt::chat::Client client(argc, argv);
  client.start();
  
  return 0;
}
