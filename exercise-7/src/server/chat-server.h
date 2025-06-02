#ifndef CHAT_SERVER_H
#define CHAT_SERVER_H

#include <netinet/in.h>
#include <string>
#include <sys/epoll.h>
#include "db-server.h"

namespace tt::chat::server {
class Server {
public:
  Server(int port);
  ~Server();
  void acceptNewConnection();
  void readIncomingInput(int fd);
  int getEpollFd() const {return epoll_fd; }
  int getSocketFd() const { return socket_; }

private:
  Database db;
  int socket_;
  int epoll_fd;
  sockaddr_in address_;
  epoll_event socket_event;

  static constexpr int kBufferSize = 1024;

  static void setSocketOptions(int sock, int opt);
  void handleClientMsg(std::string incoming_message, int fd);
  void handleClientRegister(std::string incoming_message, int fd);
  void handleClientGoto(std::string incoming_message, int fd);
  void handleChannelCreate(std::string incoming_message, int fd);
  void handleChannelList(std::string incoming_message, int fd);
};
} // namespace tt::chat::server

#endif // CHAT_SERVER_H
