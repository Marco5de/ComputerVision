%CV1 sh02ex01 by Marco Deuscher 977776 and Carolin Schindler 978616

lena = imread("images/lena.tif");
gauss = fspecial("gaussian",13,3);

lena_gauss = imfilter(lena,gauss,"replicate","conv");
%imshow(lena_filter,[]);
H = [-1 -2 0; -2 0 2; 0 2 1];
lena_filter = imfilter(lena_gauss,H,"replicate","conv");

subplot 221
imshow(lena_filter,[])

%reversing the order in which the filters are applied
reverse_lena_filter = imfilter(lena,H, "replicate","conv");
reverse_lena_gauss = imfilter(lena,gauss,"replicate","conv");
   
subplot 222
imshow(reverse_lena_filter);

diff = lena_filter - reverse_lena_gauss;
sum(diff(:))





