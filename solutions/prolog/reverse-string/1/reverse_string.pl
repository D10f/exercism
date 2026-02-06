string_reverse(Str, Reversed) :-
    string_chars(Str, Chars),
    reverse(Chars, Tmp),
    string_chars(Reversed, Tmp).
