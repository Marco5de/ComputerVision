im1 = imread("images/obstA.png");
im2 = imread("images/obstB.png");

image(im2);
H=myHistogram(im2);

plot(x,H)

