paired(String) :-
    string_chars(String, Chars),
    is_paired(Chars, []).

brackets('[', ']').
braces('{', '}').
parens('(', ')').

is_opening(Char) :-
    brackets(Char, ']');
    braces(Char, '}');
    parens(Char, ')').

is_closing(Char) :-
    brackets('[', Char);
    braces('{', Char);
    parens('(', Char).

is_closing(Opening, Closing) :-
    brackets(Opening, Closing);
    braces(Opening, Closing);
    parens(Opening, Closing).

is_paired([], []).

is_paired([H|T], Stack) :-
    is_opening(H),
    is_paired(T, [H|Stack]).

is_paired([H|T], [X|Stack]) :-
    is_closing(X, H),
    is_paired(T, Stack).

is_paired([H|T], Stack) :-
    (\+ is_closing(H), \+ is_opening(H)),
    is_paired(T, Stack).