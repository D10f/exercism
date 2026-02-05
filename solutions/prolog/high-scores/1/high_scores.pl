latest([X], X).
latest([H|T], Latest) :-
    latest(T, Latest).

personal_best(Scores, Best) :-
    personal_best(Scores, Best, 0).
personal_best([], Shunt, Shunt).
personal_best([H|T], Best, Out) :-
    H > Out,
    personal_best(T, Best, H).
personal_best([H|T], Best, Out) :-
    H =< Out,
    personal_best(T, Best, Out).

personal_top_three([H], [H]).
personal_top_three([H,T], Acc) :- msort([H,T], Tmp), reverse(Tmp, Acc).
personal_top_three(Scores, TopThree) :-
    personal_top_three(Scores, [0, 0, 0], TopThree).
personal_top_three([], Shunt, Shunt).
personal_top_three([First|Rest], [A,B,_], TopThree) :-
    First > A,
    personal_top_three(Rest, [First, A, B], TopThree).
personal_top_three([First|Rest], [A,B,_], TopThree) :-
    First > B,
    personal_top_three(Rest, [A, First, B], TopThree).
personal_top_three([First|Rest], [A,B,C], TopThree) :-
    First > C,
    personal_top_three(Rest, [A, B, First], TopThree).
personal_top_three([_|Rest], Acc, TopThree) :-
    personal_top_three(Rest, Acc, TopThree).
