% The parser will be used like this
% -for accepting a phrase: parse(s,[the,dog,chases,the,cat],[]).
% -for generating phrases: parse(s,X,[]).

parse(C,[Word|S],S):- word(C,Word).
parse(C,S1,S):- rule(C,Cs), parse_list(Cs,S1,S).

parse_list([C|Cs],S1,S):- parse(C,S1,S2), parse_list(Cs,S2,S).
parse_list([],S,S).

rule(s,[np,vp]).
rule(np,[d,n]).
rule(vp,[v,np]).
rule(vp,[v,np,pp]).
rule(pp,[p,np]).
rule(d,[]).

word(d,the).
word(d,all).
word(d,every).
word(p,near).
word(conj,and).
word(n,dog).
word(n,dogs).
word(n,cat).
word(n,cats).
word(n,elephant).
word(n,elephants).
word(v,chase).
word(v,chases).
word(v,see).
word(v,sees).
word(v,amuse).
word(v,amuses).
