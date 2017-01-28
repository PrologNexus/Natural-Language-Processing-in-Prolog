# Natural-Language-Processing-in-Prolog
Introduction to Natural Language Processing in Prolog - Parsers

The implemantation of each parser is taken from <i>Natural Language Processing for Prolog Programmers</i> by Michael A. Covington

The grammar used for each parser in this repository is:

S -> NP VP 

NP -> D N

NP -> NP Conj NP  <i>// not for top-down parsers</i>

VP -> V NP (PP)

PP -> P NP

D -> null  <i>// not for bottom-up parsers</i>

D -> the, all, every

P -> near

Conj -> and

N -> dog, dogs, cat, cats, elephant, elephants

V -> chase, chases, see, sees, amuse, amuses

