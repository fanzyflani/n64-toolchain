#!/bin/sh
mips64el-unknown-elf-gcc -G0 -O2 -EB -mabi=o64 -march=vr4300 -nostdlib -c -o head.o head.S && \
mips64el-unknown-elf-gcc -G0 -O2 -EB -mabi=o64 -march=vr4300 -nostdlib -Wall -Wextra -mno-check-zero-division -Wno-shift-negative-value -c -o main.o main.c && \
mips64el-unknown-elf-gcc -G0 -O2 -EB -mabi=o64 -march=vr4300 -nostdlib -Wl,-T,n64.ld -o honk.elf head.o main.o -lgcc -lc && \
mips64el-unknown-elf-objdump -h honk.elf && \
mips64el-unknown-elf-objcopy -Obinary honk.elf honk.z64 && \
./n64sums honk.z64 && \
~/Downloads/progs/cen64/build/cen64 pifdata.bin honk.z64 && \
true

