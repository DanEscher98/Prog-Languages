FILE	= basic_error
FLAGS 	= -Wall -Wextra -pedantic -std=c++17

$(FILE).out : $(FILE).cpp
	clang -lstdc++ $(FILE).cpp -o $(FILE).out $(FLAGS)

run : $(FILE).out
	./$(FILE).out

clear :
	clear
	rm *.out
