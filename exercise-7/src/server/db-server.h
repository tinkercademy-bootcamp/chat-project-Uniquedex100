#ifndef DB_SERVER_H
#define DB_SERVER_H

#include <iostream>
#include <algorithm>
#include <map>
#include <vector>
#include <string>

class MsgEntry{

};

// Using socket as clientUID for now, will update later
class ClientEntry{
public: 
  ClientEntry(int clientSocket);
  ~ClientEntry();

private:
  int clientId;
  std::string clientUsername;
};

class Database{
public: 
  Database();
  ~Database();
  int takeLowestFreeChannelId();
  int createNewChannel();
  int fetchClientsChannel(int client_id);
  int removeClientFromChannel(int client_id);
  int addClientToChannel(int client_id, int channel_id);

private: 
  int max_channel_id;
  std::map<int, std::vector<int>> channel_to_clients;
  std::map<int, int> client_to_channel;
  std::map<int, std::vector<MsgEntry>> channel_to_msgs;
  std::map<int, std::string> client_to_username;
};

#endif