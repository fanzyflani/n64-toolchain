#!/bin/sh
mipsel-none-elf-gcc -G0 -O2 -EB -mabi=32 -march=vr4300 -nostdlib -c -o head.o head.S && \
mipsel-none-elf-gcc -G0 -O2 -EB -mabi=32 -march=vr4300 -nostdlib -Wall -Wextra -mno-check-zero-division -Wno-shift-negative-value -c -o main.o main.c && \
mipsel-none-elf-gcc -G0 -O2 -EB -mabi=32 -march=vr4300 -nostdlib -Wl,-T,n64.ld -o honk.elf head.o main.o -lgcc -lc && \
mipsel-none-elf-objdump -h honk.elf && \
mipsel-none-elf-objcopy -Obinary honk.elf honk.z64 && \
./n64sums honk.z64 && \
~/Downloads/progs/cen64/build/cen64 -debug pifdata.bin honk.z64 && \
true

