.PHONY: all clean compile link

SERVER_FILE = build/server
CLIENT_FILE = build/client
SERVER_OBJECT_FILE = build/server.o
CLIENT_OBJECT_FILE = build/client.o
SHARED_OBJECT_FILE = build/echo.o
EXPERIMENT_FILE = build/experiment
BUILD_DIRECTORY = build

CXX = g++
CXXFLAGS = -c -g -fsanitize=address -O0 -std=c++17
LDFLAGS = -fsanitize=address

all: build_dir link

build_dir:
	mkdir -p $(BUILD_DIRECTORY)

link: $(SERVER_OBJECT_FILE) $(CLIENT_OBJECT_FILE) $(SHARED_OBJECT_FILE)
	$(CXX) $(LDFLAGS) $(SHARED_OBJECT_FILE) $(SERVER_FILE) 

$(SERVER_OBJECT_FILE): tcp_echo_server.cpp
	$(CXX) $(CXXFLAGS) tcp_echo_server.cpp -o $(SERVER_OBJECT_FILE)

$(CLIENT_OBJECT_FILE): tcp_echo_client.cpp
	$(CXX) $(CXXFLAGS) tcp_echo_client.cpp -o $(CLIENT_OBJECT_FILE)

$(SHARED_OBJECT_FILE): tcp_echo.cpp
	$(CXX) $(CXXFLAGS) tcp_echo.cpp -o $(SHARED_OBJECT_FILE)

link: $(SERVER_FILE) $(CLIENT_FILE)

$(SERVER_FILE): 

clean:
	rm -rf $(BUILD_DIRECTORY) $(EXPERIMENT_FILE)
