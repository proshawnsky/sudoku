clc; clear;

% MAIN SCRIPT FOR SOLVING A SUDOKU PUZZLE
%
% This script initializes a Sudoku board, verifies its validity, and attempts to solve it.
% The user can either use the predefined board or input a custom board manually.
%
% PROCESS:
%   1. The script defines a 9x9 matrix representing the Sudoku board, where 0 indicates an empty cell.
%   2. The user can optionally enter a board manually (commented-out input section).
%   3. The script checks whether the board is valid using ISVALID.
%   4. If valid, it attempts to solve the board using SOLVEBOARD2.
%   5. The time taken to solve the board is displayed.
%
% FUNCTIONS:
%   - ISVALID: Checks if the given board follows Sudoku rules.
%   - GETPOSSIBLENUMS: Determines possible numbers for each empty cell.
%   - GETVALIDNUMBERS: Finds valid numbers for a specific empty cell.
%   - SOLVEBOARD2: Implements a backtracking algorithm to solve the board.
%
% OUTPUT:
%   - If the board is solvable, it prints the time taken.
%   - If the board is invalid, it throws an error.
%
% NOTE:
%   - The user can uncomment the input section to manually enter a Sudoku board.
%   - The board-solving function uses a recursive backtracking approach.

%% Example Board
board = [
  0, 0, 0, 0, 0, 0, 2, 0, 0;
  0, 8, 0, 0, 0, 7, 0, 9, 0;
  6, 0, 2, 0, 0, 0, 5, 0, 0;
  0, 7, 0, 0, 6, 0, 0, 0, 0;
  0, 0, 0, 9, 0, 1, 0, 0, 0;
  0, 0, 0, 0, 2, 0, 0, 4, 0;
  0, 0, 5, 0, 0, 0, 6, 0, 3;
  0, 9, 0, 4, 0, 0, 0, 7, 0;
  0, 0, 6, 0, 0, 0, 0, 0, 0
  ];
%% Or, Manual Entry
% board = zeros(9,9);
fprintf('User input conventions: enter each row with no spaces, with unsolved squares as "0", then press ENTER.\n');
% for i = 1:9
%     userResponse = input(sprintf('Enter the values of row %d: ',i),'s');
%     userResponse = replace(userResponse,'',' ');
%     b = sscanf(userResponse, '%f')';
%     if length(b) ~= 9
%         error('Input for row %d does not have 9 entries', i);
%         return;
%     else
%         board(i,:) = b;
%     end
% end
%
%% Crunch Time
board
if isValid(board)
    tic
    solveBoard2(board);
    t = toc;
    fprintf('Sudoku board solved in %.3f seconds (yay) \n ', t);
else
    error('Input Sudoku board is invalid');
end

%% Functions

function [solved] = solveBoard2(board)
    possibleNums = getPossibleNums(board);
    
    if all(all(possibleNums == -1))
        solved = true;
        return;
    end
    if max(possibleNums,[],'all') == 0
        solved = false;
        return;
    end
    [row, col] = find(possibleNums == min(possibleNums(possibleNums>0)),1);
    nums = getValidNumbers(board, sub2ind([9 9], row, col));
    
    for i = 1:length(nums)
        board(row, col) = nums(i);
        if solveBoard2(board)
            solved = true;
            return;
        else
            board(row, col) = 0;
            solved = false;
        end
    end
end
