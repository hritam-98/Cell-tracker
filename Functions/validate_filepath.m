function [cur_path] = validate_filepath(cur_path)
if nargin ~= 1, return, end
if ~isa(cur_path, 'char')
    error('validate_filepath:argChk','invalid input type');
end
if isempty(cur_path)
    return;
end

% first attempt is to see if this is a file
[status,message] = fileattrib(cur_path);
if status == 0
    error('validate_filepath:notFoundInPath',...
            'No such file or directory: \"%s\"',cur_path);
else
    cur_path = message.Name;
    if message.directory == 0
        % the path represents a file
        % do nothing
    else
        % the path represents a directory
        if cur_path(end) ~= filesep
            cur_path = [cur_path filesep];
        end
    end
end

end




