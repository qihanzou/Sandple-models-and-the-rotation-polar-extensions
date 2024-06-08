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
sand_pile = [th0 th1 th2 th3 th4 th5 th6 th7 th8 th9 th10 th11; r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11; zeros(1,n) ];
number_sand = 1000;

for i=1:number_sand
    pause(0.001);
    sand_pile(3,1) = sand_pile(3,1) + 1;

    [position_tops] = find( sand_pile(3,:) > 3);
    number_top = length(position_tops);
    while number_top > 0
        for j = 1: number_top
            sand_pile(3,position_tops(j)) = sand_pile(3,position_tops(j)) - 4;
            theta_top_now  = sand_pile(1,position_tops(j));
            radius_top_now = sand_pile(2,position_tops(j));
            
            radius1 = gpuArray(radius_top_now);
            theta1  = gpuArray(rad2deg(theta_top_now));
            radius2 = gpuArray(sand_pile(2,:));
            theta2  = gpuArray(rad2deg(sand_pile(1,:)));
            
            radius1_square = radius1^2;
            radius1_new = ones(1,length(radius2))*radius1_square;
            d_square_gpu = radius1_new + radius2.^2 - (2 * radius1 * radius2 .* cos(theta1 - theta2));
            [B,I] = mink(d_square_gpu,5);
            
            for q=2:length(I)
            sand_pile(3,I(q)) = sand_pile(3,I(q)) + 1;
            end   
        end
        
        [position_tops] = find( sand_pile(3,:) > 3 );
        number_top = length(position_tops);
     end
    

s = 30*ones(1,n);
polarscatter(sand_pile(1,:),sand_pile(2,:),s,sand_pile(3,:),'filled')
colormap(flipud(hot))
h=colorbar;
rlim([0 11])
axis off;
end