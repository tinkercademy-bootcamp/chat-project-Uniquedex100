#include "chat-sockets.h"

int tt::chat::net::create_socket() {
  int sock = socket(AF_INET, SOCK_STREAM, 0);
  tt::chat::check_error(sock < 0, "Socket creation error\n");
  return sock;
}

sockaddr_in tt::chat::net::create_address(int port) {
  sockaddr_in address;
  address.sin_family = AF_INET;
  address.sin_port = htons(port);
  return address;
}

std::string trim(std::string &input){
    size_t start = input.find_first_not_of(' ');
    if (start == std::string::npos) return "";
    size_t end = input.find_last_not_of(' ');
    return input.substr(start, end - start + 1);
}

std::string toLower(std::string &input) {
    std::string result = input;
    std::transform(result.begin(), result.end(), result.begin(),
                  [](unsigned char c) { return std::tolower(c); });
    return result;
}

bool checkTermination(std::string &input_command){
  for(auto command : TERMINATION_COMMANDS){
    if (command == input_command) return true;
  }
  return false;
}

std::string getCommandFromInput(std::string &input_received){
  std::string input_command = "";
  for (char character : input_received){
    if (character == SEPARATION_CHARACTER) break;
    input_command += character;
  }
  input_command = trim(input_command);
  input_command = toLower(input_command);
  return input_command;
}

std::string getMessageFromInput(std::string &input_received){
  std::string input_message = "";
  bool flag = false;
  for (auto character : input_received){
    if (flag) input_message += character;
    if (character == SEPARATION_CHARACTER) flag = true;
  }
  input_message = toLower(input_message);
  return input_message;
}