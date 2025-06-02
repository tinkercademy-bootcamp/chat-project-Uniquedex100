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
        server.readIncomingInput(fd);
      }
    }
  }

  // Database db();

  return 0;
}
