first(X,[H|T]):- X =H.
f(L):- first('(',L);number(L);char_type(L,lower).
