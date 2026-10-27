create_set([]).

create_set([], []).
create_set(Data, Set) :-
    create_set(Data, Set, []).

create_set([], Set, Acc) :-
    sort(Acc, Set).
create_set([H|T], Set, Acc) :-
    create_set(T, Set, [H|Acc]).

is_empty(Set) :-
    length(Set, 0).

in_set(Value, Set) :-
    member(Value, Set).

is_subset(Set1, Set2) :-
    forall(member(M, Set1), member(M, Set2)).

is_disjoint(Set1, Set2) :-
    forall(member(M, Set1), \+ member(M, Set2)).

difference([], _, []).
difference(Shunt, [], Shunt).
difference([H1|T1], [H2|T2], Diff) :-
    H1 =:= H2,
    difference(T1, T2, Diff).
difference([H1|T1], [H2|T2], [H1|Diff]) :-
    H1 \== H2,
    H1 < H2,
    difference(T1, [H2|T2], Diff).
difference([H1|T1], [H2|T2], Diff) :-
    H1 \== H2,
    H1 > H2,
    difference([H1|T1], T2, Diff).

intersection([], _, []).
intersection(_, [], []).
intersection([H1|T1], [H2|T2], [H1|Intersect]) :-
    H1 =:= H2,
    intersection(T1, T2, Intersect).
intersection([H1|T1], [H2|T2], Intersect) :-
    H1 \== H2,
    H1 < H2,
    intersection(T1, [H2|T2], Intersect).
intersection([H1|T1], [H2|T2], Intersect) :-
    H1 \== H2,
    H1 > H2,
    intersection([H1|T1], T2, Intersect).

union(Set1, Set2, Union) :-
    append(Set1, Set2, Set3),
    sort(Set3, Union).

add(Value, Set, Added) :-
    Updated = [Value|Set],
    sort(Updated, Added).
