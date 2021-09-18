function [segmented_image, nb_cell] = relabel_image(segmented_image)

% Create a renumber_cells vector that contains the renumbering of the cells in the labeled mask
nb_cell = max(segmented_image(:));
renumber_cells = zeros(nb_cell, 1);
[m, n] = size(segmented_image);

% Get unique cell ID
u = unique(segmented_image(:));
if u(1) == 0, u(1) = []; end % delete background pixel

for i = 1:length(u), renumber_cells(u(i)) = i; end
renumber_cells = [0;renumber_cells]; % Account for background

% Renumber image
segmented_image = renumber_cells(segmented_image+1);
segmented_image = reshape(segmented_image, m, n);

% Nb of cells
nb_cell = length(u);


