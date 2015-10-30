// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

@R2		  // product's mem. location
M = 0     // product = 0 (initialization)

(LOOP)
@R0       // loop count's mem. location
D = M     // D = loop count
@STOP     // stop if loop count = 0
D; JEQ

@R1       // data's mem. location
D = M     // D = data

@R2
M = D + M // total = total + data

@R0
M = M - 1 // decrement loop
@LOOP     // jump back up to loop if count > 0
0; JMP

(STOP)
@STOP
0; JMP