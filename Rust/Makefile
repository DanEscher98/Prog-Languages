FLAGS	= --verbose -g
TARGET 	= numI

$(TARGET).out : $(TARGET).rs
	rustc $(TARGET).rs -o $(TARGET).out $(FLAGS)

run: $(TARGET).out
	./$(TARGET).out

clean :
	rm *.out

