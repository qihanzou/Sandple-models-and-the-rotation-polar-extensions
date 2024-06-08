clc;clear;close all;
number_sand = 10000; 
N=23;% table length
M=23;% table width
sand_pile = zeros(N,M); 
avalanche_count = 0;
Mean_matrix = zeros(number_sand,1);

avalanche_matrix = zeros(10000,1); % create a empty matrix

for i=1:number_sand 
    pause(0.001)

    sand_pile(1,1:N) = sand_pile(1,1:N) + 3;
    sand_pile(1:N,1) = sand_pile(1:N,1) + 3;
    sand_pile(N,1:N) = sand_pile(N,1:N) + 3;
    sand_pile(1:N,N) = sand_pile(1:N,N) + 3;

    [x_coord_tops,y_coord_tops] = find(sand_pile>3);
    number_top = length(x_coord_tops);
    
    avalanche_matrix(i,1) = number_top;
    
    while number_top > 0
        for j = 1: number_top
            if x_coord_tops(j)==1 || y_coord_tops(j)==1 || x_coord_tops(j)==N || y_coord_tops(j)==M   % or        
            sand_pile(x_coord_tops(j),y_coord_tops(j))=sand_pile(x_coord_tops(j),y_coord_tops(j))-4;
            avalanche_count = avalanche_count + 1;
                if x_coord_tops(j)+1 <= N
            sand_pile(x_coord_tops(j)+1,y_coord_tops(j))=sand_pile(x_coord_tops(j)+1,y_coord_tops(j))+1;
                end
                if x_coord_tops(j)-1 >= 1
            sand_pile(x_coord_tops(j)-1,y_coord_tops(j))=sand_pile(x_coord_tops(j)-1,y_coord_tops(j))+1;
                end
                if y_coord_tops(j)+1 <= M
            sand_pile(x_coord_tops(j),y_coord_tops(j)+1)=sand_pile(x_coord_tops(j),y_coord_tops(j)+1)+1;
                end
                if y_coord_tops(j)-1 >= 1
            sand_pile(x_coord_tops(j),y_coord_tops(j)-1)=sand_pile(x_coord_tops(j),y_coord_tops(j)-1)+1;
                end
                if x_coord_tops(j)+1 >= N/2-1 && x_coord_tops(j)+1 <= N/2+1
                   sand_pile(x_coord_tops(j)+1,y_coord_tops(j))=sand_pile(x_coord_tops(j)+1,y_coord_tops(j))+0;
                end
                if y_coord_tops(j)+1 >= M/2-1 && y_coord_tops(j)+1 <= M/2+1
                   sand_pile(x_coord_tops(j),y_coord_tops(j)+1)=sand_pile(x_coord_tops(j),y_coord_tops(j)+1)+0;
                end
            else
            sand_pile(x_coord_tops(j),y_coord_tops(j))=sand_pile(x_coord_tops(j),y_coord_tops(j))-4;
            sand_pile(x_coord_tops(j)+1,y_coord_tops(j))=sand_pile(x_coord_tops(j)+1,y_coord_tops(j))+1;
            sand_pile(x_coord_tops(j)-1,y_coord_tops(j))=sand_pile(x_coord_tops(j)-1,y_coord_tops(j))+1;
            sand_pile(x_coord_tops(j),y_coord_tops(j)+1)=sand_pile(x_coord_tops(j),y_coord_tops(j)+1)+1;
            sand_pile(x_coord_tops(j),y_coord_tops(j)-1)=sand_pile(x_coord_tops(j),y_coord_tops(j)-1)+1;
            end
            
        end
        [x_coord_tops,y_coord_tops] = find(sand_pile>3);
        number_top = length(x_coord_tops);
        % need to record size here.
         avalanche_matrix(i,1) = avalanche_matrix(i,1) + number_top;
         
    end
Mean_matrix(i,1) = mean(sand_pile,"all");
imagesc(sand_pile)

empty_sandpile=zeros(N,M);
empty_sandpile=gpuArray(empty_sandpile);

for t=1:((((N)+1)/2)-1)
    M2 = sand_pile(t:(N-(t-1)),t:(M-(t-1)));
    M2=gpuArray(M2);
    Length_matrix=length(M2);
    Length_matrix=gpuArray(Length_matrix);

    M1=zeros(length(M2),length(M2)); 
    M1=gpuArray(M1);

    [x_coord,y_coord]= find(M2>=0);
    x_coord = gpuArray(x_coord);
    y_coord = gpuArray(y_coord);   
    for k=1:length(x_coord)
        if (x_coord(k) == 1) && (y_coord(k) == 1)
            M1(x_coord(k),y_coord(k)+1) = M2(x_coord(k),y_coord(k));
        elseif (x_coord(k) == 1) && (y_coord(k) == Length_matrix)
            M1(x_coord(k)+1,y_coord(k)) = M2(x_coord(k),y_coord(k)); 
        elseif (x_coord(k) == Length_matrix) && (y_coord(k) == Length_matrix)
            M1(x_coord(k),y_coord(k)-1) = M2(x_coord(k),y_coord(k));
        elseif (x_coord(k) == Length_matrix) && (y_coord(k) == 1)
            M1(x_coord(k)-1,y_coord(k)) = M2(x_coord(k),y_coord(k));
        elseif (x_coord(k) == 1) && (y_coord(k) ~= 1) && (y_coord(k) ~= Length_matrix)
            M1(x_coord(k),y_coord(k)+1) = M2(x_coord(k),y_coord(k));
        elseif (y_coord(k) == Length_matrix) && (x_coord(k)~=1) && (x_coord(k)~=Length_matrix)
            M1(x_coord(k)+1,y_coord(k)) = M2(x_coord(k),y_coord(k)); 
        elseif (x_coord(k) == Length_matrix) && (y_coord(k) ~= Length_matrix) && (y_coord(k) ~= 1)
            M1(x_coord(k),y_coord(k)-1) = M2(x_coord(k),y_coord(k));
        elseif (y_coord(k) == 1) && (x_coord(k)~=1) && (x_coord(k)~=Length_matrix)
            M1(x_coord(k)-1,y_coord(k)) = M2(x_coord(k),y_coord(k));
        end
    end
empty_sandpile(t:(N-(t-1)),t:(N-(t-1)))=M1;
empty_sandpile((N+1)/2,(N+1)/2)=sand_pile((N+1)/2,(N+1)/2);
end

sand_pile=empty_sandpile;


end

