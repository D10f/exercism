complement(67, 'G').
complement(71, 'C').
complement(84, 'A').
complement(65, 'U').

rna_transcription(DNA, RNA) :-
    string_codes(DNA, Codepoints),
    maplist(complement, Codepoints, Temp),
    string_codes(RNA, Temp).