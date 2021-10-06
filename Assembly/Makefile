TARGET 	= hello
FLAGS	= -f elf64 -g -F dwarf -l $(TARGET).lst

$(TARGET).o : $(TARGET).nasm
	nasm $(TARGET).nasm -o $(TARGET).o $(FLAGS)

$(TARGET).out : $(TARGET).o
	gcc $(TARGET).o -o $(TARGET).out -no-pie
	# ld $(TARGET).o -o $(TARGET).out

run: $(TARGET).out
	./$(TARGET).out

objdump: $(TARGET).out
	objdump -D $(TARGET).out

clear:
	rm *.out *.o *.lst
