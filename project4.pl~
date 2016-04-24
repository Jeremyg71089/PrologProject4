brother(X,Y):-male(X),parent(Z,X),parent(Z,Y).
sister(X,Y):-female(X),parent(Z,X),parent(Z,Y).
mother(X,Y):-female(X),parent(X,Y).
father(X,Y):-male(X),parent(X,Y).
grandparent(X,Y):-parent(X,Z),parent(Z,Y).
grandmother(X,Y):-female(X),grandparent(X,Y).
grandfather(X,Y):-male(X),grandparent(X,Y).
aunt(X,Y):-female(X),grandparent(Z,Y),parent(Z,X),not(parent(X,Y)).
uncle(X,Y):-male(X),grandparent(Z,Y),parent(Z,X),not(parent(X,Y)).
firstCousin(X,Y):-parent(Z,X),(uncle(Z,Y);aunt(Z,Y)).
ancestor(X,Y):-parent(X,Y).
ancestor(X,Y):-parent(X,Z),ancestor(Z,Y).
descendant(X,Y):-parent(Y,X).
descendant(X,Y):-parent(Y,Z),descendant(X,Z).
relative(X,Y):-ancestor(X,Y);descendant(X,Y).

male(jeremy).
male(michael).
male(matthew).
male(gilbert).
male(jr).
male(juan).
male(christopher).
female(gabrielle).
female(carmen).
female(elvira).
female(kathy).
parent(gilbert,matthew).
parent(juan,jr).
parent(juan,jeremy).
parent(gilbert, christopher).
parent(gilbert,gabrielle).
parent(carmen, gilbert).
parent(kathy,michael).
parent(elvira,jeremy).
parent(carmen,elvira).
parent(carmen,kathy).



first(X,[H|T]):- X =H.
f(L):- first('(',L);number(L);char_type(L,lower).
