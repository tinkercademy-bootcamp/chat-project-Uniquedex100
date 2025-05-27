.PHONY: all clean

SERVER_FILE = build/server
CLIENT_FILE = build/client
BUILD_DIRECTORY = build

CXX = g++
CXXFLAGS = -g -fsanitize=address
LDFLAGS = -fsanitize=address

all: build_dir server client

build_dir:
	mkdir -p $(BUILD_DIRECTORY)

server: tcp_echo_server.cc
	$(CXX) $(CXXFLAGS) tcp_echo_server.cc -o $(SERVER_FILE) $(LDFLAGS)

client: tcp_echo_client.cc
	$(CXX) $(CXXFLAGS) tcp_echo_client.cc -o $(CLIENT_FILE) $(LDFLAGS)

clean:
	rm -rf $(BUILD_DIRECTORY)
