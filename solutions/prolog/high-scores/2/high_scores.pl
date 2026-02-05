% Returns the last item in a list
last([], []).
last([H], H).
last([_|T], R) :-
    last(T, R).

% Returns the highest number in a list
max([], R, R).
max([H|T], X, R) :-
    H > X,
    max(T, H, R);
    max(T, X, R).

% Returns the number of items in a list
length([], R, R).
length([_|T], X, R) :-
    length(T, X + 1, R).

% concat([], L2, L2).
% concat([H|TA], L2, [H|TB]) :-
%     concat(TA, L2, TB).

% Returns a list composed of the first N items in a list. If the list
% has fewer than N items, it returns them all.
take(0, _, []).
take(N, [], []).
take(N, [H|TA], [H|TB]) :-
    N > 0,
    N2 is N - 1,
    take(N2, TA, TB).

% Returns the list minus the first element.
shift([_|T], T).
shift(0, L, L).
shift(C, L, R) :-
    C > 0,
    S is C - 1,
    shift(L, Tmp),
    shift(S, Tmp, R).

% Returns two sub-lists, left and right, of (roughly) equal size.
split([H], [H], []).
split([H,T], [H], [T]).
split(L, Left, Right) :-
    length(L, N),
    I is N div 2,
    take(I, L, Left),
    shift(I, L, Right).

% Sorts the list in ascending. Implementation from: https://en.wikipedia.org/wiki/Merge_sort#Top-down_implementation_in_a_declarative_style
merge_sort([], []).
merge_sort([H], [H]).
merge_sort(L, R) :-
    split(L, Left, Right),
    merge_sort(Left, LeftSorted),
    merge_sort(Right, RightSorted),
    merge(LeftSorted, RightSorted, R).

merge([], R, R).
merge(L, [], L).
merge([X|XS], [Y|YS], R) :-
    X =< Y,
    merge(XS, [Y|YS], Tmp),
    R = [X|Tmp].
merge([X|XS], [Y|YS], R) :-
    X > Y,
    merge([X|XS], YS, Tmp),
    R = [Y|Tmp].

% Reverses the items in a list.
reverse(L, R) :-
    reverse(L, [], R).
reverse([], A, A).
reverse([H|T], A, R) :-
    reverse(T, [H|A], R).

latest(L, R) :-
    last(L, R).

personal_best(L, R) :-
    max(L, 0, R).

personal_top_three(L, R) :-
    merge_sort(L, S),
    reverse(S, T),
    take(3, T, R).
