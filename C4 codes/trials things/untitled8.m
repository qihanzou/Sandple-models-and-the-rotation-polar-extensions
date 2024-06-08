clc;clear;close all;
N0=0;
th0 = 0;
n0=length(th0);
r0 = 0*ones(n0);
act0 = zeros(1,n0);
N1 = 1;
th1 = 2*pi/(N1*6):2*pi/(N1*6):2*pi;
n1=length(th1);
r1 = ones(n1,1)';
act1 = zeros(1,n1);
N2 = 2;
th2 = 2*pi/(N2*6):2*pi/(N2*6):2*pi;
n2=length(th2);
r2 = 2*ones(n2,1)';
act2 = zeros(1,n2);
N3 = 3;
th3 = 2*pi/(N3*6):2*pi/(N3*6):2*pi;
n3=length(th3);
r3 = 3*ones(n3,1)';
act3 = zeros(1,n3);
N4= 4 ;
th4 = 2*pi/(N4*6):2*pi/(N4*6):2*pi;
n4=length(th4);
r4 = 4*ones(n4,1)';
act4 = zeros(1,n4);
N5= 5 ;
th5 = 2*pi/(N5*6):2*pi/(N5*6):2*pi;
n5=length(th5);
r5 = 5*ones(n5,1)';
act5 = zeros(1,n5);
N6= 6;
th6 = 2*pi/(N6*6):2*pi/(N6*6):2*pi;
n6=length(th6);
r6 = 6*ones(n6,1)';
act6 = zeros(1,n6);
N7= 7 ;
th7 = 2*pi/(N7*6):2*pi/(N7*6):2*pi;
n7=length(th7);
r7 = 7*ones(n7,1)';
act7 = zeros(1,n7);
N8= 8;
th8 = 2*pi/(N8*6):2*pi/(N8*6):2*pi;
n8=length(th8);
r8 =8*ones(n8,1)';
act8 = zeros(1,n8);


number_ring = 9;
number_sand = 100;


ring_0 = [th0; r0; zeros(1,n0)];
ring_1 = [th1; r1; zeros(1,n1)];
ring_2 = [th2; r2; zeros(1,n2)];
ring_3 = [th3; r3; zeros(1,n3)];
ring_4 = [th4; r4; zeros(1,n4)];
ring_5 = [th5; r5; zeros(1,n5)];
ring_6 = [th6; r6; zeros(1,n6)];
ring_7 = [th7; r7; zeros(1,n7)];
ring_8 = [th8; r8; zeros(1,n8)];

ring_0(3,:) = gpuArray(ring_0(3,:));
ring_1(3,:) = gpuArray(ring_1(3,:));
ring_2(3,:) = gpuArray(ring_2(3,:));
ring_3(3,:) = gpuArray(ring_3(3,:));
ring_4(3,:) = gpuArray(ring_4(3,:));
ring_5(3,:) = gpuArray(ring_5(3,:));
ring_6(3,:) = gpuArray(ring_6(3,:));
ring_7(3,:) = gpuArray(ring_7(3,:));
ring_8(3,:) = gpuArray(ring_8(3,:));


for i=1:number_sand
    pause(0.1)
    which_ring_add = round(1+rand(1,1)*(number_ring-1));
    if which_ring_add == 1
       which_site_add = round(1+rand(1,1)*(length(th0)-1));
       ring_0(3,which_site_add) = ring_0(3,which_site_add)+1;
    end
    if which_ring_add == 2
       which_site_add = round(1+rand(1,1)*(length(th1)-1));
       ring_1(3,which_site_add) = ring_1(3,which_site_add)+1;
    end
    if which_ring_add == 3
       which_site_add = round(1+rand(1,1)*(length(th2)-1));
       ring_2(3,which_site_add) = ring_2(3,which_site_add)+1;
    end
    if which_ring_add == 4
       which_site_add = round(1+rand(1,1)*(length(th3)-1));
       ring_3(3,which_site_add) = ring_3(3,which_site_add)+1;
    end
     if which_ring_add == 5
       which_site_add = round(1+rand(1,1)*(length(th4)-1));
       ring_4(3,which_site_add) = ring_4(3,which_site_add)+1;
    end
    if which_ring_add == 6
       which_site_add = round(1+rand(1,1)*(length(th5)-1));
       ring_5(3,which_site_add) = ring_5(3,which_site_add)+1;
    end
    if which_ring_add == 7
       which_site_add = round(1+rand(1,1)*(length(th6)-1));
       ring_6(3,which_site_add) = ring_6(3,which_site_add)+1;
    end
    if which_ring_add == 8
       which_site_add = round(1+rand(1,1)*(length(th7)-1));
       ring_7(3,which_site_add) = ring_7(3,which_site_add)+1;
    end
    if which_ring_add == 9
       which_site_add = round(1+rand(1,1)*(length(th8)-1));
       ring_8(3,which_site_add) = ring_8(3,which_site_add)+1;
    end

    [position_tops0] = find( ring_0(3,:) > 3);
    number_top0 = length(position_tops0);
    while number_top0 > 0
        for j0 = 1: number_top0
            ring_0(3,position_tops0(j0)) = ring_0(3,position_tops0(j0)) - 4;
        end
    end

    [position_tops1] = find( ring_1(3,:) > 3);
    number_top1 = length(position_tops1);
    while number_top1 > 0
        for j1 = 1: number_top1
            ring_1(3,position_tops1(j1)) = ring_1(3,position_tops1(j1)) - 4;
        end
    end

    [position_tops2] = find( ring_2(3,:) > 3);
    number_top2 = length(position_tops2);
    while number_top2 > 0
        for j2 = 1: number_top2
            ring_2(3,position_tops2(j2)) = ring_2(3,position_tops2(j2)) - 4;
        end
    end

    [position_tops3] = find( ring_3(3,:) > 3);
    number_top3 = length(position_tops3);
    while number_top3 > 0
        for j3 = 1: number_top3
            ring_3(3,position_tops3(j3)) = ring_3(3,position_tops3(j3)) - 4;
        end
    end

    [position_tops4] = find( ring_4(3,:) > 3);
    number_top4 = length(position_tops4);
    while number_top4 > 0
        for j4 = 1: number_top4
            ring_4(3,position_tops4(j4)) = ring_4(3,position_tops4(j4)) - 4;
        end
    end

    [position_tops5] = find( ring_5(3,:) > 3);
    number_top5 = length(position_tops5);
    while number_top5 > 0
        for j5 = 1: number_top5
            ring_5(3,position_tops5(j5)) = ring_5(3,position_tops5(j5)) - 4;
        end
    end

    [position_tops6] = find( ring_6(3,:) > 3);
    number_top6 = length(position_tops6);
    while number_top6 > 0
        for j6 = 1: number_top6
            ring_6(3,position_tops6(j6)) = ring_6(3,position_tops6(j6)) - 4;
        end
    end

    [position_tops7] = find( ring_7(3,:) > 3);
    number_top7 = length(position_tops7);
    while number_top7 > 0
        for j7 = 1: number_top7
            ring_7(3,position_tops7(j7)) = ring_7(3,position_tops7(j7)) - 4;
        end
    end

    [position_tops8] = find( ring_8(3,:) > 3);
    number_top8 = length(position_tops8);
    while number_top8 > 0
        for j8 = 1: number_top8
            ring_8(3,position_tops8(j8)) = ring_8(3,position_tops8(j8)) - 4;
        end
    end

   [exist_position0]=find(ring_0(3,:)>0);
   polarscatter(ring_0(1,exist_position0),ring_0(2,exist_position0), "black", 'filled');
 
   hold on
   [exist_position1]=find(ring_1(3,:)>0);
   polarscatter(ring_1(1,exist_position1),ring_1(2,exist_position1), "black", 'filled');
   
   hold on
   [exist_position2]=find(ring_2(3,:)>0);
   polarscatter(ring_2(1,exist_position2),ring_2(2,exist_position2), "black", 'filled');
   
   hold on
   [exist_position3]=find(ring_3(3,:)>0);
   polarscatter(ring_3(1,exist_position3),ring_3(2,exist_position3), "black", 'filled');
   
   hold on
   [exist_position4]=find(ring_4(3,:)>0);
   polarscatter(ring_4(1,exist_position4),ring_4(2,exist_position4), "black", 'filled');
   
   hold on
   [exist_position5]=find(ring_5(3,:)>0);
   polarscatter(ring_5(1,exist_position5),ring_5(2,exist_position5), "black", 'filled');
   
   hold on
   [exist_position6]=find(ring_6(3,:)>0);
   polarscatter(ring_6(1,exist_position6),ring_6(2,exist_position6), "black", 'filled');
   
   hold on
   [exist_position7]=find(ring_7(3,:)>0);
   polarscatter(ring_7(1,exist_position7),ring_7(2,exist_position7), "black", 'filled');
   
   hold on
   [exist_position8]=find(ring_8(3,:)>0);
   polarscatter(ring_8(1,exist_position8),ring_8(2,exist_position8), "black", 'filled');



end