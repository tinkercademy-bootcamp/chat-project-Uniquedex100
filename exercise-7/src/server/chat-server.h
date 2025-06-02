#ifndef CHAT_SERVER_H
#define CHAT_SERVER_H

#include <netinet/in.h>
#include <string>
#include <sys/epoll.h>

namespace tt::chat::server {
class Server {
public:
  Server(int port);
  ~Server();
  void handle_connections();
  void acceptNewConnection();
  int getEpollFd() const {return epoll_fd; }
  int getSocketFd() const { return socket_; }

private:
  int socket_;
  int epoll_fd;
  sockaddr_in address_;
  epoll_event socket_event;

  static constexpr int kBufferSize = 1024;

  void handle_accept(int sock);
  static void set_socket_options(int sock, int opt);
};
} // namespace tt::chat::server

#endif // CHAT_SERVER_H
