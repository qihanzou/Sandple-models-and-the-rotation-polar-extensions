clc;clear;close all;
number_sand = 3000;
N=50;
M=50;
sand_pile = zeros(N,M);
critical=3;

for i=1:number_sand 
    pause(0.01)
    x_coord_now = round(1+rand(1,1)*(N-1));
    y_ccord_now = round(1+rand(1,1)*(M-1));
    sand_pile(x_coord_now,y_ccord_now) = sand_pile(x_coord_now,y_ccord_now) + 1;
    
    [x_coord_tops,y_coord_tops] = find(sand_pile>critical);
    number_top = length(x_coord_tops);
    
    while number_top > 0
        for j = 1: number_top
            if x_coord_tops(j)==1 || y_coord_tops(j)==1 || x_coord_tops(j)==N || y_coord_tops(j)==M    
                sand_pile=[0, zeros(1,M), 0; zeros(N,1), sand_pile, zeros(N,1); 0, zeros(1,M), 0]; %#ok<*AGROW>
                N = N + 2;
                M = M + 2;
                
                x_coord_tops=x_coord_tops+1;
                y_coord_tops=y_coord_tops+1; 
            end
            
            sand_pile(x_coord_tops(j),y_coord_tops(j))=sand_pile(x_coord_tops(j),y_coord_tops(j))-4;
            if x_coord_tops(j) == ceil(N/2) && y_coord_tops(j)==ceil(M/2)
                 sand_pile(x_coord_tops(j)+1,y_coord_tops(j))=sand_pile(x_coord_tops(j)+1,y_coord_tops(j))+1;
                 sand_pile(x_coord_tops(j)-1,y_coord_tops(j))=sand_pile(x_coord_tops(j)-1,y_coord_tops(j))+1;
                 sand_pile(x_coord_tops(j),y_coord_tops(j)+1)=sand_pile(x_coord_tops(j),y_coord_tops(j)+1)+1;
                 sand_pile(x_coord_tops(j),y_coord_tops(j)-1)=sand_pile(x_coord_tops(j),y_coord_tops(j)-1)+1;
            end
            if x_coord_tops(j) < ceil(N/2) && y_coord_tops(j)>=ceil(M/2)
                 sand_pile(x_coord_tops(j)-1,y_coord_tops(j))=sand_pile(x_coord_tops(j)+1,y_coord_tops(j))+1;
                 sand_pile(x_coord_tops(j),y_coord_tops(j)+1)=sand_pile(x_coord_tops(j),y_coord_tops(j)+1)+1;
            end
            if x_coord_tops(j) >= ceil(N/2) && y_coord_tops(j)>ceil(M/2)
                sand_pile(x_coord_tops(j)+1,y_coord_tops(j))=sand_pile(x_coord_tops(j)+1,y_coord_tops(j))+1;
                sand_pile(x_coord_tops(j),y_coord_tops(j)+1)=sand_pile(x_coord_tops(j),y_coord_tops(j)-1)+1;
            end
            if x_coord_tops(j) > ceil(N/2) && y_coord_tops(j)<=ceil(M/2)
                sand_pile(x_coord_tops(j)+1,y_coord_tops(j))=sand_pile(x_coord_tops(j)-1,y_coord_tops(j))+1;
                sand_pile(x_coord_tops(j),y_coord_tops(j)-1)=sand_pile(x_coord_tops(j),y_coord_tops(j)-1)+1;
            end
            if x_coord_tops(j) <= ceil(N/2) && y_coord_tops(j)<ceil(M/2)
                sand_pile(x_coord_tops(j)-1,y_coord_tops(j))=sand_pile(x_coord_tops(j)-1,y_coord_tops(j))+1;
                sand_pile(x_coord_tops(j),y_coord_tops(j)-1)=sand_pile(x_coord_tops(j),y_coord_tops(j)+1)+1;
            end
            
            
            %sand_pile(x_coord_tops(j)+1,y_coord_tops(j))=sand_pile(x_coord_tops(j)+1,y_coord_tops(j))+1;
            %sand_pile(x_coord_tops(j)-1,y_coord_tops(j))=sand_pile(x_coord_tops(j)-1,y_coord_tops(j))+1;
            %sand_pile(x_coord_tops(j),y_coord_tops(j)+1)=sand_pile(x_coord_tops(j),y_coord_tops(j)+1)+1;
            %sand_pile(x_coord_tops(j),y_coord_tops(j)-1)=sand_pile(x_coord_tops(j),y_coord_tops(j)-1)+1;
        
        end
        [x_coord_tops,y_coord_tops] = find(sand_pile>3);
        number_top = length(x_coord_tops);
    end
    imagesc(sand_pile)
end

