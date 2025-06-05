#ifndef CHAT_SOCKETS_H
#define CHAT_SOCKETS_H

#include <arpa/inet.h>
#include <iostream>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>
#include <string>
#include <algorithm>
#include <cctype>


#include "../utils.h"

const std::string TERMINATION_COMMANDS[] = {"exit", "quit", "terminate"};
const char SEPARATION_CHARACTER = '/';

namespace tt::chat::net {
int create_socket();
sockaddr_in create_address(int port);
} // namespace tt::chat::net

std::string trim(std::string &input);
std::string toLower(std::string &input);
bool checkTermination(std::string &input_command);
std::string getCommandFromInput(std::string &input_received);
std::string getMessageFromInput(std::string &input_received);

#endif // CHAT_SOCKETS_H
