#include "db-server.h"

Database::Database(){
  max_channel_id = 0;
}

Database::~Database(){}

int Database::takeLowestFreeChannelId(){
  max_channel_id++;
  return max_channel_id;
}

int Database::createNewChannel(){
  int channel_id = takeLowestFreeChannelId();
  std::vector<int> clients_vector;
  channel_to_clients[channel_id] = clients_vector;
  return channel_id;
}

int Database::fetchClientsChannel(int client_id){
  if (client_to_channel.find(client_id) == client_to_channel.end()){
    return -1;
  }
  return client_to_channel[client_id];
}

int Database::removeClientFromChannel(int client_id){
  int channel_id = fetchClientsChannel(client_id);
  if (channel_id != -1){
    client_to_channel[client_id] = -1;
    auto &v = channel_to_clients[channel_id];
    v.erase(std::remove(v.begin(), v.end(), client_id), v.end());
  }
  return 0;
}

int Database::addClientToChannel(int client_id, int channel_id){
  int status = removeClientFromChannel(client_id);
  if (channel_to_clients.find(channel_id) == channel_to_clients.end()) {
    return -1; // channel doesn't exist
  }
  channel_to_clients[channel_id].push_back(client_id);
  client_to_channel[client_id] = channel_id;
  return 0;
}

std::vector<int> Database::fetchChannelsClients(int channel_id){
  if (channel_to_clients.find(channel_id) == channel_to_clients.end()) {
    return std::vector<int>(); // channel doesn't exist
  }
  return channel_to_clients[channel_id];
}

std::vector<int> Database::fetchChannelList(){
  std::vector<int> channels_list;
  for(int i = 1; i <= max_channel_id; i++){
    channels_list.push_back(i);
  }
  return channels_list;
}