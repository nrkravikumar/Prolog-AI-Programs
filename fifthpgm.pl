% 8-Queen Problem

goal([1,2,3, 4,0,5, 6,7,8]).

%% move left in the top row
move([X1,0,X3, X4,X5,X6, X7,X8,X9],
[0,X1,X3, X4,X5,X6, X7,X8,X9]).

move([X1,X2,0, X4,X5,X6, X7,X8,X9],
[X1,0,X2, X4,X5,X6, X7,X8,X9]).

%% move left in the middle row
move([X1,X2,X3, X4,0,X6,X7,X8,X9],
[X1,X2,X3, 0,X4,X6,X7,X8,X9]).

move([X1,X2,X3, X4,X5,0,X7,X8,X9],
[X1,X2,X3, X4,0,X5,X7,X8,X9]).

%% move left in the bottom row
move([X1,X2,X3, X4,X5,X6, X7,0,X9],
[X1,X2,X3, X4,X5,X6, 0,X7,X9]).

move([X1,X2,X3, X4,X5,X6, X7,X8,0],
[X1,X2,X3, X4,X5,X6, X7,0,X8]).

%% move right in the top row
move([0,X2,X3, X4,X5,X6, X7,X8,X9],
[X2,0,X3, X4,X5,X6, X7,X8,X9]).

move([X1,0,X3, X4,X5,X6, X7,X8,X9],
[X1,X3,0, X4,X5,X6, X7,X8,X9]).

%% move right in the middle row
move([X1,X2,X3, 0,X5,X6, X7,X8,X9],
[X1,X2,X3, X5,0,X6, X7,X8,X9]).

move([X1,X2,X3, X4,0,X6, X7,X8,X9],
[X1,X2,X3, X4,X6,0, X7,X8,X9]).

%% move right in the bottom row
move([X1,X2,X3, X4,X5,X6,0,X8,X9],
[X1,X2,X3, X4,X5,X6,X8,0,X9]).

move([X1,X2,X3, X4,X5,X6,X7,0,X9],
[X1,X2,X3, X4,X5,X6,X7,X9,0]).

%% move up from the middle row
move([X1,X2,X3, 0,X5,X6, X7,X8,X9],
[0,X2,X3, X1,X5,X6, X7,X8,X9]).

move([X1,X2,X3, X4,0,X6, X7,X8,X9],
[X1,0,X3, X4,X2,X6, X7,X8,X9]).

move([X1,X2,X3, X4,X5,0, X7,X8,X9],
[X1,X2,0, X4,X5,X3, X7,X8,X9]).

%% move up from the bottom row
move([X1,X2,X3, X4,X5,X6, X7,0,X9],
[X1,X2,X3, X4,0,X6, X7,X5,X9]).

move([X1,X2,X3, X4,X5,X6, X7,X8,0],
[X1,X2,X3, X4,X5,0, X7,X8,X6]).

move([X1,X2,X3, X4,X5,X6, 0,X8,X9],
[X1,X2,X3, 0,X5,X6, X4,X8,X9]).

%% move down from the top row
move([0,X2,X3, X4,X5,X6, X7,X8,X9],
[X4,X2,X3, 0,X5,X6, X7,X8,X9]).

move([X1,0,X3, X4,X5,X6, X7,X8,X9],
[X1,X5,X3, X4,0,X6, X7,X8,X9]).

move([X1,X2,0, X4,X5,X6, X7,X8,X9],
[X1,X2,X6, X4,X5,0, X7,X8,X9]).

%% move down from the middle row
move([X1,X2,X3, 0,X5,X6, X7,X8,X9],
[X1,X2,X3, X7,X5,X6, 0,X8,X9]).

move([X1,X2,X3, X4,0,X6, X7,X8,X9],
[X1,X2,X3, X4,X8,X6, X7,0,X9]).

move([X1,X2,X3, X4,X5,0, X7,X8,X9],
[X1,X2,X3, X4,X5,X9, X7,X8,0]).

dfsSimplest(S, [S]) :- 
goal(S).

dfsSimplest(S, [S|Rest]) :- 
move(S, S2), dfsSimplest(S2, Rest). dfs(S, Path, Path) :- 
goal(S).

dfs(S, Checked, Path) :-
% try a move
move(S, S2),
% ensure the resulting state is new

\+member(S2, Checked),

% and that this state leads to the goal
dfs(S2, [S2|Checked], Path).

% Input:
		dfs([1,2,3, 4,7,5, 6,0,8], [], Path), length(Path, N).
% Output:

		N = 23759
		more path values thar are to be seen 
		in screenshot please refer it because the content is
		to be not copied more values are executed there






