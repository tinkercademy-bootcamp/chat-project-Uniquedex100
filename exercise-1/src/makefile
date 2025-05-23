.PHONY: all clean

SERVER_FILE = build/server
CLIENT_FILE = build/client
BUILD_DIRECTORY = build


all: build_dir server client

build_dir: 
		mkdir -p build

server: tcp_echo_server.cc
		g++ tcp_echo_server.cc -o $(SERVER_FILE)

client: tcp_echo_client.cc
		g++ tcp_echo_client.cc -o $(CLIENT_FILE)

clean: 
		rm -rf $(BUILD_DIRECTORY)
		
