distance(X1, Y1, X2, Y2, Distance) :-
    pow(X2 - X1, 2, S1),
    pow(Y2 - Y1, 2, S2),
    sqrt(S1 + S2, R),
    Distance = R.

score(X, Y, Score) :-
    distance(X, Y, 0, 0, D),
    D > 10,
    Score is 0.

score(X, Y, Score) :-
    distance(X, Y, 0, 0, D),
    D > 5,
    Score is 1.

score(X, Y, Score) :-
    distance(X, Y, 0, 0, D),
    D > 1,
    Score is 5.

score(_, _, 10).