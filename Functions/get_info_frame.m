% [centroids, cells_size] = get_info_frame(frame, nb_cells)
%  This is a sub-function of the main function "start_tracking.m".
% 
% This function extract the information from a given frame. The information contain the size of each cell and the
% centroid coordinates of each cell.
% 

function [centroids, cells_size] = get_info_frame(frame, nb_cells)

if nargin == 1
    nb_cells = max(frame(:));
end

% Initiate the vector "cells_size" containing the size of each cell. The size of each cell is the number of 
% pixels of this cell in the current frame.
cells_size = zeros(nb_cells, 1);

%  Initiate the matrix "centroids" containing the X and Y coordinates of the centroids of each cell
%  in the current frame.
centroids = zeros(nb_cells, 2);

% find the nonzero pixels in the image
[nonzero_pixels(:,1), nonzero_pixels(:,2)] = find(frame);

for counter = 1:size(nonzero_pixels,1)
    i = nonzero_pixels(counter,1);
    j = nonzero_pixels(counter,2);
    % Increment the size of the pixel
    cells_size(frame(i,j)) = cells_size(frame(i,j)) + 1;
    
    % Add the coordiante of the pixel to the sum of the centroids coordinates
    centroids(frame(i,j), 1) = centroids(frame(i,j), 1) + j;
    centroids(frame(i,j), 2) = centroids(frame(i,j), 2) + i;
end
% Compute the centroids
% centroids = round(centroids ./ (cells_size * [1 1]));
centroids = centroids ./ (cells_size * [1 1]);

