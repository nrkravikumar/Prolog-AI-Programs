% Jug Problem

min(X,Y,X):-X<Y,!.
min(_,Y,Y).

rev(L,R):-revacc(L,[],R).
revacc([],R,R):-!.
revacc([H|T],A,R):-revacc(T,[H|A],R).
%solve water jug problem using DFS
chk(_,X,My,Y,Nx,Ny):- 
X>0,Y<My,Ey is My-Y,min(X,Ey,P),Nx is X-P,Ny is Y+P.
jug(Mx,My,Mz,X,Y,Z,Fx,Fy,Fz):- 
jug(Mx,X,My,Y,Mz,Z,Fx,Fy,Fz,[],['Initially']).

jug(_,Fx,_,Fy,_,Fz,Fx,Fy,Fz,T,R):-
!,rev([[Fx,Fy,Fz],[Fx,Fy,Fz]|T],TR),rev(['Finally'|R],RR),display(TR,RR).

jug(Mx,X,My,Y,Mz,Z,Fx,Fy,Fz,T,R):-
chk(Mx,X,My,Y,Nx,Ny),not(member([Nx,Ny,Z],T)),
jug(Mx,Nx,My,Ny,Mz,Z,Fx,Fy,Fz,[[X,Y,Z]|T],
	['Pour liquid from jug1 into jug2'|R]).
jug(Mx,X,My,Y,Mz,Z,Fx,Fy,Fz,T,R):-
chk(Mx,X,Mz,Z,Nx,Nz),not(member([Nx,Y,Nz],T)),
jug(Mx,Nx,My,Y,Mz,Nz,Fx,Fy,Fz,[[X,Y,Z]|T],
	['Pour liquid from jug1 into jug3'|R]).
jug(Mx,X,My,Y,Mz,Z,Fx,Fy,Fz,T,R):-
chk(My,Y,Mz,Z,Ny,Nz),not(member([X,Ny,Nz],T)),
jug(Mx,X,My,Ny,Mz,Nz,Fx,Fy,Fz,[[X,Y,Z]|T],
	['Pour liquid from jug2 into jug3'|R]).
jug(Mx,X,My,Y,Mz,Z,Fx,Fy,Fz,T,R):-
chk(My,Y,Mx,X,Ny,Nx),not(member([Nx,Ny,Z],T)),
jug(Mx,Nx,My,Ny,Mz,Z,Fx,Fy,Fz,[[X,Y,Z]|T],
	['Pour liquid from jug2 into jug1'|R]).
jug(Mx,X,My,Y,Mz,Z,Fx,Fy,Fz,T,R):-
chk(Mz,Z,Mx,X,Nz,Nx),not(member([Nx,Y,Nz],T)),
jug(Mx,Nx,My,Y,Mz,Nz,Fx,Fy,Fz,[[X,Y,Z]|T],
	['Pour liquid from jug3 into jug1'|R]).
jug(Mx,X,My,Y,Mz,Z,Fx,Fy,Fz,T,R):-
chk(Mz,Z,My,Y,Nz,Ny),not(member([X,Ny,Nz],T)),
jug(Mx,X,My,Ny,Mz,Nz,Fx,Fy,Fz,[[X,Y,Z]|T],
	['Pour liquid from jug3 into jug2'|R]).

display([],[]):-!.
display([T1|T],[R1|R]):-
write(R1),write(':'),write(T1),nl,display(T,R).

% Input: jug(8,5,3,8,0,0,4,4,0).

% Output: 
		Initially:[8, 0, 0]
		Pour liquid from jug1 into jug2:[3, 5, 0]
		Pour liquid from jug1 into jug3:[0, 5, 3]
		Pour liquid from jug2 into jug1:[5, 0, 3]
		Pour liquid from jug3 into jug2:[5, 3, 0]
		Pour liquid from jug1 into jug3:[2, 3, 3]
		Pour liquid from jug3 into jug2:[2, 5, 1]
		Pour liquid from jug2 into jug1:[7, 0, 1]
		Pour liquid from jug3 into jug2:[7, 1, 0]
		Pour liquid from jug1 into jug3:[4, 1, 3]
		Pour liquid from jug3 into jug2:[4, 4, 0]
		Finally:[4, 4, 0]
		1
		true





















