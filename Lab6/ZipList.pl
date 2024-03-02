 
list_length([]     , 0 ).
list_length([_|Xs] , L ) :- list_length(Xs,N) , L is N+1 .
 
zip(List1, List2, ZippedList):-
	list_length(List1 , L1),
	list_length(List1 , L2),
	L1 = L2,
	zipped(List1, List2, ZippedList).

zipped([L1],[L2],[[L1, L2]]).

zipped([Head1|Tail1], [Head2|Tail2], [[Head1,Head2]|T]):-
	zipped(Tail1, Tail2, T).
	
% zip([1,2,3],[4,5,6],X), !.
% zip([1,2,3],X,[[1,3],[2,2],[3,1]]), !.
% zip(X,[1,2,3],[[1,1],[5,2],[4,3]]), !.

contains_duplicates([Head|Tail]):-
	contains_duplicates(Tail,Head);
	contains_duplicates(Tail).

contains_duplicates([Head|Tail],Element):-
	Element = Head;
	contains_duplicates(Tail,Element).
	
% contains_duplicates([1,1,2,3,2]),!.
				
is_list(X) :-
        var(X), !,
        fail.
is_list([]).
is_list([_|T]) :-
        is_list(T).
		
flatten2([], []).
		
flatten2([H|T], F) :-
	is_list(H),
	flatten2(H, T2),
	flatten2(T, T3),
	append(T2, T3, F).

flatten2([H|T], [H|T2]) :-
	\+ is_list(H),
	flatten2(T, T2).
	

add_null([],[]).

add_null([Head|Tail],[Head1|Tail1]):-
	append([0],Head,Head1),
	add_null(Tail,Tail1).

add_one([],[]).

add_one([Head|Tail],[Head1|Tail1]):-
	append([1],Head,Head1),
	add_one(Tail,Tail1).

gray(N,Code):-
	grayR(N,Code),
	writeln(Code).

grayR(1,[[0],[1]]):-!.

grayR(N,Code):-
	New is N - 1,
	grayR(New,CodeG),
	add_null(CodeG,Code1),
	reverse(CodeG,RCodeG),
	add_one(RCodeG,Code2),
	append(Code1,Code2,Code).