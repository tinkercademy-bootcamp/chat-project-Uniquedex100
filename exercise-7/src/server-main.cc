#include <netinet/in.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>

#include "server/chat-server.h"
#include "server/db-server.h"

int main() {
  const int kPort = 8080;
  const int max_clients = 10;
  // epoll_event events[max_clients];

  tt::chat::server::Server server(kPort);
  // Database db();

  server.handle_connections();
  return 0;
}
