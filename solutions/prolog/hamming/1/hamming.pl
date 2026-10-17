compare_dna_strands([], [], Shunt, Shunt).

compare_dna_strands([H1|T1], [H2|T2], Dist, Acc) :-
    Partial is Acc + 1,
    compare_dna_strands(T1, T2, Dist, Partial).

compare_dna_strands([H|T1], [H|T2], Dist, Acc) :-
    compare_dna_strands(T1, T2, Dist, Acc).

hamming_distance(Str1, Str2, Dist) :-
    string_chars(Str1, Chars1),
    string_chars(Str2, Chars2),
    length(Chars1, L1),
    length(Chars2, L2),
    L1 =:= L2,
    compare_dna_strands(Chars1, Chars2, Dist, 0).
