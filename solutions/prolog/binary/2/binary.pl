binary(String, Decimal) :-
    string_chars(String, Chars),
    length(Chars, N),
    sum_binary_digits(Chars, N, Decimal).

sum_binary_digits([], _, 0).
sum_binary_digits([H|T], N, Decimal) :-
    H = '0',
    sum_binary_digits(T, N - 1, Decimal).
sum_binary_digits([H|T], N, Decimal) :-
    H = '1',
    Sum is 2 ** (N - 1),
    sum_binary_digits(T, N - 1, RecursiveSum),
    Decimal is RecursiveSum + Sum.
