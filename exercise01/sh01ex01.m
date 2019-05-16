im1 = imread("images/obstA.png");
im2 = imread("images/obstB.png");


H1=myHistogram(im1);
image(im2);
H2=myHistogram(im2);

x=1:256;

clear title xlabel ylabel
subplot(2,2,1),imshow(im1),title("Im1")
subplot(2,2,2),plot(x,H1),title("Histogram Im1")
xlabel("Intensity"),ylabel("Probability")


subplot(2,2,3),imshow(im2),title("Im2")
subplot(2,2,4),plot(x,H2),title("Histogram Im2")
xlabel("Intensity"),ylabel("Probability")



