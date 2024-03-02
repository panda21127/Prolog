 nu(X, Y):-
	X = Y,
	!,
	fail;
	true.
	
 abs2(X, Abs):-
	(X>0 -> Abs is X; Abs is (-X)).
	
 abs3(X, Abs):-
	X>0,
	Abs is X,!;
	Abs is (-X),!.
	
set_union(List1, List2, Result):-
	append(List1,List2,Result1),
	sort(Result1, Result),
	!.

unifiable([], _, []).
unifiable([H|T], Term, Result) :-
	
	format('FF: ~w~n',[\+(\+(H = Term))]),
    (   \+(\+(H = Term)) 
    ->  Result = [H|Rest] 
    ;   Result = Rest 
    ),
    unifiable(T, Term, Rest).