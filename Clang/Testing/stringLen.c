#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define len_in 15
char *getLogin(void);
char *combineStrings(char*, char*, char);

int main(void) {
	char cad[len_in];
	fputs("Introduzca una cadena de caracteres: ", stdout);
	fgets(cad, len_in, stdin);
	printf("%s\n", cad);
	printf("%s", getLogin());
	return 0;
}

char *getLogin(void) {
	char	*usrname="",
			*pswd="",
			*dbname="",
			*loginstr="";

	fputs("User name: ", stdout);
	scanf("%s", usrname);
	// fgets(usrname, len_in, stdin);
	// asprintf(&usrname, "user=%s", usrname);
	fputs("happy", stdout);
	usrname = combineStrings("user", usrname, '=');

	fputs("Password: ", stdout);
	fgets(pswd, len_in, stdin);
	pswd = combineStrings("password", pswd, '=');
	
	fputs("Database name: ", stdout);
	fgets(dbname, len_in, stdin);
	dbname = combineStrings("dbname", dbname, '=');
	
	loginstr = combineStrings(usrname, pswd, ' ');
	loginstr = combineStrings(loginstr, dbname, ' ');
	return loginstr;
}

char *combineStrings(char *inputA, char *inputB, char elem) {
    int lenA = 0, lenB = 0;
    while(inputA[lenA] != '\0') lenA++;
    while(inputB[lenB] != '\0') lenB++;
    char* output = malloc(lenA+lenB+1);
    sprintf((char*)output,"%s%c%s", inputA, elem, inputB);
    return output;
}
