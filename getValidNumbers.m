function nums = getValidNumbers(board, idx)
% GETVALIDNUMBERS Returns the valid numbers that can be placed at a given index in a Sudoku board.
%
% INPUT:
%   board - A 9x9 matrix representing a Sudoku board.
%   idx   - A linear index (1 to 81) indicating the position in the board.
%
% OUTPUT:
%   nums  - A vector containing the valid numbers (1-9) that can be placed at the given position.
%
% The function determines validity by ensuring that a number:
%   - Does not already exist in the same row.
%   - Does not already exist in the same column.
%   - Does not already exist in the corresponding 3x3 subgrid.
%
% The function calls GETELEMENTSINSECTOR to retrieve elements from the 3x3 subgrid.

    [row, col] = ind2sub([9 9],idx);
    validAlongRow = setdiff(1:9,board(row,:));
    validAlongCol = setdiff(1:9,board(:,col));
    validInSector = setdiff(1:9,getElementsInSector(board, row, col));
    nums = find(hist([1:9, validAlongRow, validAlongCol, validInSector],9) > 3);
end