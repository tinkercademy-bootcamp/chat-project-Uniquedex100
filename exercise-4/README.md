# Exercise 4

**Update this README with your answers to the questions below.**

## Learning Multi-File C++ Projects

- Move code that can be shared between `tcp_echo_server.cc` and 
  `tcp_echo_client.cc` to separate `.h` and `.cc` files
  - Done, created tcp_echo.cpp and tcp_echo.h
- How would you compile from the command line?
  - g++ -c -g -fsanitize=address -O0 -std=c++17 tcp_echo_server.cpp -o build/server.o
  - g++ -c -g -fsanitize=address -O0 -std=c++17 tcp_echo_client.cpp -o build/client.o
  - g++ -c -g -fsanitize=address -O0 -std=c++17 tcp_echo.cpp -o build/echo.o
  - g++ build/echo.o build/server.o -g -fsanitize=address -o build/server
  - g++ build/echo.o build/client.o -g -fsanitize=address -o build/client
- How would you compile using make?
  - edited the makefile accordingly.
- How would you compile using VS Code?
  - Configure tasks.json to call makefile.
  - Also configure launch.json accordingly.

### Compiling vs Linking

- What is the difference between compiling and linking in C++?
  - Compiling involves generating object files from single cpp files, these object files contain a symbol table that contain information about the symbols (variables and functions) that are declared and defined in the compiled cpp file.
  It also includes a relocation table containing information about all the symbols that are not defined in here but are supposed to be taken from other files.
  - Linkinng involves linking the different object files together to make a final binary. This involves fetching definitions from symbol tables of files to the relocation tables of other files. This is a multiple pass process.

- What is the difference between creating an executable and creating a library?
  - Producing an executable means linking all the necessary object files and libraries to form a standalone program that can be directly run by the operating system. The executable must have an entry point (usually main() in C++) and include all the code needed to start and run the application.
  - Creating a library produces a reusable collection of compiled code that can be linked into other programs.
    - A static library (.lib or .a) is an archive of object files combined into one file; it gets linked into the final executable at build time.
    - A dynamic/shared library (.dll, .so, .dylib) is a separately compiled binary that is loaded at runtime or link time and shares code between multiple executables.
    Libraries do not have a program entry point and cannot run by themselves.

- How do you compile a library, and then use that library to compile an executable?
  - It's a muiltistep process; 
  - For static libraries: 
    1. Firstly, compile all the files into object files.
    2. Create static library files using the object files using archives.
    ar rcs ...
    3. Compile and link executable using the library.
  - For dynamic libraries: 
    1. Compile Object file as position independent code using -fPIC flag.
    2. Create a .so shared library file
    3. Compile and link executable using shared library file.
    4. Export the shared library path.
    5. Run the program with shared library.

### Reminder 
[Quickstart tutorial to make](https://makefiletutorial.com/) - Learn make 
fundamentals with practical examples and common patterns.

## Experiments in Performance

- Is it better to have many small files spread across many directories, or a few large files across fewer directories?
  - Each of them has it's own pros and cons: 
    - Many small file, organized across directories: 
    Modularity and clarity, scoped rebuilds
    - Few large files, in fewer directories: 
    Less overhead of compilation and linking
  - In medium to large projects, small, well-scoped files in a clear directory hierarchy are far superior in maintainability, testability, and build efficiency. Otherwise go for fewer files.
- Is there a difference in compilation time between the two?
  - Yes, indeed: 
    - Smaller files: Faster scoped rebuilds.
    - Larger files: Faster full builds.
  - However many modern compilers are able to parallelize the build process of smaller files well, so that is something to be taken care of. In such a case Smaller files will have a clear advantage over larger files.
- How can you assess performance other than compilation speed?
  - Incremental build time, Binary size, Memory usage (during build and linking), link time, Test build and execution time.