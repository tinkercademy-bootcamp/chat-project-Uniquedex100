# Exercise 5

**Update this README with your answers to the questions below.**

## Comparing File Changes

- What's an easy way to identify the changes in source code from one exercise to another?
  - Using diff tools if the source codes are somewhat similar in structure.
  - We can use clang-diff tool which compares the ast of 2 cpp files, so that it outputs the differences at syntax tree level, which is far more semantic than line by line diffs.
    
## Using Classes

- Here is one way to separate out the code into multiple files
  - Yes, it surely is.
- Is this the best way to do it?
  - Yes, I suppose, but as the changes are minimal, It would be better to keep in same file only. In this case it's just one function.
- What are the advantages and disadvantages?
  - Advantages: Code reusability, easier to find bugs, helps understand the code better.
  - Disadvantage: Not visible at this level, but increases the compile time and linking time.

## Introduction to Namespace

- There are different ways namespace is being used in this exelinux tool to diff on the ast of 2 codes in cpprcise
  - A namespace in C++ is like a container for names — variables, functions, classes, etc. It prevents name conflicts between different parts of code.
  - For the different styles of namespace usage, the first one is fully qualified usage: 
  int my_socket = tt::chat::net::create_socket();
  It is clear and explicit, no confusion about where the function comes from.
  - Then there is namespace aliasing inside Functions.
  We define an alias (ttc) for the namespace to reduce typing and still avoid global "using".
  namespace ttc = tt::chat;
  ttc::check_error(...);
  - Then there is unqualified access, using namespace std;
  Now we don’t need the namespace prefix anymore — you can call everything directly.

- Which way is better? What are the advantages and disadvantages?
  - We should in general avoid using "using namespace" especially in headers and shared code, as it pollutes the namespace and risks conflicts.
  - Namespace aliasing is byfar the best scoping tool, as it shortens the code and removes the ambiguity.
  - Fully qualified namespace usage is suggested only when the corresponding functions are rarely used or to improve code clarity.

## Abstracting Code into Classes

- Abstract the client and server logic into a `Client` and `Server` class
- **Note**: You don't have to use the code in this exercise as a starting point
  - Done
- You can use the code you wrote from previous exercises instead
  - Yep, definitely.
- How should you divide the code into files?
  - We should divide it into 2 files for server and client. For division within a file, we can literally put all the code of server into server class and similarly all the client code to client class.
- What namespace and directory structure should you use? Why?
  - I prefer using defining namespace in a code snippet encapsulated by {}, because the code is short and there are multiple functions too. For directory structure, I have followed what we were following all along.

## Programming Sense of Taste

- How do you judge what makes a particular choice of namespace and directory structure? 
  - A good choice cleanly reflects the system’s logical architecture, ensuring that the namespace and directory structure mirror each other for clarity, modularity, and ease of navigation.
- How do you judge what makes a good naming convention or programming style?
  - A good naming convention and style consistently prioritize clarity, intent-revealing names, and alignment with established norms to make code easy to read, understand, and maintain.

## "Senses" in Programming

- Have you ever heard of programmers referring to "code smells"? How can code smell?
  - "code smells" are patterns in code that signal deeper problems — they aren't bugs, but they hint that something is off. Examples include overly long functions, duplicated code, or inconsistent naming. Like a bad smell, they alert you before things go seriously wrong.
- What does it mean to have a sense of taste in programming? How can code taste?
  - Having taste in programming means recognizing elegant, clean, and maintainable code and choosing it over the merely functional. Code “tastes” good when it reads naturally, feels well-structured, and shows thoughtful design.
- Is there an analogue for every sense?
  - Yes, metaphorically:  
  - Smell → Detecting problematic patterns or bad design (code smells)  
  - Taste → Appreciating code quality and style  
  - Sight → Recognizing patterns, structure, and visual clarity in code  
  - Touch → Experiencing how code behaves when you interact with or refactor it  
  - Hearing → Listening to feedback from tests, compilers, and other developers
- What other code senses can you think of?
   - Intuition: Recognizing problems or solutions instinctively through experience  
   - Balance: Knowing when to abstract or generalize and when to keep things simple  
   - Flow: Feeling how code logic and control naturally progress  
   - Temperature: Code that’s “hot” or changing frequently, signaling potential volatility
- How many senses do humans have?
  - Traditionally 5.
- When would you want to see something before you touch it?
  - When you're unsure or cautious — like reviewing unfamiliar code before modifying it, or reading API docs before using a function.
- When would you want to touch something before you see it?
  - When exploring or debugging — running the code or testing behavior can sometimes reveal issues more effectively than just reading it.