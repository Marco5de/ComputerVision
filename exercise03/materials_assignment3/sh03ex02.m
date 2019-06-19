%CV1 sh03ex01 by Marco Deuscher 977776 and Carolin Schindler 978616
clear
clc

bookstore = imread("materials_assignment3/bookstore.tif");

load("materials_assignment3/Hfreq.mat");
load("materials_assignment3/Hfreq2.mat");
load("materials_assignment3/filtered.mat");

Hfreq_spatial = ifft2(Hfreq);
Hfreq2_spatial = ifft2(Hfreq2);

%increase range and shift away from zero
Hfreq_imshow = log(abs(fftshift(Hfreq))*20 + 1);
Hfreq2_imshow = log(abs(fftshift(Hfreq2))*20 + 1);

%in the freq. domain convolution is applied by multiplying two signals
%hence the inverse operation is division
deconv = ifft2(fft2(filtered) ./ Hfreq);
deconv2 = ifft2(fft2(filtered) ./ Hfreq2);

subplot 421;
imshow(filtered,[]);title("Blurred image");

subplot 422;
imshow(bookstore,[]);title("Original image");

subplot 423;
imshow(Hfreq_imshow,[]);title("Hfreq (frequency domain)");

subplot 424;
imshow(Hfreq2_imshow,[]);title("Hfreq2 (frequency domain)");

subplot 425;
imshow(Hfreq_spatial(1:30,1:50),[]);title("Hfreq (spatial domain)");

subplot 426;
imshow(Hfreq2_spatial(1:30,1:50),[]);title("Hfreq (spatial domain)");

subplot 427;
imshow(deconv,[]);title("Inverse convolution (Hfreq)");

subplot 428;
imshow(deconv2,[]);title("Inverse convolution (Hfreq2)");