# Makefile
all: os-image

boot.o: boot.asm
	nasm -f bin boot.asm -o boot.o

kernel.o: kernel.c
	i386-elf-gcc -ffreestanding -m32 -c kernel.c -o kernel.o

kernel.bin: kernel.o linker.ld
	i386-elf-ld -T linker.ld kernel.o -o kernel.bin

os-image: boot.o kernel.bin
	cat boot.o kernel.bin > os-image.bin

run: os-image
	qemu-system-i386 -drive format=raw,file=os-image.bin

clean:
	rm -f *.o *.bin
