clc;clear;close all;
numArrays = 50;
N_ring= cell(numArrays,1);
th_ring = cell(numArrays,1);
number_sites_ring = cell(numArrays,1);
radius_ring = cell(numArrays,1);
act_ring = cell(numArrays,1);
life_ring = cell(numArrays,1);
for n = 1:numArrays
    N_ring{n} = n;
    th_ring{n} = 2*pi/(n*6):2*pi/(n*6):2*pi;
    number_sites_ring{n} = length(th_ring{n});
    radius_ring{n} = n*ones(1, number_sites_ring{n});
    act_ring{n} = zeros(1,number_sites_ring{n});
    life_ring{n} = zeros(1,number_sites_ring{n});
    ring{n} = [th_ring{n}; radius_ring{n}; act_ring{n}; life_ring{n}; zeros(1,number_sites_ring{n})];
end


number_sand = 1500;
m = 10;

for i=1:number_sand
    pause(0.01);
    
    %position now.
    sand_pile(1,:)=[th0 th1 th2 th3 th4 th5 th6 th7 th8 th9 th10 th11 th12 th13 th14 th15 th16 th17 th18 th19 th20];
    sand_pile(2,:)=[r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20];
    
    %index_now = randi([1 n],1,1);
    index_now = round(1+rand(1,1)*(m-1));
    theta_now = sand_pile(1,index_now);
    radius_now = sand_pile(2,index_now);
    sand_pile(3,index_now) = sand_pile(3,index_now) + 1;

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
            
            radius1_square=radius1^2;
            radius1_new = ones(1,length(radius2))*radius1_square;
            d_square_gpu = radius1_new + radius2.^2 - (2 * radius1 * radius2 .* cos(theta1 - theta2));
            d = d_square_gpu;
            [B,I] = mink(d,5);
            z = length(I);
            
            for q=2:z
            sand_pile(3,I(q)) = sand_pile(3,I(q)) + 1;
            end   
        end
        
        [position_tops] = find( sand_pile(3,:) > 3 );
        number_top = length(position_tops);
     end
    
[exist_position]=find(sand_pile(3,:)>0);
s = 30*sand_pile(3,exist_position);
polarscatter(sand_pile(1,exist_position),sand_pile(2,exist_position),s,sand_pile(3,exist_position),'filled')
h=colorbar;
rlim([0 20])
end



