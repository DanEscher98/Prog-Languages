likes(wallace, cheese).
likes(grommit, cheese).
likes(wendoleen, sheep).

friend(X, Y) :-
    \+(X = Y),
    likes(X, Z),
    likes(Y, Z).

query(likes(wallace, cheese)).
query(likes(wendoleen, beer)).
query(friend(wallace, grommit)).

forall(X, Y) :- \+ (X, \+ Y).
writeln(T) :- write(T), nl.

main :- 
	writeln("Hello World!"),
	forall(query(Q), (Q -> writeln(yes:Q) ; writeln(no:Q))),
	halt.
