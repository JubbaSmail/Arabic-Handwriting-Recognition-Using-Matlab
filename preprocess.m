function Ibox = preprocess(I)

Igray = rgb2gray(I);
Ibw = im2bw(Igray,graythresh(Igray));
Iedge = edge(uint8(Ibw));
%--------------------------------
se = strel('Line',45,0);
se1 = strel('Line',20,90);
Iedge2 = imdilate(Iedge, se); 
Iedge3 = imdilate(Iedge2, se1);
%--------------------------------
% se = strel('square',10);
% Iedge3 = imdilate(Iedge, se);
%--------------------------------
Ifill = imfill(Iedge3,'holes');
[Ilabel num] = bwlabel(Ifill);
Iprops = regionprops(Ilabel);
Ibox = [Iprops.BoundingBox];
[y,x]=size(Ibox);
x=x/4;
Ibox = reshape(Ibox,[4 x]);
