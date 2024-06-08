clc;clear;close all;
number_sand = 10000; 
N=300;% table length
M=300;% table width
sand_pile = zeros(N,M);

p_st=0.28;
time=11;


for i=1:number_sand
    pause(0.1)

    x_coord_now = round(1+rand(1,1)*(N-1));
    y_coord_now = round(1+rand(1,1)*(M-1));
    
    sand_pile(x_coord_now,y_coord_now) = sand_pile(x_coord_now,y_coord_now) + 1;

    [x_coord_tops,y_coord_tops] = find(sand_pile == 1);
    number_top = length(x_coord_tops);
    
    
    while number_top > 0
        for j = 1: number_top
            if x_coord_tops(j)==1 || y_coord_tops(j)==1 || x_coord_tops(j)==N || y_coord_tops(j)==M   % or        
            sand_pile(x_coord_tops(j),y_coord_tops(j))=sand_pile(x_coord_tops(j),y_coord_tops(j))-1;
            
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
                active_or_not1 = rand;
                if active_or_not1 <= p_st 
                   sand_pile(x_coord_tops(j)+1,y_coord_tops(j))=sand_pile(x_coord_tops(j)+1,y_coord_tops(j))+1;
               
                end
                active_or_not2 = rand;
                if active_or_not2 <= p_st 
                   sand_pile(x_coord_tops(j)-1,y_coord_tops(j))=sand_pile(x_coord_tops(j)-1,y_coord_tops(j))+1;
                  
                end
                active_or_not3 = rand;
                if active_or_not3 <= p_st 
                   sand_pile(x_coord_tops(j),y_coord_tops(j)+1)=sand_pile(x_coord_tops(j),y_coord_tops(j)+1)+1;
                   
                end
                active_or_not4 = rand;
                if active_or_not4 <= p_st 
                   sand_pile(x_coord_tops(j),y_coord_tops(j)-1)=sand_pile(x_coord_tops(j),y_coord_tops(j)-1)+1;
                   
                end
                
            end
        end
         [x_coord_tops,y_coord_tops] = find(sand_pile >= 3);
          number_top = length(x_coord_tops);
    end
    

        image(sand_pile)
        
end





