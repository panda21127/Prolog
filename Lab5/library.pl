human(oleg).
human(maxim).
human(peter).
human(kizil).

book(music).
book(teach).
book(sport).
book(clowns).
book(kolumbia).
book(locker).
book(lost).

human_book(oleg,music).
human_book(peter,teach).
human_book(kizil,sport).
human_book(maxim,clowns).
human_book(oleg,kolumbia).
human_book(peter,kolumbia).
human_book(oleg,locker).
human_book(kizil,lost).
human_book(peter,music).
human_book(maxim,music).
human_book(peter,sport).


both_books(Human,Book1,Book2):-
	human_book(Human,Book1),
	human_book(Human1,Book2),
	Human = Human1.
	
all_books(Human,[Head|Tail]):-
	human_book(Human,Head),
	all_books(Human,Tail,true).

all_books(_,[],true).

all_books(Human1,[H|T],_):-
	human_book(Human,H),
	(Human = Human1 -> all_books(Human,T,true);all_books(Human,T,false)).