% The parser will be used like this:
% - for accepting a phrase: parse([the,dog,chases,the,cat],[s]). 
% - for discovering what kind of phrase is the input string: parse([the,dog,chases,the,cat],[What]).
% - for generating phrases: 

parse(S, Result):- shift_reduce(S,[],Result).

shift_reduce(S,Stack,Result):- shift(Stack,S,NewStack,S1),
                               reduce(NewStack,ReducedStack),
                               shift_reduce(S1,ReducedStack,Result).
shift_reduce([],S,S).

shift(Stack,[H|T],[H|Stack],T).

reduce(Stack,ReducedStack):- brule(Stack,Stack2),
                             reduce(Stack2,ReducedStack).
reduce(Stack,Stack).

brule([vp,np|X],[s|X]).
brule([n,d|X],[np|X]).
brule([np,conj,np|X],[np|X]).
brule([np,v|X],[vp|X]).
brule([pp,np,v|X],[vp|X]).
brule([np,p|X],[pp|X]).
brule([Word|X],[Cat|X]):- word(Cat,Word).

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
