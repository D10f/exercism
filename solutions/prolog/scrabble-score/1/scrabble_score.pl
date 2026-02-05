points(['a','e','i','o','u','l','n','r','s','t'], 1).
points(['d','g'], 2).
points(['b','c','m','p'], 3).
points(['f','h','v','w','y'], 4).
points(['k'], 5).
points(['j', 'x'], 8).
points(['q', 'z'], 10).

letter_score(Letter, Value) :-
    points(L, P),
    member(Letter, L),
    Value = P, !.
letter_score(_, 0).

score(Word, Score) :-
    string_lower(Word, Lower),
    string_chars(Lower, Chars),
    maplist(letter_score, Chars, Temp),
    sumlist(Temp, Score).
