have_fly(moscow,sant_Peterburg).
have_fly(moscow,ekaterinburg).
have_fly(moscow,novosibirsk).
have_fly(sant_Peterburg,novosibirsk).
have_fly(sant_Peterburg,sochi).
have_fly(sant_Peterburg,minsk).
have_fly(ekaterinburg,sochi).
have_fly(sochi,kiev).
have_fly(minsk,novosibirsk).
have_fly(minsk,kiev).

have_fly(kalenengrad, smolensk).
have_fly(smolensk, kalenengrad).
		
go(X, Y):-
	go(X, Y,X,Y).
		
go(X, Y,_,_) :-
	have_fly(X, Y);
	have_fly(Y, X).

go(X, Y, PX, PY) :-
	have_fly(X, Z),
	Z \= PY,
	Z \= PX,
	%format('X ~w Y ~w Z: ~w~n',[X,Y,Z]),
	go(Z, Y,PX,PY).
	
go(X, Y, PX, PY) :-
	have_fly(Y, Z),
	Z \= PX,
	Z \= PY,
	%format('X ~w Y ~w Z: ~w~n',[X,Y,Z]),
	go(X, Z, PX, PY).
	
% go(moscow, kiev), !.