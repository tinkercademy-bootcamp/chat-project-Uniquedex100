# Exercise 6

**Update this README with your answers to the questions below.**

## Adding Third Party Libraries or Source Code to Your Project

- There is a new file `src/spdlog-hello-world-main.cc`
- It uses the spdlog and fmt libraries. 
  [More info here](https://github.com/gabime/spdlog) - Fast C++ logging library with various sink types and formatting options
- How do you compile this file using the `g++` CLI?
  - Firstly, we need to install this library, using the command: 
    sudo apt install libspdlog-dev
  - For compiling, we use the traditional command.
  - While linking, we provide an additional flag called -lspdlog that tells the linker to look for a library named libspdlog.so or libspdlog.a (dynamic or static) which contain implementation of spdlog's functions.

- What do you need to change in your makefile to use this library?
  - Currently, this file is not being used in the code. But if we want to use this file. Firstly, we need to use it in the .c files. Then while linking all the other object files, we need to add this file too, along with the flag -lspdlog.

- How many different ways can this library be added into your project?
  - There are multiple ways: 
    - Header only include: Copy the include directory or link it directly.
    - System wide install using package manager
    - Using a package manager (like vcpkg or else)
- What are the tradeoffs in the different ways?
  - Header only: Easiest and portable, but bloats compile time
  - Systemwide: Simplifies builds, but reduces portability
  - Packagemanagers: Manage dependencies well, but require tools setup.
- Why are there so many different ways to do it?
  Primarily because the use-cases differ. Sometimes, we may prioritize performance while at other times our main priority might be simplicity. Another reason might be the long C++ history, and the multitude of platforms and build systems C++ needs to support.
  
## Static Linking vs Dynamic Linking

- What are the differences between static linking and dynamic linking?
  - In static linking, all the code from the libraries is included in the final executable at the compile time.
  - In dynamic linking, libraries are separate, and the executable loads them at runtime.

- What are the tradeoffs?
  - Static linking: Distribution of binary is easier, as the code is bundled, but it increases binary size exponentially and has high rebuild times too.
  - Dynamic linking: Reduces binary size, allows updates to libraries without recompiles. Introduces dependency management issues and potential runtime failures.

- How do you enable static linking or dynamic linking in your makefile?
  - Static linking: Use .a files and specify library paths.
  - Dynamic linking: link with -l<lib> and .so and .dll files are in the runtime path.

## Git Clone and Building from Source

- Where is `g++` looking for the include files and library files?
  - while compiling, g++ looks in the default system paths (/usr/include) and (/usr/lib). If a particular library is not in the default location, we need to specify the include path using -I and library path using flag -L.

- How do you find out?
  - To find out where g++ is looking, we can use the verbose flag (-v). This prints verbose outputs, including the search paths. 

## C++ Package Managers

- Why are there so many C++ package managers?
  - Because of history of C++, in earlier days C++ did not standardize any packaging or build tool, and therefore differenct ecosystems evolved with different needs.

- Which one is the best one?
  - No-one's the best, depends on the needs.
    - vcpkg is popular amongst windows users and integrates easily with CMake.
    - conan is flexible and has large repository of libraries.
    - xrepo is useful for cross platform development

- Which are the most notable ways to manage the compilation of C++ projects?
  - Manual makefiles
  - Build systems like CMake or Meson
  - Dependency Management using Package managers like conan or vcpkg