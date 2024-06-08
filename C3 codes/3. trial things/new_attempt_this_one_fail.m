clc;clear; close all;
number_sand = 1000;
N=21;
M=21;
sand_pile = zeros(N,M);
M_x=11;
M_y=11;
add=1;
dec = -4;
T = ones((N-1)/2,(M-1)/2);
T_ll=dec*tril(T);
T_lr=rot90(T_ll);
T_ur=rot90(T_lr);
T_ul=rot90(T_ur);
L1=zeros((N-1)/2,1);
L2=zeros(1,N);
cancel_matrix = [T_ul L1 T_ur;L2;T_ll L1 T_lr];

for i=1:number_sand 
    sand_pile(M_x,M_y) = sand_pile(M_x,M_y) +1;
    [x_coord_tops,y_coord_tops] = find(sand_pile>3);
    number_top = length(x_coord_tops);
     
    while number_top > 0
        for j = 1: number_top
            if x_coord_tops(j)==1 || y_coord_tops(j)==1 || x_coord_tops(j)==N || y_coord_tops(j)==M           
            sand_pile(x_coord_tops(j),y_coord_tops(j))=sand_pile(x_coord_tops(j),y_coord_tops(j))-4;
            
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
        
    end

    sand_pile=sand_pile+cancel_matrix;

    [x_coord_all,y_coord_all] = find(sand_pile>=0);
    number_all = length(x_coord_all);

while number_all > 0
        for k = 2: number_all
              if x_coord_all(k) < ceil((N-1)/2) && y_coord_all(k)>=ceil((M-1)/2)
                 sand_pile(x_coord_all(k)+1,y_coord_all(k)+1)=sand_pile(x_coord_all(k),y_coord_all(k));
              end
              if x_coord_all(k) >= ceil((N-1)/2) && y_coord_all(k)>ceil((M-1)/2)
                 sand_pile(x_coord_all(k)+1,y_coord_all(k)-1)=sand_pile(x_coord_all(k),y_coord_all(k));
              end
              if x_coord_all(k) > ceil((N-1)/2) && y_coord_all(k)<=ceil((M-1)/2)
                 sand_pile(x_coord_all(k)-1,y_coord_all(k)-1)=sand_pile(x_coord_all(k),y_coord_all(k));
              end
              if x_coord_all(k) <= ceil((N-1)/2) && y_coord_all(k)<ceil((M-1)/2)
                 sand_pile(x_coord_all(k)-1,y_coord_all(k)+1)=sand_pile(x_coord_all(k),y_coord_all(k));
              end
        end
end

image(sand_pile)
colorbar
end



