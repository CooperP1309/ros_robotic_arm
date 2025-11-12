% ----- Problem Instance -----
% Define all range of values...

row(1..100).
col(1..100).
val(1..100).

% ----- Generate Module -----
% when no input of generated X or Y has been provided. Generate a val 
% for the appropriate grid.
% I.e.
% generate a val (1-100) for each grid(X)(Y) where no val is assigned

{ grid(X,Y,Z) : val(Z) } = 1 :- row(X), col(Y), not gridNum(X,Y,_).

% similar to "vertex_has_colour(X) <- vertex_coloured(X,Y)" from 
% lecture example ensure that each grid keeps their provided value

grid(X,Y,Z) :- input(X,Y,Z).

% Derive grid relations
% I and J denote the coordinates of each
% of the subgrids. I corresponds to
% the row of subgrids and J corresponds 
% to the column coordinates of each subgrid
subgrid(X, Y, I, J) :- row(X), col(Y), I = (X-1)/10+1, J = (Y-1)/10+1.

% ----- Test Module -----
% 1. No two values in a row can be the same
:- grid(X, Y1, N), grid(X, Y2, N), Y1 != Y2.

% 2. No two values in a col can be the same
:- grid(X1, Y, N), grid(X2, Y, N), X1 != X2.

% E.g. If column 1 (Y1) and column 2 (Y2) have the same
%	   value under on the X row, and they are different
%	   columns, then we have broken a constraint

% 3. For 2 different grids (X1,Y1 and X2,Y2) within the same 
% subgrid (I,J) to have the same value (N) is a broken constraint
:- grid(X1, Y1, N), grid(X2, Y2, N), subgrid(X1, Y1, I, J), subgrid(X2, Y2, I, J), (X1, Y1) != (X2, Y2).

% Show the solving grids (/3 indicates the 3 arguements of grid (XYZ))

% Facts are to be inserted past this point (Usually should be in problem instance)
% but for a simpler program it's easier to append them here are the end...
gridNum(3,2,4).
gridNum(3,2,4).
gridNum(3,2,4).
gridNum(3,2,4).
gridNum(3,2,4).
gridNum(3,2,4).
gridNum(3,2,4).
gridNum(3,2,4).
gridNum(3,2,4).
gridNum(3,2,4).
gridNum(3,2,4).
#show grid/3.