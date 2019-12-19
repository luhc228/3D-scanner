function [mask1] =  make_mask_new(y_max,img_num,output_file_name)
%实现输入mask的坐标范围（0, 1280, 0, y_max），能够生成mask矩阵。
%mask矩阵大小与图像大小相同（1280 * 1024）
%mask矩阵在确定的mask区域内的值全为1，区域外的值全为0。
mask = zeros(1024,1280);
for i = 1:y_max
    for j = 1:1280
        mask(i,j)=1;
    end
end
mask1=uint8(mask);

img_set = load('images_set.mat');
for i = 1:img_num
    field_name = strcat('b',num2str(i));
    img_mask = img_set.(strcat('a',num2str(i))) .* mask1;
    img_mask=uint8(img_mask);
    eval([field_name,'=',mat2str(img_mask,'class'),';']);
    if i == 1
        save(output_file_name,field_name);
    else
        save(output_file_name,field_name,'-append');
    end
end
end


