/*Project 4*/
/*Jeremy Galarza*/
/*Anderson Giang*/
/*Eric Hernandez*/
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
relatives(X,Y):-ancestor(Z,X),ancestor(Z,Y),not(X = Y).
relatives(X,Y):-descendant(Z,X),descendant(Z,Y),not(X = Y).
relatives(X,Y):-ancestor(X,Y).
relatives(X,Y):-descendant(X,Y).

f([X]):-number(X).
f([X]):-char_type(X,lower).
f(X):-(append(['('|L1],[')'],X),e(L1)).
t(X):-f(X).
t(X):-append(L1,[*|L2],X),t(L1),f(L2).
t(X):-append(L1,[/|L2],X),t(L1),f(L2).
e(X):-t(X).
e(X):-append(L1,[+|L2],X),e(L1),t(L2).
e(X):-append(L1,[-|L2],X),e(L1),t(L2).

sum([],0).
sum([H|T],X):- sum(T, Y),X is H + Y.
subseq([], []).
subseq([H|T], [H|R]) :- subseq(T,R).
subseq([_|T], R) :- subseq(T,R).
subseqSum(L,M,X):- subseq(L,Y),sum(Y,Z),M = Z,X = Y.

fsm(0,[a|T]):-fsm(0,T).
fsm(0,[b|T]):-fsm(0,T).
fsm(0,[a|T]):-fsm(1,T).
fsm(1,[b|T]):-fsm(2,T).
fsm(2,[b|T]):-fsm(3,T).
fsm(3,[a|T]):-fsm(3,T).
fsm(3,[b|T]):-fsm(3,T).
fsm(3,[]).
