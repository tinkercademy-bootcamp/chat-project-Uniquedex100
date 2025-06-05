#ifndef CHAT_CLIENT_H
#define CHAT_CLIENT_H

#include <netinet/in.h>
#include <string>
#include <sys/epoll.h>

namespace tt::chat::client {
class Client {
public:
  int getEpollFd() const { return epoll_fd; }
  int getSocketFd() const { return socket_; }

  Client(int port, const std::string &server_address);
  std::string send_and_receive_message(const std::string &message);
  void clientSendMsg(const std::string &message);
  void clientSendRegister(const std::string &message);
  void clientSendGoto(const std::string &message);
  void clientSendCreate(const std::string &message);
  void clientSendList(const std::string &message);
  void clientSendUsername(const std::string &message);

  ~Client();

private:
  int socket_;
  int epoll_fd;
  epoll_event socket_event;
  epoll_event stdin_event;
  sockaddr_in createServerAddress(const std::string &server_ip, int port);
  void connectToServer(int sock, sockaddr_in &server_address);

  static constexpr int kBufferSize = 1024;
};
} // namespace tt::chat::client

#endif // CHAT_CLIENT_H
