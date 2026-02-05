check_alphabet([], []).
check_alphabet(_, []).
check_alphabet([Letter|Rest], Alphabet) :-
    select(Letter, Alphabet, Temp), !,
    check_alphabet(Rest, Temp).
check_alphabet([_|Rest], Alphabet) :-
    check_alphabet(Rest, Alphabet).

pangram(Sentence) :-
    Alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
                'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
                'w', 'x', 'y', 'z'],
    string_lower(Sentence, Lower),
    string_chars(Lower, Chars),
    check_alphabet(Chars, Alphabet).
