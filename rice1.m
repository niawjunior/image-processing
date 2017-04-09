clc;
clear;
img1=imread('rice.png');
background = imopen(img1,strel('disk',15));
I2 = img1 - background;
img2=im2bw(I2,graythresh(I2));
x=[1 1 1]*1/3;
s=convn(img2,x,'same');
I = imadjust(s,[0.3 0.7],[]);
B = bwboundaries(I);
RGB_label = label2rgb(img2,[.0 .0 .0], 'black', 'shuffle');
imshow(RGB_label)
hold on
for k = 1:length(B)
boundary = B{k};
 plot(boundary(:,2), boundary(:,1),'white', 'LineWidth', 0.2)
end
text(10,10,strcat('\color{white}Objects Found:',num2str(length(B))));
k