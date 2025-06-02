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

  std::string input_received = "";
  std::string input_command = "";
  std::string input_message = "";
  while(true){
    std::cin >> input_received;
    input_command = getCommandFromInput(input_received);
    input_message = getMessageFromInput(input_received);

    if (checkTermination(input_command)){break;}
    else if(input_command == "msg"){
      client.clientSendMsg(input_message);
    }
    else if(input_command == "register"){
      client.clientSendRegister(input_message);
    }
    else if(input_command == "goto"){
      client.clientSendGoto(input_message);
    }
    else if(input_command == "create"){
      client.clientSendCreate(input_message);
    }
    else if(input_command == "list"){
      client.clientSendList(input_message);
    }
    else{
      std::cout<<"Inappropriate command found, usage: "<<std::endl;
      std::cout<<"Command/Message"<<std::endl;
      std::cout<<"Available commands: msg, register, goto, create, list";
    }
  }
  return 0;
}
