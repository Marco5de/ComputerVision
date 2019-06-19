%CV1 sh03ex01 by Marco Deuscher 977776 and Carolin Schindler 978616

im1 = imread("materials_assignment3/bookstore_dark.tif");

subplot 221; imshow(im1,[]); title("Original image");

%create histogram using the function created in sh01
hist = myHistogram(im1);
subplot 222; bar(hist); title("Histogram"); xlabel("Intensity"); ylabel("Percentage");

%generating cumulative histogram
cum_hist = cumsum(hist);

subplot 223; bar(cum_hist);title("Cumulative histogram");xlabel("Intensity");ylabel("Percentage");

%map the value to cum_hist * k, where k is the intensity
dim = size(im1);

new_im = ones(size(im1));

for i=1:dim(1)
    for j=1:dim(2)
        new_im(i,j) = im1(i,j) * cum_hist(im1(i,j));
    end
end

subplot 224; imshow(new_im,[]);title("New image");

new_hist = myHistogram(new_im);
%bar(cumsum(new_hist));
