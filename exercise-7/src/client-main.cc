#include <arpa/inet.h>
#include <cstdlib>
#include <iostream>
#include <netinet/in.h>
#include <string>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>

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
    std::string response = client.send_and_receive_message(input_message);
    std::cout<<response<<std::endl;
  }
  return 0;
}
