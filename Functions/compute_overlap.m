%  This is a sub-function of the main function "start_tracking.m".
% 
% This function returns the overlap matrix between two frames frame_1 and frame_2. The number of rows
% of the overlap matrix is equal to the number of source cells in the old frame (frame_1), and the number of
% columns is the number of target cells in the new frame (frame_2). The element "overlap(i,j)" will contain the
% number of pixels that are commun to source cell "i" and target cell "j"
% 

function frame_overlap = compute_overlap(frame_1, frame_2, number_cells_1, number_cells_2)

% Initialize the frame_overlap matrix.
frame_overlap = zeros(number_cells_1, number_cells_2);

% Get the index of nonzero elements in first frame
[I1, J1] = find(frame_1 > 0);
nr = size(I1,1);
[r2, c2] = size(frame_2);

% Find index of pixels that are nonzero in both frames
for i = 1:nr
    % In case the two frames had different sizes, make sure we are in bound in the second frame
    if I1(i) <= r2 && J1(i) <= c2 && frame_2(I1(i),J1(i))
        frame_overlap(frame_1(I1(i),J1(i)), frame_2(I1(i),J1(i))) = frame_overlap(frame_1(I1(i),J1(i)), frame_2(I1(i),J1(i))) + 1;
    end
end



