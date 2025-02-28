function possibleNums = getPossibleNums(board)
% GETPOSSIBLENUMS Returns a matrix indicating the number of valid choices for each empty cell in a Sudoku board.
%
% INPUT:
%   board - A 9x9 matrix representing a Sudoku board, where 0 indicates an empty cell.
%
% OUTPUT:
%   possibleNums - A 9x9 matrix where:
%       - Cells containing -1 correspond to filled positions in the original board.
%       - Cells with a positive integer indicate the number of valid numbers for that position.
%       - Cells with 0 indicate no valid numbers (invalid board state).
%
% The function iterates through each cell:
%   - If the cell is empty (0), it retrieves possible valid numbers using GETVALIDNUMBERS.
%   - If valid numbers exist, it stores their count in the corresponding position.
%   - Otherwise, it marks the cell as 0 (indicating an invalid board state).
    possibleNums = -ones(9,9);
    for i = 1:81
        if board(i) == 0
            nums = getValidNumbers(board, i);
            if ~isempty(nums)
                possibleNums(i) = length(nums);
            else
                possibleNums(i) = 0;
            end
            
        end
    end
end