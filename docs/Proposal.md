# PringOS
Team members:

- Zachary Johnson
- Joe DeGrand
- Justin Gonzales
- Owen Sullivan

## Summary Description
The goal of this project is to employ Rust as an embedded systems programming language, as that is one of the largest communities backing the
language. On top of this, we have a pretty good idea about how to go about it and together as a team we think that this is the type of project that we
can split into impressive and manageable parts.
On top of this, the borrow system and support/resources from the community will be a great aid and the prior research already resulted in a game plan
and order or execution.
We will have to use a variety of features in rust to complete our project: Unsafe code, Macros, Traits, Borrow System, Inner and Outer Attributes, 
and inline ASM. 

## Use Cases
Input and output is going to be through UART (to a user just their keyboard and monitor), so we will have to write a UART driver. Users would use the
operating system to use on a computer emulator or FPGA to interact with the hardware of the computer. This involves sending the computer input and 
receiving some sort of “meaningful” output

## Sketch
![High Level Design](https://user-images.githubusercontent.com/23535069/111411596-3a470b80-86b1-11eb-8874-d92aad61519f.png)

## Testing
Due to the nature of our program, most of our tests will be per module that just test the key functions and components. Some of our interoperability 
will be too hard to write concrete tests for, but will be tested manually during integration. For example, tests could be done to test specific 
protocols such as UART, to make sure that our end is implemented correctly.

## MVP
Minimal viable products would be able run and manage user processes like being able to play a game of tic-tac-toe, implement OS necessities like Time, Random and hopefully some heap memory ops.

## Stretch Goals
Stretch goals include developing a network driver, running the os on an FPGA board, simple filesystem, color on terminal.

## Functionality By Checkpoint
By the checkpoint we would like the operating system to be able to read and process keyboard input and print output to screen.
Take our keyboard input and echo the keys we pressed to the monitor
