FLAGS	= -Wall -Wextra -pedantic
TARGET 	= stringLen

$(TARGET).out : $(TARGET).c
	clang $(TARGET).c -o $(TARGET).out $(FLAGS)

run: $(TARGET).out
	./$(TARGET).out

clean :
	rm *.out

