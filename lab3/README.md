# cs117-lab3
1. Assembly Reflections

○ What did you notice about registers and instructions?
- Registers are small, fast storage locations within the CPU (Central Processing Unit) that hold data temporarily.
- Registers and memory work together to manage data in assembly language programming, Registers have limited storage capacity and are accessed directly during program execution.

○ How is coding in Assembly different from Python?
- Assembly offers direct control over the computer's hardware, including registers, memory, and I/O operations.
- Python abstracts away low-level details, allowing programmers to focus on problem-solving and application logic. This makes it easier to learn and use, especially for beginners.
- Assembly code is typically tied to a particular processor architecture, making it less portable across different systems.
- Python code is generally highly portable across different operating systems and platforms, as it relies on an interpreter to execute the code.

2. Python Reflections

○ Why is Python easier/faster for building the same project?
- As a "high-level" language, Python provides a great deal of abstraction from hardware.
- Python's syntax uses natural, human-readable keywords and statements, making code easy to read, write, and understand.
- The human-readable syntax and higher-level error reporting in Python make it far easier and faster to identify and fix mistakes.
- Debugging in assembly is a complex, time-consuming process.

○ Which features of Python help abstraction (variables, functions, loops)?
- In assembly language, a developer must manually manage memory locations and CPU registers to store and retrieve data. Python's variables abstract this process entirely.
- Loops, like for and while, abstract the tedious, manual process of iterating over a sequence of items.

3. Comparison Table

|Feature	|Assembly Example|Python Example|Notes|
|---------|----------------|--------------|-----|
|Variable storage|MOV EAX, 10|my_var = 10	|Assembly directly uses CPU registers or memory addresses, while Python uses symbolic names (variables) that reference objects in memory.|
|Printing output |INT 21h	|print()|Assembly uses system interrupts (like INT 21h with specific function codes) for I/O operations, while Python provides built-in functions like print() for console output.|
|Arithmetic	|ADD AX, BX; DIV CX	|x + y; x / y	|Assembly involves direct register manipulation for arithmetic, while Python uses operators and handles memory management automatically.|
|Conditional statements	|CMP AX, BX; JE Label	|if x == y: pass|Assembly uses comparison instructions (CMP) and jump instructions (JE, JNE, etc.) to control flow, whereas Python uses if, elif, and else statements.|
