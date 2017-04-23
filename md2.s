.text
    .align	2
    .global	matmul
    .type	matmul, %function
matmul:
    cmp r1, r3
    bne nok
    beq ok
nok:
    mov r0, #1
    bx lr
ok:
    push {r4}
    push {r5}
    push {r6}
    push {r7}
    push {r8}
    push {r9}
    push {r10}
    push {r11}
    push {r12}
    ldr r4, [sp, #36] @w2
    ldr r5, [sp, #40] @matrix2
    ldr r6, [sp, #44] @matrix3
    mov r7, #0
    mov r10, #0
looprow:
    cmp r7, r0
    bge done
    mov r8, #0
loopcol:
    cmp r8, r4
    bge looprowx
    mov r3, #0
    mov r9, #0
loopnum:
    cmp r9, r1
    bge write

    mul r11, r7, r1
    add r11, r11, r9
    mov r11, r11, LSL #2
    ldr r11, [r2, r11]

    mul r12, r9, r4
    add r12, r12, r8
    mov r12, r12, LSL #2
    ldr r12, [r5, r12]

    mul r11, r12, r11
    add r3, r3, r11

    add r9, r9, #1
    b loopnum
looprowx:
    add r7, r7, #1
    b looprow
loopcolx:
    add r8, r8, #1
    b loopcol
write:
    str r3, [r6, r10]
    add r10, r10, #4
    b loopcolx
done:
    mov r1, r6
    pop {r12}
    pop {r11}
    pop {r10}
    pop {r9}
    pop {r8}
    pop {r7}
    pop {r6}
    pop {r5}
    pop {r4}
    mov r0, #0
    bx lr

