function print_update(status, i, nb)

% prints a number/number to screen
% status = 1, it simply prints <i>/<nb> to screen
% status = 2, it removes a previous <i>/<nb> written to the screen and writes a new one in its place
% status = 3, it removes the last written <i>/<nb> leaving the cursor at the begining of the line

zero_pad = length(num2str(nb));
switch status
    case 1
        eval_str = ['%' num2str(zero_pad) 'i/%' num2str(zero_pad) 'i\n'];
        fprintf(eval_str,i,nb);
    case 2
        eval_str = ['%' num2str(zero_pad) 'i/%' num2str(zero_pad) 'i\n'];
        del_str = [];
        for ii = 1:(2*zero_pad + 2)
            del_str = horzcat(del_str, '\b');
        end
        fprintf([del_str eval_str],i,nb);
    case 3
        del_str = [];
        for ii = 1:(2*zero_pad + 2)
            del_str = horzcat(del_str, '\b');
        end
        fprintf(del_str);
end
end