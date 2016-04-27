

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
relative(X,Y):-(ancestor(Z,X),ancestor(Z,Y));(descendant(Z,X),descendant(Z,Y)).

first(X,[H|_]):- X = H.
last(X,[H|T]):-length(T,0), X = H.
last(X,[_|T]):-not(length(T,0)),last(X,T).
filterlast([W|X],[Y|Z]):-W = Y,length(X,0),length(Z,1).
filterlast([W|X],[Y|Z]):- W = Y,filterlast(X,Z).
filterfirstlast(X,[_|T]):- filterlast(X,T).
f(X):-(first('(',X),last(')',X),filterfirstlast(Y,X),e(Y));(length(X,1),member(Y,X),(number(Y);char_type(Y,lower))).
t(X):-(append(L1,[*|L2],X),t(L1),f(L2));(append(L1,[/|L2],X),t(L1),f(L2));f(X).
e(X):-(append(L1,[+|L2],X),e(L1),t(L2));(append(L1,[/|L2],X),e(L1),e(L2));t(X).

sum([],0).
sum([H|T],X):- sum(T, Y),X is H + Y.
subseq([], []).
subseq([H|T], [H|R]) :- subseq(T,R).
subseq([_|T], R) :- subseq(T,R).
subseqsum(L,M,X):- subseq(L,Y),sum(Y,Z),M = Z,X = Y.

fsm(0,[a|T]):-fsm(0,T).
fsm(0,[b|T]):-fsm(0,T).
fsm(0,[a|T]):-fsm(1,T).
fsm(1,[b|T]):-fsm(2,T).
fsm(2,[b|T]):-fsm(3,T).
fsm(3,[a|T]):-fsm(3,T).
fsm(3,[a|T]):-fsm(3,T).
fsm(3,[]).
