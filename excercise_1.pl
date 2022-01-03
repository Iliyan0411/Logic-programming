% This tasks can be find on https://learn.fmi.uni-sofia.bg/pluginfile.php/358583/mod_resource/content/1/problems-archive.pdf

% Task 1
dekart([], []).
dekart([H|T], [X|Res]):- member(X, H), dekart(T, Res).

% Graph 
graph([[a, b, c, d], [[a, b], [c, a], [b, c], [c, d]]]).

edge([_, E], X, Y):- member([X, Y], E); member([Y, X], E).

path(_, A, A, Visited, Path):- reverse([A|Visited], Path).
path([V, E], A, B, Visited, Path):- edge([V, E], A, C), not(member(C, Visited)), path([V, E], C, B, [A|Visited], Path).
path([V, E], A, B, Path):- path([V, E], A, B, [], Path).

isConnected([V, E]):- not(( member(A, V), member(B, V), A \= B, not(path([V, E], A, B, _)) )).

hasCycle([V, E], [X|Path]):- edge([V, E], X, Y), path([V, E], Y, X, Path), length(Path, N), N > 2.

hasNotCycle([V, E]):- not(hasCycle([V, E], _)).


% 2.
natural(0).
natural(X):- natural(Y), X is Y+1.

% a(0, 1).
% a(1, 1).
% a(N, Result):- N1 is N-1, N2 is N-2, a(N1, A), a(N2, B), Result is A+B.

a(1, 1).
a(Y, Z):- a(X, Y), Z is X+Y.
a(X):- a(X, _).

b(0, 1).
b(1, 1).
b(N, Result):- N1 is N-1, N2 is N-2, b(N1, A), b(N2, B), Result is 3*A*(-1)^N1 + B*(-1)^N2.

p(N, K):- K1 is K+1, b(K, A), b(K1, C), a(N, B), A =< B, B < C.


% Задача 2
q([V, E], X):- hasCycle([V, E], Path), member(X, Path).


% Transposition
getFirstColumn([], [], []).
getFirstColumn([[H|T]|Rest], [H|Column], [T|NewM]):- getFirstColumn(Rest, Column, NewM). 

emptyRows([]).
emptyRows([[]|T]):- emptyRows(T).

myTransponse(M, []):- emptyRows(M).
myTransponse(M, [Column|Rest]):- getFirstColumn(M, Column, NewM), myTransponse(NewM, Rest).

% To page 5