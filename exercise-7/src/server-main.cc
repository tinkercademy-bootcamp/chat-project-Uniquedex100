#include <netinet/in.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>

#include "server/chat-server.h"
#include "server/db-server.h"
#include "net/chat-sockets.h"

int main() {
  const int kPort = 8080;
  tt::chat::server::Server server(kPort);

  const int max_clients = 10;
  epoll_event events[max_clients];
  char recv_buffer[1024];

  while(true){
    int nfds = epoll_wait(server.getEpollFd(), events, max_clients, -1);
    if (nfds == -1){
      perror("epoll_wait failed");
      break;
    }

    for (int i = 0; i < nfds; i++){
      int fd = events[i].data.fd;
      if (fd == server.getSocketFd()){
        server.acceptNewConnection();
      }
      else{
        memset(recv_buffer, 0, 1024);
        ssize_t bytes_read = read(fd, recv_buffer, sizeof(recv_buffer));
        if (bytes_read > 0) {
          SPDLOG_INFO("Received: {}", recv_buffer);
          send(fd, recv_buffer, bytes_read, 0);  // echo
          SPDLOG_INFO("Echo message sent");
        } else if (bytes_read == 0) {
          SPDLOG_INFO("Client disconnected.");
          epoll_ctl(server.getEpollFd(), EPOLL_CTL_DEL, fd, nullptr);
          close(fd);
        } else {
          SPDLOG_ERROR("Read error on client socket {}", fd);
          epoll_ctl(server.getEpollFd(), EPOLL_CTL_DEL, fd, nullptr);
          close(fd);
        }
      }
    }
  }

  // Database db();

  return 0;
}
