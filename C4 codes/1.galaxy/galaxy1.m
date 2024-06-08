clc;clear;close all;
N0=0;
th0 = 0;
n0=length(th0);
r0 = 0*ones(n0);

N1 = 1;
th1 = 2*pi/(N1*6):2*pi/(N1*6):2*pi;
n1=length(th1);
r1 = ones(n1,1)';

N2 = 2;
th2 = 2*pi/(N2*6):2*pi/(N2*6):2*pi;
n2=length(th2);
r2 = 2*ones(n2,1)';

N3=3;
th3 = 2*pi/(N3*6):2*pi/(N3*6):2*pi;
n3=length(th3);
r3 = 3*ones(n3,1)';

N4=4;
th4 = 2*pi/(N4*6):2*pi/(N4*6):2*pi;
n4=length(th4);
r4 = 4*ones(n4,1)';

n = n0+n1+n2+n3+n4;
height = zeros(n,1)';
sand_pile = [th0 th1 th2 th3 th4; r0 r1 r2 r3 r4; height ];
number_sand = 20;

for i=1:number_sand
    pause(0.5);
    % inclued rotation here.
    th0=circshift(th0,[0,0]); % index move 1.
    th1=circshift(th1,[0,4]);
    th2=circshift(th2,[0,3]);
    th3=circshift(th3,[0,2]);
    th4=circshift(th4,[0,1]);
    
    %position now.
    sand_pile(1,:)=[th0 th1 th2 th3 th4];
    sand_pile(2,:)=[r0 r1 r2 r3 r4];
    
    index_now = randi([1 n],1,1);
    theta_now = sand_pile(1,index_now);
    radius_now = sand_pile(2,index_now);
    sand_pile(3,index_now) = sand_pile(3,index_now) + 1;
    height_now = sand_pile(3,:);
    
    [position_tops] = find( height_now >3);
    number_top = length(position_tops);
    
    while number_top > 0
        for j = 1: number_top
            height(1,position_tops)=height(1,position_tops)-4;
            theta_top_now = sand_pile(1,position_tops);
            radius_top_now = sand_pile(2,position_tops);
            for i=1:n
                d = zeros(n,1)';
    
                while (sand_pile(2,i)~=radius_top_now) && (sand_pile(1,i)~=theta_top_now)
        
                d(1,i) = sqrt(sand_pile(2,i)^2+radius_top_now^2-2*sand_pile(2,i)*radius_top_now*cos(sand_pile(1,i)-theta_top_now));
                   if d(1,i) <= 1.5
                       sand_pile(3,i) = sand_pile(3,i) + 1;
                   end  
                   
                end
            end
        end
        height_now = sand_pile(3,:);
        [position_tops] = find( height_now >3);
        number_top = length(position_tops);
    end
    [exist_position]=find(sand_pile(3,:)>0);
    [exist_position_1]=find(sand_pile(3,:)==1);
    [exist_position_2]=find(sand_pile(3,:)==2);
    [exist_position_3]=find(sand_pile(3,:)==3);
s = [100*sand_pile(3,exist_position_1) 200*sand_pile(3,exist_position_2) 300*sand_pile(3,exist_position_3)];
polarscatter(sand_pile(1,exist_position),sand_pile(2,exist_position),s,'filled')
end

