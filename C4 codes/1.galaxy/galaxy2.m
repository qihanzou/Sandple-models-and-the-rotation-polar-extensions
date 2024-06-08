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

N5=5;
th5 = 2*pi/(N5*6):2*pi/(N5*6):2*pi;
n5=length(th5);
r5 = 5*ones(n5,1)';

N6=6;
th6 = 2*pi/(N6*6):2*pi/(N6*6):2*pi;
n6=length(th6);
r6 = 6*ones(n6,1)';

N7=7;
th7 = 2*pi/(N7*6):2*pi/(N7*6):2*pi;
n7=length(th7);
r7 = 7*ones(n7,1)';

N8=8;
th8 = 2*pi/(N8*6):2*pi/(N8*6):2*pi;
n8=length(th8);
r8 =8*ones(n8,1)';

N9=9;
th9 = 2*pi/(N9*6):2*pi/(N9*6):2*pi;
n9=length(th9);
r9 =9*ones(n9,1)';

N10=10;
th10 = 2*pi/(N10*6):2*pi/(N10*6):2*pi;
n10=length(th10);
r10 =10*ones(n10,1)';

N11=11;
th11 = 2*pi/(N11*6):2*pi/(N11*6):2*pi;
n11=length(th11);
r11 =11*ones(n11,1)';


n = n0+n1+n2+n3+n4+n5+n6+n7+n8+n9+n10+n11;
height = zeros(1,n);
sand_pile = [th0 th1 th2 th3 th4 th5 th6 th7 th8 th9 th10 th11; r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11; height ];
number_sand = 1000;


for i=1:number_sand
    
    pause(0);
    % inclued rotation here.
    th0=circshift(th0,[0,0]); % index move 1.
    th1=circshift(th1,[0,5]);
    th2=circshift(th2,[0,6]);
    th3=circshift(th3,[0,7]);
    th4=circshift(th4,[0,9]);
    th5=circshift(th5,[0,10]);
    th6=circshift(th6,[0,10]);
    th7=circshift(th7,[0,10]);
    th8=circshift(th8,[0,10]);
    th9=circshift(th9,[0,10]);
    th10=circshift(th10,[0,10]);
    th11=circshift(th11,[0,10]);
    
    %position now.
    sand_pile(1,:)=[th0 th1 th2 th3 th4 th5 th6 th7 th8 th9 th10 th11];
    sand_pile(2,:)=[r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11];
    
    index_now = randi([1 n],1,1);
    theta_now = sand_pile(1,index_now);
    radius_now = sand_pile(2,index_now);
    sand_pile(3,index_now) = sand_pile(3,index_now) + 1;
    height_now = sand_pile(3,:);
    
    [position_tops] = find( height_now >3);
    number_top = length(position_tops);
    
    while number_top > 0
        for j = 1: number_top
            sand_pile(3,position_tops)=sand_pile(3,position_tops)-4;
            theta_top_now  = sand_pile(1,position_tops);
            radius_top_now = sand_pile(2,position_tops);
            g1 = gpuArray(theta_top_now);
            g2 = gpuArray(radius_top_now);
            for k=1:n
                    G1 = gpuArray(sand_pile(1,k));
                    G2 = gpuArray(sand_pile(2,k));
                while (G1~=g1) && (G2~=g2)
                C = cos(G1-g1);
                d_square = G2^2+g2^2-2*G2*g2*C;
                
                %gpud = gpuArray(d);
                   while d_square < 2
                       sand_pile(3,k) = sand_pile(3,k) + 1;
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
s = [50*sand_pile(3,exist_position_1) 100*sand_pile(3,exist_position_2) 200*sand_pile(3,exist_position_3)];
polarscatter(sand_pile(1,exist_position),sand_pile(2,exist_position),s,'filled')
end



