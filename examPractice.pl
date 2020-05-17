f([],0).
f([H|T],S):-f(T,S1),S is S1-H.



reverseList([],AUX,AUX).
reverseList([H|T],AUX,R):-is_list(H),reverseList(H,[],R2),reverseList(T,[R2|AUX],R).
reverseList([H|T],AUX,R):-reverseList(T,[H|AUX],R).


revMain(L,R):-reverseList(L,[],R).


% generate(L:initial list;AUX:auxiliary list;R:result list;S:a list; N:the number of elements; C :count how many in a generates sublist)
%
% (i,i,o,i,i)

lengthL([],0).
lengthL([_|T],R):-R1 is R+1,lengthL(T,R1).


generate([],[],R,R,_,_,_).
generate(L,_,R,_,_,_,X):-X=:=R1,lengthL(L,R1),generate([],[],R,R,_,_,_).
generate(L,[H|T],R,S,N,C,X):-C=:=0,C1 is C+1,generate(L,T,R,[H|S],N,C1,X).
generate(L,[H1|T],R,S,N,C,X):-C<N,C1 is C+1,generate(L,T,R,[H1|S],N,C1,X).
generate(L,AUX,R,S,N,C,X):-C=:=N,generate(L,AUX,[S|R],[],N,0,X).
generate(L,[],R,S,N,C,X):-X1 is X+1,generate(L,L,R,S,N,C,X1).

mainGenerate(L,N,R):-generate(L,L,R,[],N,0,3).



sublists([], []).
sublists([H|T], [H|R]):-sublists(T, R).
sublists([_|T], R):-sublists(T, R).


process(L, N, R):-length(R, N),sublists(L, R).

all_solutions(L, N, R):-findall(AUX, process(L, N, AUX), R).


deleteE([],_,[]).
deleteE([H|T],E,[R2|R]):-is_list(H),deleteE(H,E,R2),deleteE(T,E,R).
deleteE([H|T],E,R):-H=E,deleteE(T,E,R).
deleteE([H|T],E,[H|R]):-H\=E,deleteE(T,E,R).


f2([],[]).
f2([H|T],[H|S]):-f2(T,S).
f2([H|T],S):-H mod 2 =:= 0, f2(T,S).

f3([],0).
f3([H|T],S):-f3(T,S1),S is S1-H.


% ------------------------------------------------------------permutari
%
elim(E, [E|L], L).
elim(E,[A|X],[A|Y]):-
    elim(E,X,Y).

perm([],[]).
perm([E|L],T):-
    perm(L,R),
    elim(E,T,R).

check([_]).
check([A,B|T]):-
    abs(A-B)<4,
    check([B|T]).

generate(L,R):-
    perm(L,R),
    check(R).

get_all(L,R):-
    findall(RPartial, generate(L,RPartial), R).
elim_all(E,R,L):- findall(RP,elim(E,RP,L),R).



%------------
subs([],[]).
subs([A|L],[A|S]):-  subs(L,S).
subs([_|L],S):- subs(L,S).

ascending([_]).
ascending([A,B|T]):-
    A<B,
    ascending([B|T]).

generate2(L,R):-
    subs(L,R),
    ascending(R).

get_all2(L,R):-
    findall(RPartial, generate2(L,RPartial),R).
all_subs(L,R):-findall(RPartial,subs(L,RPartial),R).


f22([],0).
f22([H|T],S):-f(T,S1),H<S1, !, S is H+S1.
f22([_|T],S):-f(T,S1),S is S1+2.

p(1).
p(2).
q(1).
q(2).
r(1).
r(2).

s:-!,p(X),q(Y),r(Z), write(X),write(Y),write(Z),nl.

fa6([],[]).
fa6([H|T],[H|S]):-f(T,S).
fa6([H|T],S):-H mod 2 =:=0,fa6(T,S).
