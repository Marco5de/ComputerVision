function H = myHistogram(im)
%MYHISTOGRAM
% im: 2D-matrix representing image values in [0, 255]
% H:size(H) = [1, 256] (each entry representing normed
%frequency of corresponding gray value in "im")

%Todo assertion for vector!
assert(max(max(im))<=255 & min(min(im))>=0,"Input not inside the defined intensity range")

vec = zeros(1,256);
%sizevector of input image
svec = size(im);
%total count of pixels used for normalization
total_pixels = svec(1) * svec(2);

for k=1:svec(1)
    for l=1:svec(2)
        vec(im(k,l)+1) = vec(im(k,l)+1)+1;
    end
end

%normalize output vector
H = 1/total_pixels.* vec;
