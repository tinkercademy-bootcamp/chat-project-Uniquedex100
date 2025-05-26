# Exercise 1

**Update this README with your answers to the questions below.**

## Learning How to Learn

- Answer the following questions in this file and commit and push your changes.
- Bonus sections are more difficult and optional.
- How can you find the information required to complete these tasks?
- How can you tell if the source of your information is good?
- How would you define "good" in this situation?

## Learn Basics of g++ CLI

- Compile the TCP client and server using `g++` from command line.
- What are the most important command line arguments to learn for `g++`?
  - The -o that is used to specify the output file, the optimization flags which are used for specifying optimizations while compiling the code, the -I that is used to add a directory where we can search for header files, -Werror that treats all the warnings as errors, C++ standards: -std=c++17 and all that allow us to specify the c++ standards.

- What is the difference between debug vs release versions?
  - Debug versions are made while the program is still being written, helps us debug the code easily, whereas release version is targeted towards delivering the final product.
g++ flags for release build:  -O2, -DNDEBUG, etc.
g++ flags for debug build: -g, -O0, -Wall, etc.
- What are the tradeoffs between debug and release versions?
  - Debug version: Slower execution, Larger binary size(includes debug symbols), easier to debug, code structure is preserved, tracable, etc.
Release version: Optimized for faster execution, smaller binary sizes, really hard to debug, code structure is altered, nontracable, stacks may be unclear, etc.
- What arguments would you use in a debug build?
  - g++ flags for debug build: -g, -O0, -Wall, etc.
- What about for release?
  - g++ flags for release build:  -O2, -DNDEBUG, etc.
- What other kinds of build types are useful?
  - RelWithDebInfo: Optimized performance and the ability to debug.
MinSizeRel: When we need to reduce the binary size
Testing/Coverage builds, etc.

## Learn Basics of Make

- Create a Makefile that will speed up the process.
- [Quickstart tutorial to make](https://makefiletutorial.com/) - Learn make fundamentals with practical examples and common patterns.
- How else can you learn about make?
  - Using official documentation.
- How can you tell if the resource you are using is correct?
  - Because it is official and verified.
- Create a makefile such that when you run `make` with no arguments, it will:
  - Create `build/` directory if it does not exist
  - Create executables **client** and **server** in `build/`, if needed
  - How does make know when it needs to rebuild the executables?
Rebuild happens if either the target file does not exist, or any dependency is newer than the target.
  - Change your Makefile such that `make clean` will remove `build/` and all its contents
    - Done
- What are the most important command line arguments to learn for make?
  - target: Just after the make command.
  - -j: run n jobs in parallel
  - VARIABLE=value: override makefile variables on the command line.
- What are the most important directives to learn about in Makefile?
  - target: dependencies
  commands
  - Pattern rules: allow defining rules for multiple files using patterns: 
  - % character acts as a wildcard.
  - variable definitions
  - Include directives for makefiles (to add rules from other makefiles)
  - Conditional directives for makefiles (ifdef else endif)
  - Phony targets: do not represent files, such as clean and all.
  They are always executed when called.
  $@: The target file name.
  $<: The first dependency.
  $^: All dependencies.
- What are the most important commands to implement in your Makefile?
  - directives for all and clean.
- Which ones are essential, which ones are nice to haves?
  - all is essential, clean is nice to have.

## Learn Basics of Git

- Read through the code in `src/`
- Answer any `#Questions` as a comment
- Commit and push your changes to git
  - Done
- Each commit should be responding to a single task or question
  - Will keep in mind now onwards
- Why is it important to keep your commit to a single task or question?
  - Saves time that we might have to put for searching commits.
- Is it better to have a lot of very small commits, or one big commit when everything is working?
  - Once everything is working, we should shift towards just having one big commit.
- What are the most important commands to know in git?
  checkout
  add
  push
  pull
  rebase
  commit etc.

## Introduction to Sockets

- Read the code in `src/tcp-echo-client.cc` and add a way to change the message sent using command line arguments
Done
- **Example**: `./client "hello message from the command prompt"` should send
  `"hello message from the command prompt"` to the server
- Commit your changes into git
Done
- What do all these headers do?
  - They are for input output stream, basic socket instructions, some types, socket addresses, system data types, read write etc.
- How do you find out which part of the below code comes from which header?
  - we can use the manual pages for this. Like man 2 socket, man 3 cout, etc.
  section 2 is for system calls, section 3 is for library functions and so on...
- How do you change the code so that you are sending messages to servers other than localhost?
  - Change the port number to 35000 and use the ip address of the other server that's publicly visible.
- How do you change the code to send to a IPv6 address instead of IPv4?
  - use AF_INET6, address.sin6_addr etc. wherever you have used normal versions. They would help you adjust the data type sizes so that it can accommodate the much larger ipv6 addresses.
- **Bonus**: How do you change the client code to connect by hostname instead
  of IP address?
  - use netdb.h to get the ip addresses from hostnames,

  
## Introduction to Memory Management

- What is happening in line 26 of `tcp-echo-client.cc`? 
  `if (inet_pton(AF_INET, kServerAddress.c_str(), &address.sin_addr) <= 0) {`

Function: inet_pton converts an IP address from text to binary form.
Parameters:\
AF_INET: Specifies IPv4.\
kServerAddress.c_str(): A const char* representation of the server's IP address (e.g., "127.0.0.1").\
&address.sin_addr: Pointer to the sin_addr field of a sockaddr_in struct where the result (binary IP) will be stored.

- What is happening in line 31 of `tcp-echo-client.cc`?
  `if (connect(my_sock, (sockaddr *)&address, sizeof(address)) < 0) {`

Function: connect initiates a connection to a remote socket. \
Parameters: \
my_sock: The file descriptor for the socket. \
(sockaddr *)&address: The server's socket address, cast to generic sockaddr*. \
sizeof(address): The size of the address structure.

- What is the difference between a pointer and a reference?


| Feature               | Pointer                                | Reference                            |
|-----------------------|----------------------------------------|--------------------------------------|
| Definition            | Variable storing a memory address      | Alias for another variable           |
| Syntax                | `int* ptr = &x;`                        | `int& ref = x;`                      |
| Nullability           | Can be null (`nullptr`)                | Cannot be null                       |
| Reassignment          | Can point to another variable          | Cannot be reassigned                 |
| Dereferencing         | Required (`*ptr`)                      | Not required (`ref` is value)        |
| Own Address           | Has its own address (`&ptr`)           | No separate address                  |
| Address of Original   | `*ptr` gets value, `&*ptr` gets address| `&ref` gets address of original      |
| Function Use          | `void foo(int* p)`                     | `void bar(int& r)`                   |
| Can Modify Original   | Yes                                     | Yes                                  |
| Arithmetic            | Supports pointer arithmetic            | Does not support arithmetic          |
| Use Case              | When nullability or reassignment needed| When safe aliasing is preferred      |


- When is it better to use a pointer? \
When object can be nullable, reassignment is required, iteration is required
- When is it better to use a reference? \
When need to have a valid object always, clear and concise syntax
- What is the difference between `std::string` and a C-style string? \

| Feature           | `std::string`                      | C-style string (`char*` / `char[]`)      |
| ----------------- | ---------------------------------- | ---------------------------------------- |
| Definition        | A C++ standard library class       | A null-terminated array of characters    |
| Null-termination  | Managed internally                 | Required (`'\0'` at the end)             |
| Memory management | Automatic (RAII)                   | Manual                                   |
| Safety            | Safe and bounds-checked operations | Unsafe; prone to buffer overflows        |
| Functionality     | Rich set of built-in methods       | Requires `<cstring>` functions           |
| Comparison        | `==`, `.compare()`, etc.           | `strcmp()`                               |
| Concatenation     | `+`, `.append()`                   | `strcat()` (manual buffer sizing needed) |
| Length            | `.size()` or `.length()`           | `strlen()` (traverses string)            |
| Modifiability     | Easily modifiable                  | Error-prone and risky                    |

- What type is a C-style string?
char*
- What happens when you iterate a pointer? \
The pointer is incremented by the size of the type it points to.
So ptr++ doesn’t mean adding 1 byte — it means:
ptr += sizeof(*ptr) implicitly.
If ptr is an int* and sizeof(int) is 4, then the address increases by 4 bytes.

- What are the most important safety tips to know when using pointers?
Initialize pointers, avoid dereferencing null pointers, don't go out of bounds, avoid dangling pointers, avoid pointer arithmatic, check pointers for null before dereferencing.
## Learn Basics of Creating a C++ Project in Your IDE

- How do you compile and run your project in your IDE?
using makefile that i just wrote?

## Improving Interactions with LLMs

- What is the most authoritative source of information about `socket()`  from `<sys/socket.h>`?
Man pages and RFCs.
RFCs (Request for Comments) are official documents that describe, specify, and standardize protocols, procedures, formats, and policies primarily related to the Internet and networking technologies. They cover topics like:
Internet protocols (e.g., TCP/IP, HTTP, SMTP)
Network standards and architectures
Communication protocols and formats
Best practices and guidelines for Internet development
Security mechanisms and cryptographic standards
Experimental technologies and research proposals
RFCs are maintained by the Internet Engineering Task Force (IETF) and other related bodies to ensure open, standardized communication across the Internet.

- What is the most authoritative source of information about the TCP and IP protocols?
RFCs, specifically RFC 793 and RFC 791.
- What is the most authoritative source of information about the C++
  programming language?
ISO/IEC 14882:2024. This document specifies requirements for implementations of the C++ programming language. The first such requirement is that they implement the language, so this document also defines C++.
- What information can you find about using Markdown when structuring prompts 
  to LLMs?
Didn't exactly understand the question, but...
Markdown can be used to:
Format text clearly (headings, lists, code blocks)
Separate sections for readability
and many more things...

- What is the difference between LLM and AI?
AI (Artificial Intelligence): A broad field focused on creating machines or software that simulate human intelligence and perform tasks like learning, reasoning, and problem-solving.

LLM (Large Language Model): A specific type of AI trained on vast text data to understand and generate human language. LLMs are a subset of AI specializing in natural language processing.
- Is it grammatically correct in English to say "a LLM" or "an LLM"? Why?
an 'el el em'.