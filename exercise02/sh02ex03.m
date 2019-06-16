%CV1 sh02ex02 by Marco Deuscher 977776 and Carolin Schindler 978616
im1 = imread("images/flower01.png");
im2 = imread("images/flower02.png");

%same for im2
sigma = size(im1,1);


%normalize imag. values to [0,1]
im1 = double(im1);
im1_norm = im1 / max(im1(:));
im2 = double(im2);
im2_norm = im2 / max(im2(:));

%plot the normalized input images
subplot 231;imshow(im1_norm,[]); title("Flower in focus");
subplot 232;imshow(im2_norm,[]); title("Flower out of focus");

ft_im1 = abs(fftshift(fft2(im1_norm)));
ft_im2 = abs(fftshift(fft2(im2_norm)));


gauss = fspecial("gaussian",sigma,sigma);
%Pad gauss so the arrays have the same size
%replicate repeating border elements, in this case zeros as desired
gauss = padarray(gauss,((size(ft_im1)-size(gauss))/2),"replicate");
gauss = gauss / max(gauss(:));
filter = ones(size(gauss))-gauss;

filtered_im1 = ft_im1 .* filter;
filtered_im2 = ft_im2 .* filter;

sum1 = 0;
sum2 = 0;

for i=1:size(im1,1)
    for j=1:size(im1,2)
        sum1 = sum1 + (filtered_im1(i,j))^2;
        sum2 = sum2 + (filtered_im2(i,j))^2;
    end
end
fprintf("Energy im1: %f\n",sum1);
fprintf("Energy im2: %f\n",sum2);

subplot 234;imshow(filter,[]);title("Highpass filter");
subplot 235;imshow(filtered_im1,[]);title("Energy(Im_1) = "+ round(sum1,2));
subplot 236;imshow(filtered_im1,[]);title("Energy(Im_2) = "+ round(sum2,2));

