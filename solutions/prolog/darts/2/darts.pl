distance(X1, Y1, X2, Y2, Distance) :-
    S1 is (X2 - X1) ** 2,
    S2 is (Y2 - Y1) ** 2,
    sqrt(S1 + S2, R),
    Distance = R.

score(X, Y, Score) :-
    distance(X, Y, 0, 0, Distance),
    score_distance(Distance, Score).

score_distance(Distance, 10) :- Distance =<  1, !.
score_distance(Distance,  5) :- Distance =<  5, !.
score_distance(Distance,  1) :- Distance =< 10, !.
score_distance(_, 0).