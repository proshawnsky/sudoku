function elements = getElementsInSector(board, row, col)
% GETELEMENTSINSECTOR Returns the nonzero elements in the 3x3 sector of a given Sudoku board position.
%
% INPUT:
%   board - A 9x9 matrix representing a Sudoku board.
%   row   - The row index (1 to 9) of the target position.
%   col   - The column index (1 to 9) of the target position.
%
% OUTPUT:
%   elements - A vector containing the nonzero numbers present in the corresponding 3x3 subgrid.
%
% The function determines the 3x3 sector based on the row and column indices
% and extracts the nonzero values from that sector.
    if row < 4 && col < 4               % sector 1
         elements = board(1:3, 1:3);
    elseif row < 4 && col < 7           % sector 2
         elements = board(1:3, 4:6);
    elseif row < 4                      % sector 3
        elements = board(1:3, 7:9);
    
    elseif row < 7 && col < 4           % sector 4
         elements = board(4:6, 1:3);
    elseif row < 7 && col < 7           % sector 5
         elements = board(4:6, 4:6);
    elseif row < 7                      % sector 6
        elements = board(4:6, 7:9);
        
    elseif col < 4                      % sector 7
         elements = board(7:9, 1:3);
    elseif col < 7                      % sector 8
         elements = board(7:9, 4:6);
    else                                % sector 9
        elements = board(7:9, 7:9);
    end
    elements = elements(elements > 0);
end