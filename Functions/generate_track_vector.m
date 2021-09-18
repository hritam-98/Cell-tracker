function track_vector = generate_track_vector(frame_cost)

% Find the minimum of all the rows of the cost matrix and stock the indexes (the number of the corresponding 
% target cells) into the frame_track_vector.
% The min_cost_vector is a vector that has the minimum cost value between each source cell and its corresponding
% target cell that might be tracked to.
[min_vals, track_vector] = min(frame_cost, [], 2);
% Start looping through all the line or source cells of the frame_track_vector to check for any duplicate
% mapping.
for i = 1:numel(track_vector)
    if isnan(min_vals(i))
        track_vector(i) = NaN;
    end
end



