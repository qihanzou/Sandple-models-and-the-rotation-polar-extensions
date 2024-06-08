clc;clear;close all;
M=[1 2 3 4;5 0 0 8; 9 0 0 12;13 14 15 16];
M=gpuArray(M);
Length_matrix=length(M);
Length_matrix=gpuArray(Length_matrix);
M1=[0 0 0;0 0 0;0 0 0];
M1=gpuArray(M1);

[x_coord,y_coord]= find(M>=0);
x_coord = gpuArray(x_coord);
y_coord = gpuArray(y_coord);
[x_coord,y_coord];
   
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
