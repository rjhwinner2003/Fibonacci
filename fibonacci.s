/**********************************************************/
/**********************************************************/
/**********************************************************/
/***                                                    ***/
/***                                                    ***/
/***                                                    ***/
/***                    fibonacci.s                     ***/
/***                                                    ***/
/***                                                    ***/
/***    Written By: Ryan Hall                           ***/
/***    System: Silicon Graphics O2 - IRIX 6.5.2.2      ***/
/***    Compiler: MIPSPro 7.4                           ***/
/***    Date: July 19, '25                              ***/
/***    Description: A simple MIPS Fibonacci            ***/
/***    sequence program. Computes the Fibonacci        ***/
/***    sequence up to the term input by the user.      ***/
/***                                                    ***/
/***                                                    ***/
/***                                                    ***/
/**********************************************************/
/**********************************************************/
/**********************************************************/

#include<regdef.h>

.data

promptMessage: .asciiz "Please input the nTerm you want.\nValue must be an integer: "
promptValue: .asciiz "%i"
invalidMessage: .asciiz "Invalid number of terms\n"
fibLoopMsg: .asciiz "number: %i\n"
nTerm: .word 0

.text

.globl main


.ent main

main:
    la a0, promptMessage
    jal printf

    la a0, promptValue
    la a1, nTerm
    jal scanf

    j prepFib
    
.end main


.ent prepFib

prepFib:            
    lw t0, nTerm

    blt t0, 1, invalid

    li s0, 1    # the iterator
    li s1, 1    # term 1 of series
    li s2, 0    # term 2 of series

    j fibLoop

.end prepFib


.ent fibLoop

fibLoop:        
    lw t1, nTerm        # this will be the starting term. Put into t1 since it won't be used in other proc.
    bgt s0, t1, cleanUp

    beq s0, 1, firstIter    # s0 = 1
    beq s0, 2, secondIter   # s0 = 2

    /* if s0 is not equal to 1 or 2, just go through the loop */

    add t2, s1, s2

    move s2, s1
    move s1, t2

    la a0, fibLoopMsg
    move a1, t2
    jal printf
    
    addi s0, s0, 1

    j fibLoop

.end fibLoop


.ent firstIter

firstIter:
    la a0, fibLoopMsg
    move a1, s2
    jal printf

    addi s0, s0, 1      # increment here because it doesn't reach it in the fibLoop in this case.
    
    j fibLoop       # return to the fibonacci loop

.end firstIter


.ent secondIter

secondIter:
    la a0, fibLoopMsg
    move a1, s1
    jal printf

    addi s0, s0, 1      # increment here because it doesn't reach it in the fibLoop in this case.
    
    j fibLoop

.end secondIter


.ent invalid

invalid:
    la a0, invalidMessage
    jal printf

    j cleanUp       # need to close now.

.end invalid


.ent cleanUp

cleanUp:
    la a0, 0
    jal exit        # is invalid, so exit

.end cleanUp
