%  This is a sub-function of the main function "start_tracking.m".
%
% This function will renumber the cells according to the tracking vector and save it in the renumbering_vector
% 

function [frame_renumbering_vectors_2, highest_cell_number, birth, death] = renumber_tracking(i_frame, frame_track_vectors, ...
    frame_renumbering_vectors_1, number_cells_1, number_cells_2, highest_cell_number, birth, death)


% Initialize the renumber vector for the current frame and the other outputs
frame_renumbering_vectors_2 = zeros(number_cells_2, 1);

% Assign the numbers in the track vector to its corresponding cells
for i = 1:number_cells_1
       
    if isnan(frame_track_vectors(i)) || frame_track_vectors(i) == 0 % The cell i is dead. memorise the death frame in the death vector
        death(frame_renumbering_vectors_1(i)) = i_frame - 1;
    else % Keep track of cell i
        frame_renumbering_vectors_2(frame_track_vectors(i)) = frame_renumbering_vectors_1(i);
    end
end

% Renumber the born cells to the highest cell number
for i = 1:number_cells_2
    
    % if i is not a born cell: contninue
    if frame_renumbering_vectors_2(i) > 0, continue, end
    
    % if cell i is a daughter cell affect it with a new number.
    frame_renumbering_vectors_2(i) = highest_cell_number;
    birth(highest_cell_number) = i_frame;
    highest_cell_number = highest_cell_number + 1;
end




