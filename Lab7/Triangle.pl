triangle(0, 0):-!.

triangle(N, NthTriangle):-
	New is N - 1,
	triangle(New, Triangle),
	NthTriangle is Triangle + N.
	
% triangle(4, X), !.

list_length([]     , 0 ).
list_length([_|Xs] , L ) :- list_length(Xs,N) , L is N+1 .
 
dot(List1, List2, DotProduct):-
	list_length(List1 , L1),
	list_length(List1 , L2),
	L1 = L2,
	doted(List1, List2, DotProduct).

doted([],[],0).

doted([Head1|Tail1], [Head2|Tail2], Head3):-
	H is (Head1 * Head2),
	doted(Tail1, Tail2, T),
	Head3 is T + H.
	
% dot([2,2,2], [2,2,2], Result).
	
% polynom(X) :- atomic(X), !, true.
% polynom(X + Y) :- !, polynom(X), polynom(Y).
% polynom(X - Y) :- !, polynom(X), polynom(Y).
% polynom(Coeff * Var^Exp) :- !, number(Coeff), atom(Var), integer(Exp), Exp >= 0, Coeff \= 0.
% polynom(Coeff * Var) :- !, number(Coeff), atom(Var), Coeff \= 0.
% polynom(Var^Exp) :- !, atom(Var), integer(Exp), Exp >= 0.

polynom(_*X^E1 + _*Y^E2) :- format("polynom(_*X^E1 + _*Y^E2): X=~w Y=~w E1=~w E2=~w~n",[X,Y,E1,E2]), !, polynom(X), polynom(Y),E1>E2,E1>= 0,E2>= 0.
polynom(_*X^E1 - _*Y^E2) :- format("polynom(_*X^E1 - _*Y^E2): X=~w Y=~w E1=~w E2=~w~n",[X,Y,E1,E2]),!, polynom(X), polynom(Y),E1>E2,E1>= 0,E2>= 0.
polynom(_*X^E1 + _*Y) :- format("polynom(_*X^E1 + _*Y): X=~w Y=~w E1=~w~n",[X,Y,E1]),!, polynom(X), polynom(Y),E1>= 0.
polynom(_*X^E1 - _*Y) :- format("polynom(_*X^E1 - _*Y): X=~w Y=~w E1=~w~n",[X,Y,E1]),!, polynom(X), polynom(Y),E1>= 0.

polynom(X^E1 + _*Y^E2) :- format("polynom(X^E1 + _*Y^E2): X=~w Y=~w E1=~w E2=~w~n",[X,Y,E1,E2]), !, polynom(X), polynom(Y),E1>E2,E1>= 0,E2>= 0.
polynom(X^E1 - _*Y^E2) :- format("polynom(X^E1 - _*Y^E2): X=~w Y=~w E1=~w E2=~w~n",[X,Y,E1,E2]),!, polynom(X), polynom(Y),E1>E2,E1>= 0,E2>= 0.
polynom(X^E1 + _*Y) :- format("polynom(X^E1 + _*Y): X=~w Y=~w E1=~w~n",[X,Y,E1]),!, polynom(X), polynom(Y),E1>= 0.
polynom(X^E1 - _*Y) :- format("polynom(X^E1 - _*Y): X=~w Y=~w E1=~w~n",[X,Y,E1]),!, polynom(X), polynom(Y),E1>= 0.

polynom(_*X^E1 + Y^E2) :- format("polynom(_*X^E1 + Y^E2): X=~w Y=~w E1=~w E2=~w~n",[X,Y,E1,E2]), !, polynom(X), polynom(Y),E1>E2,E1>= 0,E2>= 0.
polynom(_*X^E1 - Y^E2) :- format("polynom(_*X^E1 - Y^E2): X=~w Y=~w E1=~w E2=~w~n",[X,Y,E1,E2]),!, polynom(X), polynom(Y),E1>E2,E1>= 0,E2>= 0.
polynom(_*X^E1 + Y) :- format("polynom(_*X^E1 + Y): X=~w Y=~w E1=~w~n",[X,Y,E1]),!, polynom(X), polynom(Y),E1>= 0.
polynom(_*X^E1 - Y) :- format("polynom(_*X^E1 - Y): X=~w Y=~w E1=~w~n",[X,Y,E1]),!, polynom(X), polynom(Y),E1>= 0.

polynom(X^E1 + Y^E2) :- format("polynom(X^E1 + Y^E2): X=~w Y=~w E1=~w E2=~w~n",[X,Y,E1,E2]), !, polynom(X), polynom(Y),E1>E2,E1>= 0,E2>= 0.
polynom(X^E1 - Y^E2) :- format("polynom(X^E1 - Y^E2): X=~w Y=~w E1=~w E2=~w~n",[X,Y,E1,E2]),!, polynom(X), polynom(Y),E1>E2,E1>= 0,E2>= 0.
polynom(X^E1 + Y) :- format("polynom(X^E1 + Y): X=~w Y=~w E1=~w~n",[X,Y,E1]),!, polynom(X), polynom(Y),E1>= 0.
polynom(X^E1 - Y) :- format("polynom(X^E1 - Y): X=~w Y=~w E1=~w~n",[X,Y,E1]),!, polynom(X), polynom(Y),E1>= 0.

polynom(Coeff * Var) :- format("polynom(Coeff * Var): Coeff=~w Var=~w~n",[Coeff, Var]),polynom(Var), number(Coeff), atom(Var), Coeff \= 0.

polynom(X + Y) :- format("polynom(X + Y): X=~w Y=~w~n",[X, Y]), !, polynom(X), polynom(Y).
polynom(X - Y) :- format("polynom(X - Y): X=~w Y=~w~n",[X, Y]), !, polynom(X), polynom(Y).

polynom(X) :- format("polynom(X): X=~w~n",[X]),atomic(X), !, true.

% polynom(2*x^3 + x).

combination(_, 0, []).
combination([X|T], K, [X|Combination]) :-
    K > 0,
    K1 is K - 1,
    combination(T, K1, Combination).
	
combination([_|T], K, Combination) :-
    K > 0,
    combination(T, K, Combination).
	

prime_factors(Num, Factors) :-
    findall(factor(P, E), (between(2, Num, P), is_prime(P), exponent(Num, P, E), E\=0), Factors).

is_prime(2).
is_prime(3).
is_prime(P) :-
    P > 3,
    P mod 2 =\= 0,
    \+ has_factor(P, 3).

has_factor(N, Factor) :-
    N mod Factor =:= 0.
has_factor(N, Factor) :-
    Factor * Factor < N,
    NextFactor is Factor + 2,
    has_factor(N, NextFactor).

exponent(N, P, E) :-
    (   N mod P =\= 0 ->
        E = 0
    ;   N mod P =:= 0 ->
        N1 is N // P,
        exponent(N1, P, E1),
        E is E1 + 1
    ).
