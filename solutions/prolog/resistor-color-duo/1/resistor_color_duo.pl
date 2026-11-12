value([First, Second | _], Value) :-
    colors(Colors),
    lookup_resistance(Colors, First, FirstCode),
    lookup_resistance(Colors, Second, SecondCode),
    Value is FirstCode * 10 + SecondCode.

lookup_resistance([H|T], Color, Code) :-
    H \= Color,
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
