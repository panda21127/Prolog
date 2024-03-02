women(olya).
women(kate).
women(liza).
women(nastya).

man(peter).
man(pavel).
man(ivan).
man(alexey).
man(sergey).
man(rubert).

parent_children(alexey, nastya).
parent_children(alexey, pavel).
parent_children(alexey, olya).
parent_children(liza, nastya).
parent_children(liza, pavel).
parent_children(liza, olya).
parent_children(nastya, sergey).
parent_children(olya, ivan).
parent_children(olya, kate).
parent_children(olya, rubert).

brothers(Brother1, Brother2) :-
  parent_children(Parent, Brother1),
  parent_children(Parent, Brother2),
  man(Brother1),
  man(Brother2),
  Brother1 \= Brother2.
  
happy_unique(X) :-
    setof(X, happy(X), UniqueNames),
    member(X, UniqueNames).

happy(Person) :- parent_children(Person, _).


sister(Child1, Sister2) :-
  parent_children(Parent, Child1),
  parent_children(Parent, Sister2),
  women(Sister2),
  Child1 \= Sister2.

aunt(X,Y) :-
	setof(X, sister(Child1, X), SistersNames),
	setof(Y, parent_children(Child1, Y), ChildNames),
	member(Y, ChildNames),
	member(X, SistersNames).
	
	
ancestor_descendant(Ancestor, Descendant) :-
  parent_children(Ancestor, Descendant).
  
ancestor_descendant(Ancestor, Descendant) :-
  parent_children(Ancestor, Ancestor1),
  ancestor_descendant(Ancestor1, Descendant).