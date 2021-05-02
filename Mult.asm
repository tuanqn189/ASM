// Mult.asm

// This program compute the product R0*R1
// and stores the result in R2
// Assume that R0>=0, R1>=0 and R0*R1 <32768

// Function: In order to do multiplication, we will be transforming it
// into addition. We will simply keep adding R0 by itself R1 times to get R2


@2
M=0	// We initiate the result R2 as 0 first

@0
D=M
@END
D;JEQ	// End the program if R0 equals to 0 since we already initate R2 as 0

@1
D=M
@END
D;JEQ	// Do the same when R1 equals 0

@1
D=M	// Get R1 which is the number of times that R0 needs to adds to itself
@3
M=D	// Use R3 as a counter of how many times left to run the loop

// Loop the addition of R0 onto itself

(LOOP)
@0
D=M	// Take R0

@2
M=M+D	// Adds the previous increments to the current one (M starts at 0)

@3
M=M-1	// Reduce the addition counter in R3 by 1
D=M	// Register the new counter in the D-register

@LOOP
D;JGT	// Keep looping while the counter is higher than 0 (stops when counter reaches 0)

(END)
@END
0;JMP // Terminate the program in an infinite loop	
