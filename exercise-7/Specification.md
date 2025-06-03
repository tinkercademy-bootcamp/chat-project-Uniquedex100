# Chat Server Specification

---

## Part 1: For Users

### Overview

This chat server enables multiple clients to connect simultaneously, join or create chat channels, and exchange messages in real-time within those channels. Each client can be part of multiple channels but listens and sends messages only on their current active channel.

### Features

- Supports multiple concurrent clients using `epoll` for scalable network I/O.
- Users can **list all available channels**.
- Users can **create new channels**.
- Users can **join or switch (goto) channels** they have registered with.
- Messages sent by a user in a channel are broadcasted to all users currently in that channel.
- Each client maintains a "current channel" which determines which messages they receive and to which channel they send messages.

### User API Commands

- `list/`  
  Lists all channels available on the server along with their unique channel IDs.

- `create/`  
  Creates a new chat channel. Returns a new unique channel ID to the user, who will also automatically join this new channel.

- `register/<channel-id>`  
  Registers the user to the specified channel. For now, this is equivalent to joining the channel.

- `goto/<channel-id>`  
  Switches the user's current channel to the specified channel if the user is already registered with it. The user will receive all messages sent to this channel.

- `msg/<message>`  
  Sends a message to the current channel. All users currently in that channel will receive this message.

### Usage Notes

- Commands are sent as strings formatted as `command/parameters`.
- Clients only receive messages from their current active channel.
- Usernames aren't currently implemented, because I plan to implement them once user login/auth are done.
- No persistent file storage; all state is maintained in-memory during runtime.

---

## Part 2: For Codevelopers

### Architecture & Internal Details

#### Concurrency Model

- The server uses `epoll` for handling multiple client connections asynchronously.
- This allows efficient multiplexing of I/O events for large numbers of clients.

#### Data Structures

- **Channel to Clients Mapping:**  
  `map<int, vector<int>>` — maps each channel ID to a list of client IDs currently in that channel.

- **Client to Current Channel Mapping:**  
  `map<int, int>` — maps each client ID to the current channel ID the client is active in.

- **Channel Message History:**  
  `map<int, vector<MsgEntry>>` — maintains a message history for each channel, storing all sent messages (MsgEntry contains message text, sender, timestamp, etc.).

- **Client Usernames:**  
  `map<int, string>` — maps client IDs to usernames stored in the client object.

- **Unique Client Identifiers:**  
  Every connected client is assigned a unique integer ID on connection to track them internally.

#### Server Database Functionalities

- `createNewChannel()`  
  Creates a new channel and returns its unique channel ID.

- `fetchClientsChannel(client_id)`  
  Returns the current active channel ID for the client or `-1` if none assigned.

- `addClientsToChannel(client_id, channel_id)`  
  Adds the client to the specified channel and removes the client from their previous channel(s) if applicable.

#### File Management and Build System

- To avoid frequent changes in the build system (Makefile), no external database libraries or persistent file storage are used.
- All state is kept in memory to simplify compilation and deployment.
- Source files are modular:
  - `server-main.cc` & `client-main.cc` contain the entry points for server and client, respectively.
  - `chat-server.cc/h` contain server-side logic and data structures.
  - `chat-client.cc/h` contain client-side logic.
  - `chat-sockets.cc/h` contain socket utility functions shared between client and server, along with common string operations that I wanted to share.
  - `utils.h` contains spdlog and ncurses utilities.
  - `db-server.h` and `db-server.cc` contain the databases which maintain all the data structures specified above.

#### Client Types

- **Static Client:** Predefined commands scripted for automated tests.
- **Dynamic Client:** Interactive CLI client reading commands from the user and sending to the server.

#### Messaging Protocol

- All client-server messages follow the format:  
  `"command/parameters"`  
  Commands include `msg`, `register`, `goto`, `create`, `list`.
- An escape character mechanism is planned for special characters in messages (implementation pending).

#### Development Progression

1. Server startup: Initialize and listen on a socket using `epoll`.
2. Client connection: Assign unique IDs, initialize client data.
3. Command handling: Parse incoming commands and update data structures.
4. Broadcast: Send messages to all clients in a channel.
5. Support simultaneous clients via epoll-based event loop.
6. Implement shell script to launch multiple client instances simultaneously for testing.

---

### Notes

- User login and username authentication are planned but not yet implemented.
- The server currently assumes open access: any client can join or create any channel.
- Future iterations may include authentication, persistent storage, and more sophisticated channel management.
