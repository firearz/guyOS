# Makefile

ASM=nasm
CC=i386-elf-gcc
LD=i386-elf-ld
CFLAGS=-ffreestanding -O2 -Wall -Wextra
LDFLAGS=-T kernel/linker.ld

all: os-image

boot/boot.o: boot/boot.asm
	$(ASM) -f bin boot/boot.asm -o boot/boot.o

kernel/kernel.o: kernel/kernel.c
	$(CC) $(CFLAGS) -c kernel/kernel.c -o kernel/kernel.o

kernel.bin: kernel/kernel.o
	$(LD) $(LDFLAGS) kernel/kernel.o -o kernel.bin

os-image: boot/boot.o kernel.bin
	cat boot/boot.o kernel.bin > build/os-image.bin
	mkdir -p iso/boot
	cp build/os-image.bin iso/boot/
	grub-mkrescue -o build/myos.iso iso/

clean:
	rm -rf build kernel/*.o iso
