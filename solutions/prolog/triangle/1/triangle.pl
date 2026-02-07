is_equilateral(A, B, C) :-
    A =:= B,
    B =:= C.

is_isosceles(A, B, C) :-
    A =:= B;
    A =:= C;
    B =:= C.

is_scalene(A, B, C) :-
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

triangle(A, B, C, Type) :-
    is_valid(A, B, C),
    is_equilateral(A, B, C),
    text_to_string("equilateral", Type).

triangle(A, B, C, Type) :-
    is_valid(A, B, C),
    is_isosceles(A, B, C),
    text_to_string("isosceles", Type).

triangle(A, B, C, Type) :-
    is_valid(A, B, C),
    is_scalene(A, B, C),
    text_to_string("scalene", Type).