complement('C', 'G').
complement('G', 'C').
complement('T', 'A').
complement('A', 'U').

rna_transcription(DNA, RNA) :-
    string_chars(DNA, Codepoints),
    maplist(complement, Codepoints, Temp),
    string_chars(RNA, Temp).