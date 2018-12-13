cd 'C:\Users\Haowei Li\Desktop\eye\sample_small\';
images = dir('*.jpg');
num = length(images)
for i = 1:num
    I1 = imread(images(i).name);
    I2 = imresize(I1,[100,400],'lanczos3');
    In = rgb2gray(I2);
    imwrite(I2,  [num2str(i), '.jpg']);
end

cd 'C:\Users\Haowei Li\Desktop\';