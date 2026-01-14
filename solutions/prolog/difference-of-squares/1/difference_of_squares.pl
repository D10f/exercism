sum_of(N, Result) :- N =:= 0, Result = 0, !.
sum_of(N, Result) :-
    Next is N - 1,
    sum_of(Next, Temp),
    Result is Temp + N.

square_of_sum(N, Result) :-
    sum_of(N, Temp),
    Result is Temp * Temp.

sum_of_squares(N, Result) :- N =< 0, Result = 0, !.
sum_of_squares(N, Result) :-
    Next is N - 1,
    sum_of_squares(Next, Temp),
    Result is Temp + N * N.


difference(N, Result) :-
    square_of_sum(N, R1),
    sum_of_squares(N, R2),
    Result is R1 - R2.
