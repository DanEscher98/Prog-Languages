TARGET		= testing_12-10
FLAGS		= -Wall -Wextra -pedantic -Wgnu-binary-literal
LIBRARYS	= #data_structures.c basic_algorithms.c

$(TARGET).out : $(TARGET).c $(LIBRARYS)
	clang $(TARGET).c $(LIBRARYS) $(FLAGS) -o $(TARGET).out

asm: $(TARGET).out
	objdump -d $(TARGET).out > $(TARGET).asm

run: $(TARGET).out
	./$(TARGET).out

clear:
	rm -f *.out *.asm *.ll
	clear && ls
