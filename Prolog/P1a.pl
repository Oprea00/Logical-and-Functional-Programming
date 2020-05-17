%a. Write a predicate to determine the lowest common multiple of a list formed from integer numbers
%gcd=greatest common divisor
%           {l1           , l1=l2
%gcd(l1,l2)={gcd(l1,l2-l1), l1<l2
%           {gcd(l2,l1)   , l1>l2

%gcd(L1:int,L2:int,R:int)
%(i,i,o)

gcd(L1,L2,R):-L1=L2,R=L1.
gcd(L1,L2,R):-L1<L2,L3 is L2-L1,gcd(L1,L3,R).
gcd(L1,L2,R):-L1>L2,gcd(L2,L1,R).


%lcm=lowest common multiple
%            {1 ,n=0
%lcm(l1..ln)=
%            {l1*lcm(l2..ln)/gcd(l1,lcm(l2..ln))  ,otherwise

%lcm(L:list,R:int)
%(i,o)

lcm([],1).
lcm([H1|L],R):-lcm(L,R1),gcd(H1,R1,R2),R is H1*R1/R2.

