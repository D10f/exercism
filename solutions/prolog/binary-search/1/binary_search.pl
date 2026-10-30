find([], _, _) :- fail, !
find([X], Y, _) :- X \== Y, fail, !.
find([X], Y, 0) :- X =:= Y.
find(List, Value, Index) :-
    sort(List, Sorted),
    split(Sorted, Left, Mid, _),
    Value =:= Mid,
    length(Left, L),
    Index is L.

find(List, Value, Index) :-
    sort(List, Sorted),
    split(Sorted, Left, Mid, Right),
    Value > Mid,
    length(Left, L),
    find(Right, Value, NewIndex),
    Index is NewIndex + L + 1.

find(List, Value, Index) :-
    sort(List, Sorted),
    split(Sorted, Left, Mid, Right),
    Value < Mid,
    find(Left, Value, Index).

slice(N, List, Left, Right) :-
    slice(N, List, Left, Right, []).
slice(0, Remaining, Shunt, Remaining, Shunt).
slice(_, [], Shunt, [], Shunt).
slice(N, [H|T], Left, Right, Acc) :-
    M is N - 1,
    append(Acc, [H], NewAcc),
    slice(M, T, Left, Right, NewAcc).

split(List, Left, Mid, Right) :-
    length(List, L),
    Half is div(L,2),
    slice(Half, List, Left, _Right),
    [H|T] = _Right,
    Mid = H,
    Right = T.
