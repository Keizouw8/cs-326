% Problem 1
% Part A
isSet([]).
isSet([H|T]) :- not(member(H, T)), isSet(T).
% Part B
isSubset([], _).
isSubset([H|T], S) :- member(H, S), isSubset(T, S).
% Part C
unionSets([], B, B).
unionSets([H|T], B, C) :- member(H, B), !, unionSets(T, B, C).
unionSets([H|T1], B, [H|T2]) :- unionSets(T1, B, T2).
% Part D
intersectionSets([], _, []).
intersectionSets([H|T1], B, [H|T2]) :- member(H, B), !, intersectionSets(T1, B, T2).
intersectionSets([H|T], B, C) :- intersectionSets(T, B, C).

% Problem 2
tally(_, [], 0).
tally(E, [E|T], N) :- tally(E, T, M), !, N is M + 1.
tally(E, [H|T], N) :- tally(E, T, N).

% Problem 3
subst(_, _, [], []).
subst(X, X, L, L).
subst(X, Y, [X|T1], [Y|T2]) :- subst(X, Y, T1, T2), !.
subst(X, Y, [H|T1], [H|T2]) :- subst(X, Y, T1, T2).

% Problem 4
insert(X, [], [X]).
insert(X, [H|T], [X,H|T]) :- X < H, !.
insert(X, [H|T1], [H|T2]) :- insert(X, T1, T2).

% Problem 5
flattenList([], []).
flattenList([H|T1], [H|T2]) :-  not(is_list(H)), !, flattenList(T1, T2).
flattenList([H1|T1], B) :- flattenList(H1, H2), flattenList(T1, T2), append(H2, T2, B).
