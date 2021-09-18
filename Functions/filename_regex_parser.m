function filtered_cellarray_filenames = filename_regex_parser(input_regex_str, cellarray_filenames)

% remove whitespace from input string containing the fake regex
input_regex_str(input_regex_str == ' ') = '';
% add an '&' to the front of the input string
input_regex_str= ['&' input_regex_str];

% find any '&' symbol followed by one or more alpha numeric underscore characters
[~,~,~,and_cell_str,~,~,~] = regexp(input_regex_str, '&\w+');
% remove the symbol from the tokenized strings
for i = 1:numel(and_cell_str)
    and_cell_str{i}(1) = [];
end

% find any '!' or '~' symbol followed by one or more alpha numeric underscore characters
[~,~,~,not_cell_str,~,~,~] = regexp(input_regex_str, '[~!]\w+');
% remove the symbol from the tokenized strings
for i = 1:numel(not_cell_str)
    not_cell_str{i}(1) = [];
end

% find the filenames that have all of the tokens in and_cell_str
and_indx_vector = true(size(cellarray_filenames));
for i = 1: numel(and_cell_str)
    and_indx_vector = and_indx_vector & ~cellfun(@isempty, strfind(cellarray_filenames, and_cell_str{i}));
end

% find the filenames that have one or more of the tokens in not_cell_str
not_indx_vector = false(size(cellarray_filenames));
for i = 1: numel(not_cell_str)
    not_indx_vector = not_indx_vector | ~cellfun(@isempty, strfind(cellarray_filenames, not_cell_str{i}));
end

% find the filenames that have all of the tokens in and_cell_str and none of the tokens in not_indx_vector
filtered_cellarray_filenames = cellarray_filenames(and_indx_vector & ~not_indx_vector);

end