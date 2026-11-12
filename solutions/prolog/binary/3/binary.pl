binary(String, Decimal) :-
    string_chars(String, Chars),
    length(Chars, N),
    maplist(atom_number, Chars, Bits),
    sum_binary_digits(Bits, N, Decimal, 0).

sum_binary_digits([], _, Acc, Acc).
sum_binary_digits([Bit|Rest], N, Result, Acc) :-
    Bit =< 1,
    Exponent is N - 1,
    Value is (2 ** Exponent) * Bit,
    Sum is Acc + Value,
    sum_binary_digits(Rest, Exponent, Result, Sum).
