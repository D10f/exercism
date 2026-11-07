armstrong_number(Number) :-
    string_chars(Number, Chars),
    length(Chars, Digits),
    maplist(atom_number, Chars, DigitList),
    maplist(my_pow(Digits), DigitList, SquaredList),
    sum_list(SquaredList, Result),
    Result =:= Number.

my_pow(X, Y, R) :-
    R is Y ** X.
