anagram(Word, Candidates, Anagrams) :-
    include(is_anagram(Word), Candidates, Anagrams).

is_anagram(Word, Candidate) :-
    string_lower(Word, LowerWord),
    string_lower(Candidate, LowerCandidate),
    string_chars(LowerWord, CharsWord),
    string_chars(LowerCandidate, CharsCandidate),
    check_length(CharsWord, CharsCandidate),
    check_inequality(CharsWord, CharsCandidate),
    check_letter_count(CharsWord, CharsCandidate).

check_length(Chars1, Chars2) :-
    length(Chars1, L1),
    length(Chars2, L2),
    L1 =:= L2.

check_inequality([], []) :- false.
check_inequality([H1|_], [H2|_]) :-
    dif(H1, H2).
check_inequality([H1|T1], [H2|T2]) :-
    check_inequality(T1, T2).

check_letter_count(L1, L2) :-
    check_letter_count(L1, L2, []).
check_letter_count(_, [], _).
check_letter_count([H|T1], [H|T2], Acc) :-
    append(T1, Acc, Result),
    check_letter_count(Result, T2, []).
check_letter_count([H1|T1], [H2|T2], Acc) :-
    check_letter_count(T1, [H2|T2], [H1|Acc]).


