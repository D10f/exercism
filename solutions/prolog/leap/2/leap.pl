divisible_by(X, Y) :- X mod Y =:= 0.
not(X) :- \+ X.

leap(Year) :-
    divisible_by(Year, 400), !;
    divisible_by(Year, 4), not(divisible_by(Year, 100)).