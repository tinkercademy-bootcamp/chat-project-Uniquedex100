#include <arpa/inet.h>
#include <iostream>
#include <netinet/in.h>
#include <string>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>
#include <netdb.h>

int main(int argc, char* argv[]) {
  std::string message;
  // #Question - are these the same type?
  //  The one on the right is cstring, whereas the one on left is a std::string.
  if (argc > 1){
    message = argv[1];
  }
  else{
    message = "Hello m client";   
  }

  const std::string kServerHost = "ip-172-31-17-176"
  const int kPort = 35000;
  const string kPortString = "35000";
  // const std::string kServerAddress = "127.0.0.1";
  const std::string kServerAddress = "43.204.47.42";
  // const std::string kServerAddress = "::1"; // For ipv6 addresses

  sockaddr_in address;
  const int kBufferSize = 1024;
  char buffer[kBufferSize] = {0};

  // resolving hostname
  addrinfo hints{}, *res;
  hints.ai_family = AF_INET;
  hints.ai_socktype = SOCK_STREAM;
  int status = getaddrinfo(kServerHost.c_str(), kPortString.c_str(), &hints, &res);
  if (status != 0) {
    std::cerr << "getaddrinfo error: " << gai_strerror(status) << "\n";
    return -1;
  }

  // int my_sock = socket(res->ai_family, res->ai_socktype, res->ai_protocol);
  int my_sock = socket(AF_INET, SOCK_STREAM, 0);
  // int my_sock = socket(AF_INET6, SOCK_STREAM, 0); // For ipv6 addresses

  if (my_sock < 0) {
    std::cerr << "Socket creation erron\n";
    return -1;
  }
  address.sin_family = AF_INET;
  address.sin_port = htons(kPort);

  // Convert IPv4 and IPv6 addresses from text to binary form
  if (inet_pton(AF_INET, kServerAddress.c_str(), &address.sin_addr) <= 0) {
    std::cerr << "Invalid address/ Address not supported\n";
    return -1;
  }
  // if (inet_pton(AF_INET6, kServerAddress.c_str(), &address.sin6_addr) <= 0) { // For ipv6 addresses
  //   std::cerr << "Invalid IPv6 address/ Address not supported\n";
  //   return -1;
  // }

  // Connect to the server
  if (connect(my_sock, (sockaddr *)&address, sizeof(address)) < 0) {
    std::cerr << "Connection Failed\n";
    return -1;
  }
  // Send message
  send(my_sock, message.c_str(), message.size(), 0);
  std::cout << "Sent: " << message << "\n";
  // Wait for reply
  ssize_t read_size = read(my_sock, buffer, kBufferSize);
  std::cout << "Received: " << buffer << "\n";
  // Close the socket
  close(my_sock);
  return 0;
}