im1 = imread("images/lena.tif");
im2 = imread("images/lenaNoise.tif");

max_im1 = double(max(im1));
max_im2 = double(max(im2));

dim1 = double(im1);
dim2 = double(im2);

%normalization
norm1 = dim1 ./ max_im1;
norm1 = dim2 ./ max_im2;

B = 1/9 * ones(3,3);

f1 = imfilter(norm1,B);
f2 = imfilter(norm1,B);

fmin = min(min(f1))

subplot(2,2,1)
imshow(im1)

subplot(2,2,2)
imshow(im2)

subplot(2,2,3)
imshow(f1)

subplot(2,2,4)
imshow(f2)
