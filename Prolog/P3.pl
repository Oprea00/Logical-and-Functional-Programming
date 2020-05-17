% 8. Generate all strings of n parenthesis correctly closed.
% Eg: n=4 => (()) and () ()

%half(N:number,R:number)
%(i,o)
half(N,R):-R is div(N,2).

%generate(N,Index)=
%       {[], N mod 2 !=0
%       {[], Index=0
%       {(( U () U generate(N,Index-2) ,Index>N/2
%       {)) U () U generate(N,Index-2), Index<=N/2
%
%generate(N:index,Index:number,R1:list,R2:list)
%(i,i,o,o)

generate(N,N,[],[]):-N mod 2 =\=0, !.
generate(_,0,[],[]).
generate(N,Index,['(','('|R1],['(',')'|R2]):-half(N,H), Index>H,  NewIndex is Index-2, generate(N,NewIndex,R1,R2).
generate(N,Index,[')',')'|R1],['(',')'|R2]):-half(N,H), Index=<H, NewIndex is Index-2, generate(N,NewIndex,R1,R2).

mainGenerate(N,R1,R2):-generate(N,N,R1,R2).
