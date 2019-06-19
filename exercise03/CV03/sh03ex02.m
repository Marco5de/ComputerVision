%CV1 sh03ex01 by Marco Deuscher 977776 and Carolin Schindler 978616

ogimg = imread("materials_assignment3/circles.png");
gimg = rgb2gray(ogimg);
gim_norm = double(gimg) / double(max(gimg(:)));

Hx = [1 0 -1; 2 0 -2; 1 0 -1];
Hy = [-1 -2 -1; 0 0 0; 1 2 1];

Ix = imfilter(gim_norm,Hx,"replicate","conv");
Iy = imfilter(gim_norm,Hy,"replicate","conv");

dim = size(gim_norm);
grad_mag = zeros(size(dim));
grad_phase = zeros(size(dim));

for j=1:dim(1)
    for i=1:dim(2)
        grad_mag(j,i) = sqrt(Ix(j,i)^2 + Iy(j,i)^2);
        grad_phase(j,i) = atan(Iy(j,i) / Ix(j,i));
    end
end

subplot 131; imshow(gim_norm,[]);title("Original image");

x_zoom = 280:290;
y_zoom = 280:290;

subplot 132
imshow(grad_mag(x_zoom,y_zoom),[]);title("Image magnitude");

hold on 
quiver(Ix(y_zoom,x_zoom),Iy(y_zoom,x_zoom))
hold off

subplot 133; 
imshow(gradientColored(grad_mag, grad_phase, 0.25),[]);title("image orientation");
