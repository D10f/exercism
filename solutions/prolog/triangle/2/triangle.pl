is_equilateral(A, B, C, "equilateral") :-
    A =:= B,
    B =:= C.

is_isosceles(A, B, C, "isosceles") :-
    A =:= B;
    A =:= C;
    B =:= C.

is_scalene(A, B, C, "scalene") :-
    A =\= B,
    A =\= C,
    B =\= C.

is_valid(A, B, C) :-
    A > 0,
    B > 0,
    C > 0,
    A + B >= C,
    B + C >= A,
    C + A >= B.

triangle(A, B, C, T) :-
    is_valid(A, B, C),
    (
        is_equilateral(A, B, C, T);
        is_isosceles(A, B, C, T);
        is_scalene(A, B, C, T)
    ).
