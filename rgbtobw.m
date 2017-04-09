clc;
clear;
P = imread('p1.jpg');
G = rgb2gray(P);
[r c ] = size(G);
for i = 1:r
    for j = 1:c
        if G(i,j)>128
            BW(i,j)=1;
        else
            BW(i,j)=0;
        end
    end
end
imshow(BW);