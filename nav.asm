.data
prompt_ir:     .string "Enter IR sensor value: "
               .byte 0
prompt_ultra:  .string "Enter Ultrasonic sensor value: "
               .byte 0

label_decision: .string "\nDecision:\n"
                .byte 0
bullet:        .string "  • "
               .byte 0

label_speed:   .string "Motor speed: "
               .byte 0
label_steer:   .string "Steering:    "
               .byte 0

word_stop:     .string "STOP\n"
               .byte 0
word_slow:     .string "SLOW\n"
               .byte 0
word_normal:   .string "NORMAL\n"
               .byte 0

word_straight: .string "STRAIGHT\n"
               .byte 0
word_left:     .string "LEFT\n"
               .byte 0
word_right:    .string "RIGHT\n"
               .byte 0

.text
.globl main

main:
    li   t4, 0x10010000
    li   t5, 0x10010004
    li   t6, 0x10010008
    li   t3, 0x1001000C

    li   s0, 20
    li   s1, 30

    li   s2, 0
    li   s3, 10
    li   s4, 50

    li   s5, 0
    li   s6, 1
    li   s7, 2

    li   a7, 4
    la   a0, prompt_ir
    ecall
    li   a7, 5
    ecall
    mv   t0, a0

    li   a7, 4
    la   a0, prompt_ultra
    ecall
    li   a7, 5
    ecall
    mv   t1, a0

    bge  t0, s0, check_ultra
    mv   t2, s3
    mv   s8, s6
    j    print_decision

check_ultra:
    bge  t1, s1, no_obstacle
    mv   t2, s3
    mv   s8, s7
    j    print_decision

no_obstacle:
    mv   t2, s4
    mv   s8, s5

print_decision:
    sw   t2, 0(t6)
    sw   s8, 0(t3)

    li   a7, 4
    la   a0, label_decision
    ecall

    li   a7, 4
    la   a0, bullet
    ecall
    li   a7, 4
    la   a0, label_speed
    ecall
    beq  t2, s2, speed_stop
    beq  t2, s3, speed_slow
    beq  t2, s4, speed_normal

speed_stop:
    li   a7, 4
    la   a0, word_stop
    ecall
    j    steer_line

speed_slow:
    li   a7, 4
    la   a0, word_slow
    ecall
    j    steer_line

speed_normal:
    li   a7, 4
    la   a0, word_normal
    ecall

steer_line:
    li   a7, 4
    la   a0, bullet
    ecall
    li   a7, 4
    la   a0, label_steer
    ecall
    beq  s8, s5, steer_straight
    beq  s8, s6, steer_left
    beq  s8, s7, steer_right

steer_straight:
    li   a7, 4
    la   a0, word_straight
    ecall
    j    exit_prog

steer_left:
    li   a7, 4
    la   a0, word_left
    ecall
    j    exit_prog

steer_right:
    li   a7, 4
    la   a0, word_right
    ecall

exit_prog:
    li   a7, 10
    ecall