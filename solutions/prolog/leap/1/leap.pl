divisible_by(X, Y) :- X mod Y =:= 0.

leap(Y) :- divisible_by(Y, 4), \+ divisible_by(Y, 100).
leap(Y) :- divisible_by(Y, 100), divisible_by(Y, 400).