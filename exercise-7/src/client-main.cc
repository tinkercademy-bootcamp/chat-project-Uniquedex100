#include <arpa/inet.h>
#include <cstdlib>
#include <iostream>
#include <netinet/in.h>
#include <string>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>
#include <thread>

#include "client/chat-client.h"
#include "net/chat-sockets.h"

namespace {
std::string read_args(int argc, char *argv[]) {
  using namespace tt::chat;
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
}

int main() {
  const int kPort = 8080;
  const std::string kServerAddress = "127.0.0.1";
  tt::chat::client::Client client{kPort, kServerAddress};

  const int max_events = 2;
  epoll_event events[max_events];
  char recv_buffer[1024];

  while(true){
    int nfds = epoll_wait(client.getEpollFd(), events, max_events, -1);
    if (nfds == -1) {
      perror("epoll_wait failed");
      break;
    }

    for (int i = 0; i < nfds; ++i) {
      int fd = events[i].data.fd;
      if (fd == STDIN_FILENO) {
        std::string input_received;
        std::getline(std::cin, input_received);  // getline helps get full lines
        std::string input_command = getCommandFromInput(input_received);
        std::string input_message = getMessageFromInput(input_received);

        if (checkTermination(input_command)) {
          std::cout << "Exiting..."<<std::endl;
          return 0;
        } 
        else if (input_command == "msg") {
          client.clientSendMsg(input_received);
        } 
        else if (input_command == "register") {
          client.clientSendRegister(input_received);
        } 
        else if (input_command == "goto") {
          client.clientSendGoto(input_received);
        } 
        else if (input_command == "create") {
          client.clientSendCreate(input_received);
        } 
        else if (input_command == "list") {
          client.clientSendList(input_received);
        } 
        else{
          std::cout<<"Inappropriate command found, usage: "<<std::endl;
          std::cout<<"Command/Message"<<std::endl;
          std::cout<<"Available commands: msg, register, goto, create, list";
        }
      }
      else if (fd == client.getSocketFd()) {
        std::cout<<"client received something"<<std::endl;
        std::memset(recv_buffer, 0, sizeof(recv_buffer));
        ssize_t read_size = read(fd, recv_buffer, 1024);
        if (read_size > 0) {
          std::cout << "Server: " << std::string(recv_buffer) << std::endl;
        } else if (read_size == 0) {
          std::cout << "Server closed connection.\n";
        } else {
          perror("read from socket failed");
        }
      }
    }
  }
  return 0;
}
