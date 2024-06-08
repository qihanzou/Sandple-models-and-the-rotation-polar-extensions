clc;clear;close all;
M=[1 2 3 4 5;6 7 8 9 10; 11 12 13 14 15;16 17 18 19 20;21 22 23 24 25];
M=gpuArray(M);

MM=M(2:4,2:4)


Length_matrix=length(M);
Length_matrix=gpuArray(Length_matrix);
M1=zeros(length(M),length(M)); %create a empty matrix
M1=gpuArray(M1);

[x_coord,y_coord]= find(M>=0);
x_coord = gpuArray(x_coord);
y_coord = gpuArray(y_coord);
   
for k=1:length(x_coord)
    if (x_coord(k) == 1) && (y_coord(k) == 1)
        M1(x_coord(k),y_coord(k)+1) = M(x_coord(k),y_coord(k));
    elseif (x_coord(k) == 1) && (y_coord(k) == Length_matrix)
        M1(x_coord(k)+1,y_coord(k)) = M(x_coord(k),y_coord(k)); 
    elseif (x_coord(k) == Length_matrix) && (y_coord(k) == Length_matrix)
        M1(x_coord(k),y_coord(k)-1) = M(x_coord(k),y_coord(k));
    elseif (x_coord(k) == Length_matrix) && (y_coord(k) == 1)
        M1(x_coord(k)-1,y_coord(k)) = M(x_coord(k),y_coord(k));
    elseif (x_coord(k) == 1) && (y_coord(k) ~= 1) && (y_coord(k) ~= Length_matrix)
        M1(x_coord(k),y_coord(k)+1) = M(x_coord(k),y_coord(k));
    elseif (y_coord(k) == Length_matrix) && (x_coord(k)~=1) && (x_coord(k)~=Length_matrix)
        M1(x_coord(k)+1,y_coord(k)) = M(x_coord(k),y_coord(k)); 
    elseif (x_coord(k) == Length_matrix) && (y_coord(k) ~= Length_matrix) && (y_coord(k) ~= 1)
        M1(x_coord(k),y_coord(k)-1) = M(x_coord(k),y_coord(k));
    elseif (y_coord(k) == 1) && (x_coord(k)~=1) && (x_coord(k)~=Length_matrix)
        M1(x_coord(k)-1,y_coord(k)) = M(x_coord(k),y_coord(k));
    end
end


M1
