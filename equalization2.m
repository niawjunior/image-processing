clc;
clear all;
close all;
org_img=imread('p1.jpg');
pixel_num=size(org_img,1)*size(org_img,2);
figure
subplot(2,2,1)
imshow(org_img)
title('Original Image');
subplot(2,2,3)
imhist(org_img);
hist_img = uint8(zeros(size(org_img,1),size(org_img,2)));
freq=zeros(256,1);
probf=zeros(256,1);
probc=zeros(256,1);
cum=zeros(256,1);
output=zeros(256,1);

for i=1:size(org_img,1)
    for j=1:size(org_img,2)
        value=org_img(i,j);
        freq(value+1)=freq(value+1)+1;
        probf(value+1)=freq(value+1)/pixel_num;
    end
end
sum=0;
no_bins=255;

for i=1:size(probf)
   sum=sum+freq(i);
   cum(i)=sum;
   probc(i)=cum(i)/pixel_num;
   output(i)=round(probc(i)*no_bins);

end

for i=1:size(org_img,1)
    for j=1:size(org_img,2)
            hist_img(i,j)=output(org_img(i,j)+1);
    end
end
subplot(2,2,2)
imshow(hist_img);
title('Histogram equalization');
subplot(2,2,4)
imhist(hist_img);