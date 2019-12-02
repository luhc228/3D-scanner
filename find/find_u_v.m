% find the param u and v
% input_img_num {num} 输入图片的数量
% input_file_name {string} 输入要处理的图片名
% output_file_name {string} 输出的图片名 

function [s]  = find_u_v( input_img_num, input_file_name, output_file_name )

for i = 1:input_img_num
    data = imread(strcat(input_file_name, num2str(i), '.bmp'));

    [row, col] = find(data);
    fid=fopen(strcat(output_file_name, num2str(i), '.txt'), 'wt');
    row_length = length(row(:));
    col_length = length(col(:));
    if row_length ~= col_length
        fprintf('Error: the length of the row is not equal to the length of the col');
        fprintf('\n');
        continue
    end
    
    for m=1 : row_length
        fprintf(fid, '%d %d\n', row(m), col(m));
        
    end
    
end
