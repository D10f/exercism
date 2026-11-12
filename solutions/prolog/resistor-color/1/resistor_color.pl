color_code(Color, Code) :-
    colors(Colors),
    lookup_resistance(Colors, Color, Code).

lookup_resistance([H|T], Color, Code) :-
    lookup_resistance(T, Color, Acc),
    Code is Acc + 1.

lookup_resistance([Color|_], Color, 0).

colors(Colors) :-
    Colors = [
        "black",
        "brown",
        "red",
        "orange",
        "yellow",
        "green",
        "blue",
        "violet",
        "grey",
        "white"
    ].
