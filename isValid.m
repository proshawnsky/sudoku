function valid = isValid(board)
% ISVALID Checks whether a given 9x9 Sudoku board is valid.
%
% INPUT:
%   board - A 9x9 matrix representing a Sudoku board.
%
% OUTPUT:
%   valid - A boolean (1 or 0) indicating if the board is valid.
%
% The function verifies:
%   - No duplicate numbers (1-9) appear in any row.
%   - No duplicate numbers (1-9) appear in any column.
%   - No duplicate numbers (1-9) appear in any 3x3 subgrid.

    valid = 1;
    for i = 1:9 % check rows and cols
        [a,b] = find(board == i);
        if length(unique(a)) < length(a) % Check for duplicates in same row
            valid = 0;
            return;
        end
         if length(unique(b)) < length(b) % Check for duplicates in same column
            valid = 0;
            return;
         end
    end
    for i = 1:9 % check sectors
        pat111222333 = round((i+1)/3); % 1 1 1 2 2 2 3 3 3
        pat123123123 = mod(i+2, 3)+1; % 1 2 3 1 2 3 1 2 3
        rows = 3*pat111222333-2 : pat111222333*3;
        cols = 3*pat123123123-2 : pat123123123*3;
        tempBoard = board(rows, cols);
        tempBoard = tempBoard(tempBoard>0);
        if ~isempty(tempBoard) && length(unique(tempBoard)) < length(tempBoard)
            valid = 0;
            return;
        end
    end
end



