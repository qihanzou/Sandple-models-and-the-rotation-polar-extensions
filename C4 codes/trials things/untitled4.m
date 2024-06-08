clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables.

imageSizeX = 50;
imageSizeY = 50;
[columnsInImage, rowsInImage] = meshgrid(1:imageSizeX, 1:imageSizeY);
% Next create the circle in the image.
centerX = 25;
centerY = 25;
radius = 10;
circlePixels = (rowsInImage - centerY).^2 + (columnsInImage - centerX).^2 <= radius.^2;
% circlePixels is a 2D "logical" array.
imshow(circlePixels) ;
colormap([0 0 0; 1 1 1]);
