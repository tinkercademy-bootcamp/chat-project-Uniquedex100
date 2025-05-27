.PHONY: all clean

SERVER_FILE = build/server
CLIENT_FILE = build/client
EXPERIMENT_FILE = experiment
BUILD_DIRECTORY = build

CXX = g++
CXXFLAGS = -g -fsanitize=address -O0 -std=c++17
LDFLAGS = -fsanitize=address

all: build_dir server client

build_dir:
	mkdir -p $(BUILD_DIRECTORY)

server: tcp_echo_server.cc
	$(CXX) $(CXXFLAGS) tcp_echo_server.cc -o $(SERVER_FILE) $(LDFLAGS)

client: tcp_echo_client.cc
	$(CXX) $(CXXFLAGS) tcp_echo_client.cc -o $(CLIENT_FILE) $(LDFLAGS)

experiment: experiment.cc
	$(CXX) $(CXXFLAGS) experiment.cc -o $(EXPERIMENT_FILE) $(LDFLAGS)

clean:
	rm -rf $(BUILD_DIRECTORY) $(EXPERIMENT_FILE)
