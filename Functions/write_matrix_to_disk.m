function write_matrix_to_disk(save_path, matrix_to_save)
% open/overwrite a new file for writing, fopen with the 'w' option creates a new file or overwrites an existing file
output_fileID = fopen(save_path,'w');

% determine how many images are in the current stitching
[r, c] = size(matrix_to_save);
zero_pad = num2str(length(num2str(max(matrix_to_save(:)))));

if r > 0 && c > 0
    % loop over the images in the mosaic column wise
    for i = 1:r
        for j = 1:(c-1)
            % print to file <image name>
            fprintf(output_fileID, ['%' zero_pad 'd, '], matrix_to_save(i,j));
        end
        % print the last image name in the file appending a UNIX newline
        fprintf(output_fileID, ['%' zero_pad 'd\n'], matrix_to_save(i,c));
    end
end
% close the file
fclose(output_fileID);

end