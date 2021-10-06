import re

emailRegEx = '^[\w.-]+[@]\w+([.]\w{2,3})?[.]\w{2,3}$'
cardRegEx  = "^4\d{12}(\d{3})?$"


def check(pattern, string, message):
	#if (re.match(re.compile(pattern), string))
	if (re.search(pattern, string)):
	  print("Valid {}.".format(message))
	  return True
	else:
	  print("Invalid {}.".format(message))
	  return False

if __name__ == '__main__':
	while True:
		if (check(emailRegEx, input("Set your email: "), "email")):
			break
	while True:
		if (check(cardRegEx, input("Set your credit card number: "), "number")):
			break

'''
Metacharacters: [].^$*+?{}()\\|

^ - check if a string starts with a certain character
$ - check if a string ends with a certain character
. - matches any single character (except newline '\n')
* - matches zero or more occurrences of the pattern left to it
+ - matches one or more occurrences of the pattern left to it
? - matches zero or one occurrence of the pattern left to it
| - alternation (or operator)
() - is used to group sub-patterns
[] - specifies a set of characters you wish to match
{m, n} - at least n, and at most m repetitions of the pattern left to it

Matches if the specified characters are
\A - at the start of a string
\b - at the beginning or end of a word
\B - not at the beginning or end of a word
\d - Equivalent to [0-9]. Matches any decimal digit.
\D - Equivalent to [^0-9]. Matches any non-decimal digit.
\s - Equivalent to [ \t\n\r\f\v]. Matches where a string contains any whitespace character.
\S - Equivalent to [^ \t\n\r\f\v]. Matches where a string contains any non-whitespace character.
\w - Equivalent to [a-zA-Z0-9_]. Matches any alphanumeric character.
\W - Equivalent to [^a-zA-Z0-9_]. Matches any non-alphanumeric character.
\Z - Matches if the specified characters are at the end of a string.

The re.findall(pattern, string) method returns a list of strings containing all matches
The re.split(pattern, string) method splits the string where there is a match and returns a list of strings where the splits have occurred.
The re.sub(pattern, replace, string) method returns a string where matched occurrences are replaced with the content of replace variable.
'''