predicates
	male(symbol)
	female(symbol)
	parent(symbol,symbol,symbol)

	father(symbol,symbol)
	mother(symbol,symbol)
	sister(symbol,symbol)
	brother(symbol,symbol)
	
	grandfather(symbol,symbol)
	grandmother(symbol,symbol)
	
	uncle(symbol,symbol)
	aunt(symbol,symbol)
	cousin(symbol,symbol) /*може бути як братом так і сестрою*/
	
	great_grandfather(symbol,symbol)
	great_grandmother(symbol,symbol)
	
clauses
	male(jack).
	male(bred).
	male(sam).
	male(carl).
	male(andy).
	male(alex).
	male(john).
	male(arnold).
	male(lincoln).
	male(kent).
	male(gomer).
	male(harry).
	male(tom).
	
	female(alice).
	female(samanta).
	female(liz).
	female(meg).
	female(milana).	
	female(nicole).	
	female(mary).	
	female(grace).
	female(lara).	
	female(aurora).
	female(sophia).
	female(bella).
	female(lily).
	female(mia).
	
	parent(jack, alice, bred).
	parent(jack, alice, liz).
	parent(jack, alice, carl).
	parent(bred, samanta, milana).
	parent(arnold, milana, kent).
	parent(arnold, milana, gomer).
	parent(sam, liz, andy).
	parent(sam, liz, nicole).
	parent(andy, mary, harry).
	parent(andy, mary, lily).
	parent(lincoln, nicole, aurora).
	parent(carl, meg, john).
	parent(carl, meg, alex).
	parent(john, grace, sophia).
	parent(john, grace, mia).
	parent(john, grace, tom).
	parent(alex, lara, bella).
	
	father(X,Y):-
		male(X),
		parent(X,Z,Y).
		
	mother(X,Y):-
		female(X),
		parent(Z,X,Y).
	
	sister(X,Y):-
		female(X),
		parent(A,B,X),
		parent(A,B,Y),
		X<>Y.
	
	brother(X,Y):-
		male(X),
		parent(A,B,X),
		parent(A,B,Y),
		X<>Y.
	
	grandfather(X,Y):-
		male(X),
		father(X,Z),
		father(Z,Y).
	grandfather(X,Y):-
		male(X),
		father(X,Z),
		mother(Z,Y).
		
	grandmother(X,Y):-
		female(X),
		mother(X,Z),
		mother(Z,Y).
	grandmother(X,Y):-
		female(X),
		mother(X,Z),
		father(Z,Y).
		
	uncle(X,Y):-
		male(X),
		brother(X,Z),
		father(Z,Y).
	uncle(X,Y):-
		male(X),
		brother(X,Z),
		mother(Z,Y).
		
	aunt(X,Y):-
		female(X),
		sister(X,Z),
		mother(Z,Y).
	aunt(X,Y):-
		female(X),
		sister(X,Z),
		father(Z,Y).
		
	cousin(X,Y):-
		father(Z,X),
		brother(Z,W),
		father(W,Y).
	cousin(X,Y):-
		father(Z,X),
		brother(Z,W),
		mother(W,Y).
	cousin(X,Y):-
		mother(Z,X),
		sister(Z,W),
		mother(W,Y).
	cousin(X,Y):-
		mother(Z,X),
		sister(Z,W),
		father(W,Y).
		
	great_grandfather(X,Y):-
		male(X),
		father(X,Z),
		father(Z,W),
		father(W,Y).
	great_grandfather(X,Y):-
		male(X),
		father(X,Z),
		mother(Z,W),
		father(W,Y).
	great_grandfather(X,Y):-
		male(X),
		father(X,Z),
		mother(Z,W),
		mother(W,Y).
	great_grandfather(X,Y):-
		male(X),
		father(X,Z),
		father(Z,W),
		mother(W,Y).
	
	great_grandmother(X,Y):-
		female(X),
		mother(X,Z),
		mother(Z,W),
		mother(W,Y).
	great_grandmother(X,Y):-
		female(X),
		mother(X,Z),
		mother(Z,W),
		father(W,Y).
	great_grandmother(X,Y):-
		female(X),
		mother(X,Z),
		father(Z,W),
		mother(W,Y).
	great_grandmother(X,Y):-
		female(X),
		mother(X,Z),
		father(Z,W),
		father(W,Y).

		
