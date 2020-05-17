%7.a. Determine the position of the maximal element of a linear list.
%b. For a heterogeneous list, formed from integer numbers and list of numbers, replace every sublist with the
%position of the maximum element from that sublist

%                    {0, n=0
%findMax(l1..ln,max)={findMax(l2..ln,max) ,l1 < max
%                    {findMax)l2..ln,l1)  ,l1 > max
%findMax(L:list,Max:int,R:int)
%(i,i,o)

findMax([],Max,Max).
findMax([H|T],Max,R):-H=<Max,findMax(T,Max,R).
findMax([H|T],Max,R):-H>Max,findMax(T,H,R).

mainFindMax(L,R):-findMax(L,0,R).

%                         {[],n=0
% findPosition(l1..ln,pos)={findPosition(l2..ln,pos+1),findMax(l1..ln!=l1
%                          {pos U
%                          findPosition(l2..ln,pos+1),findMax(l1..ln)=l1
%
% findPosition(L:list,Pos:int,R:list,Copy:list)
% (i,i,o)

findPosition([],_,[],_).
findPosition([H|T],Pos,R,Copy):-mainFindMax(Copy,R1), H=\=R1, NextPos is Pos+1, findPosition(T,NextPos,R,Copy).
findPosition([H|T],Pos,[Pos|R],Copy):-mainFindMax(Copy,R1), H=:=R1, NextPos is Pos+1, findPosition(T,NextPos,R,Copy).

mainFindPosition(L,R):-findPosition(L,1,R,L).

%                {[],n=0
%replace(l1..ln)={l1 U replace(l2..ln) ,l1=number
%                {findPosition(l1,0) U replace(l2..ln) ,l1=list
%
%replace(L:list,R:list)
%(i,o)

replace([],[]).
replace([H|T],[H|R]):-number(H), replace(T,R).
replace([H|T],[R1|R]):-is_list(H), mainFindPosition(H,R1), replace(T,R).

