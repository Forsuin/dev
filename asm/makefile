# Usage: make <filename> - no file extension
#        make clean

#This will automatically "create" the make targets for a inputted filename

#make EvenOdd
#make helloWorld

.PHONY: clean

TARGET = $(filter-out $@,$(MAKECMDGOALS))

$(TARGET): $(TARGET).o
	gcc -o $@ $< -no-pie

$(TARGET).o: $(TARGET).asm
	nasm -f elf64 -g -F dwarf $< -l $*.lst

clean:
	rm -f *.o *.lst
	find . -type f -executable -exec rm {} +