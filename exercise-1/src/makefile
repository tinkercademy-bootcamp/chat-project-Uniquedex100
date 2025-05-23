.PHONY: all clean

SERVER_FILE = build/server
CLIENT_FILE = build/client
BUILD_DIRECTORY = build


all: build_dir server client

build_dir: 
		mkdir -p build

server: 
		gcc server.cpp -o $(SERVER_FILE)

client: 
		gcc client.cpp -o $(CLIENT_FILE)

clean: 
		rm -rf build
		
