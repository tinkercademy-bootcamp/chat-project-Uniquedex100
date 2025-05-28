.PHONY: all clean link

SERVER_FILE = build/tcp_echo_server
CLIENT_FILE = build/tcp_echo_client
SERVER_OBJECT_FILE = build/tcp_echo_server.o
CLIENT_OBJECT_FILE = build/tcp_echo_client.o
SHARED_OBJECT_FILE = build/tcp_echo.o
EXPERIMENT_FILE = build/experiment
BUILD_DIRECTORY = build

CXX = g++
CXXFLAGS = -c -g -fsanitize=address -O0 -std=c++17
LDFLAGS = -g -fsanitize=address

all: build_dir $(SERVER_FILE) $(CLIENT_FILE)

build_dir:
	mkdir -p $(BUILD_DIRECTORY)

$(SERVER_FILE): $(SERVER_OBJECT_FILE) $(SHARED_OBJECT_FILE)
	$(CXX) $(LDFLAGS) $(SHARED_OBJECT_FILE) $(SERVER_OBJECT_FILE) -o $(SERVER_FILE)

$(CLIENT_FILE): $(CLIENT_OBJECT_FILE) $(SHARED_OBJECT_FILE)
	$(CXX) $(LDFLAGS) $(SHARED_OBJECT_FILE) $(CLIENT_OBJECT_FILE) -o $(CLIENT_FILE)

$(SERVER_OBJECT_FILE): tcp_echo_server.cpp
	$(CXX) $(CXXFLAGS) tcp_echo_server.cpp -o $(SERVER_OBJECT_FILE)

$(CLIENT_OBJECT_FILE): tcp_echo_client.cpp
	$(CXX) $(CXXFLAGS) tcp_echo_client.cpp -o $(CLIENT_OBJECT_FILE)

$(SHARED_OBJECT_FILE): tcp_echo.cpp
	$(CXX) $(CXXFLAGS) tcp_echo.cpp -o $(SHARED_OBJECT_FILE)

clean:
	rm -rf $(BUILD_DIRECTORY) $(EXPERIMENT_FILE)
