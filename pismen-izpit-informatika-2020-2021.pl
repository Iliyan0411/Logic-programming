% Task 1
mybetween(A, B, A):- A =< B.
mybetween(A, B, C):- A < B, A1 is A+1, mybetween(A1, B, C). 

slice([], _, _, _, []).
slice([H|T], Begin, End, N, [H|Res]):- H mod N =:= 0, mybetween(Begin, End, H), slice(T, Begin, End, N, Res).
slice([H|T], Begin, End, N, S):- not(( H mod N =:= 0, mybetween(Begin, End, H) )), slice(T, Begin, End, N, S).



% Task 2
lessOrEqual(X, Y):- X =< Y.

isSorted([]).
isSorted([_]).
isSorted([X, Y|T]):- lessOrEqual(X, Y), isSorted([Y|T]).

psort(L, S):- permutation(L, S), isSorted(S).
%

takeSecondParameter([], []).
takeSecondParameter([[_, Snd]|T], [Snd|Rest]):- takeSecondParameter(T, Rest).

necesseryNumpas(_, Weight, []):- Weight =< 0.
necesseryNumpas([Capacity|T], Weight, [Capacity|Rest]):- Weight > 0, Weight1 is Weight-Capacity,
                                                                     necesseryNumpas(T, Weight1, Rest).

chocolatePalaceHelper([], _, 0).
chocolatePalaceHelper([Weight|T], Umpas, RedPoints):- necesseryNumpas(Umpas, Weight, NewUmpas),
                                                      length(NewUmpas, N), RedPoints1 is RedPoints-N,
                                                      chocolatePalaceHelper(T, Umpas, RedPoints1).
chocolatePalace(Blocks, Umpas, RedPoints):- takeSecondParameter(Blocks, NewBlocks),
                                            takeSecondParameter(Umpas, NewUmpas),
                                            psort(NewUmpas, SortedUmaps),
                                            chocolatePalaceHelper(NewBlocks, SortedUmaps, RedPoints).