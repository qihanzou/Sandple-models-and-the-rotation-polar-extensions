clc;clear;close all;
number_sand = 2000; 
number_sand=gpuArray(number_sand);
N=21;% table length
M=21;% table width

sand_pile = gpuArray(zeros(N,M));
add=2;


for i=1:number_sand 
    pause(0.001)
    %sand_pile(ceil(N/2),ceil(M/2)) = sand_pile(ceil(N/2),ceil(M/2)) + add;

    x_coord_now = gpuArray(round(1+rand(1,1)*(N-1)));
    y_ccord_now = gpuArray(round(1+rand(1,1)*(M-1)));
    sand_pile(x_coord_now,y_ccord_now) = sand_pile(x_coord_now,y_ccord_now) + add;
   
    [x_coord_tops,y_coord_tops] = find(sand_pile>3);
    x_coord_tops=gpuArray(x_coord_tops);
    y_coord_tops=gpuArray(y_coord_tops);
    number_top = length(x_coord_tops);
    number_top = gpuArray(number_top);
    while number_top > 0
        for j = 1: number_top
            if x_coord_tops(j)==1 || y_coord_tops(j)==1 || x_coord_tops(j)==N || y_coord_tops(j)==M   % or        
            sand_pile(x_coord_tops(j),y_coord_tops(j))=sand_pile(x_coord_tops(j),y_coord_tops(j))-4;
                if x_coord_tops(j)+1 <= N
            sand_pile(x_coord_tops(j)+1,y_coord_tops(j))=sand_pile(x_coord_tops(j)+1,y_coord_tops(j))+0;
                end
                if x_coord_tops(j)-1 >= 1
            sand_pile(x_coord_tops(j)-1,y_coord_tops(j))=sand_pile(x_coord_tops(j)-1,y_coord_tops(j))+0;
                end
                if y_coord_tops(j)+1 <= M
            sand_pile(x_coord_tops(j),y_coord_tops(j)+1)=sand_pile(x_coord_tops(j),y_coord_tops(j)+1)+0;
                end
                if y_coord_tops(j)-1 >= 1
            sand_pile(x_coord_tops(j),y_coord_tops(j)-1)=sand_pile(x_coord_tops(j),y_coord_tops(j)-1)+0;
                end
            else
               sand_pile(x_coord_tops(j),y_coord_tops(j))=sand_pile(x_coord_tops(j),y_coord_tops(j))-4;
                if x_coord_tops(j) == ceil(N/2) && y_coord_tops(j)==ceil(M/2)
                 sand_pile(x_coord_tops(j)+1,y_coord_tops(j))=sand_pile(x_coord_tops(j)+1,y_coord_tops(j))+add;
                 sand_pile(x_coord_tops(j)-1,y_coord_tops(j))=sand_pile(x_coord_tops(j)-1,y_coord_tops(j))+add;
                 sand_pile(x_coord_tops(j),y_coord_tops(j)+1)=sand_pile(x_coord_tops(j),y_coord_tops(j)+1)+add;
                 sand_pile(x_coord_tops(j),y_coord_tops(j)-1)=sand_pile(x_coord_tops(j),y_coord_tops(j)-1)+add;
                end
                if x_coord_tops(j) < ceil(N/2) && y_coord_tops(j)>=ceil(M/2)
                 sand_pile(x_coord_tops(j)-1,y_coord_tops(j))=sand_pile(x_coord_tops(j)-1,y_coord_tops(j))+add;
                 sand_pile(x_coord_tops(j),y_coord_tops(j)+1)=sand_pile(x_coord_tops(j),y_coord_tops(j)+1)+add;
                end
                if x_coord_tops(j) >= ceil(N/2) && y_coord_tops(j)>ceil(M/2)
                sand_pile(x_coord_tops(j)+1,y_coord_tops(j))=sand_pile(x_coord_tops(j)+1,y_coord_tops(j))+add;
                sand_pile(x_coord_tops(j),y_coord_tops(j)+1)=sand_pile(x_coord_tops(j),y_coord_tops(j)+1)+add;
                end
                if x_coord_tops(j) > ceil(N/2) && y_coord_tops(j)<=ceil(M/2)
                sand_pile(x_coord_tops(j)+1,y_coord_tops(j))=sand_pile(x_coord_tops(j)+1,y_coord_tops(j))+add;
                sand_pile(x_coord_tops(j),y_coord_tops(j)-1)=sand_pile(x_coord_tops(j),y_coord_tops(j)-1)+add;
                end
                if x_coord_tops(j) <= ceil(N/2) && y_coord_tops(j)<ceil(M/2)
                sand_pile(x_coord_tops(j)-1,y_coord_tops(j))=sand_pile(x_coord_tops(j)-1,y_coord_tops(j))+add;
                sand_pile(x_coord_tops(j),y_coord_tops(j)-1)=sand_pile(x_coord_tops(j),y_coord_tops(j)-1)+add;
                end
            end
        end
        [x_coord_tops,y_coord_tops] = find(sand_pile>3);
        number_top = length(x_coord_tops);

        x_coord_tops=gpuArray(x_coord_tops);
        y_coord_tops=gpuArray(y_coord_tops);
        number_top = gpuArray(number_top);
    
    end
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
