collatz_steps(N, Steps) :-
    N >= 1,
    collatz_steps(N, Steps, 0).

collatz_steps(1, Shunt, Shunt).

collatz_steps(N, Steps, Acc) :-
    mod(N, 2) =:= 0,
    M is N / 2,
    R is Acc + 1,
    collatz_steps(M, Steps, R).

collatz_steps(N, Steps, Acc) :-
    mod(N, 2) =\= 0,
    M is N * 3 + 1,
    R is Acc + 1,
    collatz_steps(M, Steps, R).
