function rotation_function(sand_pile)
empty_sandpile=zeros(N,M);
empty_sandpile=gpuArray(empty_sandpile);

for t=1:(((N)+1)/2)+1
    M = sand_pile(t:(N-(t-1)),t:(N-(t-1)));
    M=gpuArray(M);
    Length_matrix=length(M);
    Length_matrix=gpuArray(Length_matrix);
    M1=zeros(length(M),length(M)); 
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
empty_sandpile(t:(N-(t-1)),t:(N-(t-1)))=M1;
end

sand_pile=empty_sandpile;
sand_pile=gpuArray(sand_pile);
