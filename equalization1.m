clc;
clear;
picture=imread('p1.jpg');
graycolor = rgb2gray(picture);
num=size(picture,1)*size(picture,2);
Histogram=uint8(zeros(size(picture,1),size(picture,2)));

freq=zeros(256,1);
probf=zeros(256,1);
probc=zeros(256,1);
cum=zeros(256,1);
output=zeros(256,1);
for i=1:size(picture,1)
    for j=1:size(picture,2)
        value=picture(i,j);
        freq(value+1)=freq(value+1)+1;
        probf(value+1)=freq(value+1)/num;
    end

end

sum=0;
no_bins=255;
for i=1:size(probf)
   sum=sum+freq(i);
   cum(i)=sum;
   probc(i)=cum(i)/num;
   output(i)=round(probc(i)*no_bins);
end
for i=1:size(picture,1)
    for j=1:size(picture,2)
            Histogram(i,j)=output(picture(i,j)+1);
    end
end

subplot  332,imshow(picture);
title('Original Image');

subplot  334,imshow(graycolor);
title('Gray Image');

subplot  337,imhist(graycolor);
title('Histogram Gray Image');


subplot  336,imshow(Histogram);
title('Gray Image Equalization');

subplot  339,imhist(Histogram);
title('Gray Histogram equalization');
