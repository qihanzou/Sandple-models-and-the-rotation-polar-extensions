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


number_sand = 1000;
ring_0 = [th0; r0; zeros(1,n0)];
ring_1 = [th1; r1; zeros(1,n1)];
ring_2 = [th2; r2; zeros(1,n2)];
ring_3 = [th3; r3; zeros(1,n3)];
ring_4 = [th4; r4; zeros(1,n4)];
ring_5 = [th5; r5; zeros(1,n5)];
ring_6 = [th6; r6; zeros(1,n6)];
ring_7 = [th7; r7; zeros(1,n7)];
ring_8 = [th8; r8; zeros(1,n8)];

shorest_number = 5;
ZC = 3; % critical values

v1=0;
v2=1;
v3=1;
v4=1;
v5=1;
v6=1;
v7=1;
v8=1;
v9=1;
v10=1;
v11=1;
v12=1;
v13=1;
v14=1;
v15=1;
v16=1;
v17=1;
v18=1;
v19=1;
v20=1;
v21=1;

for i=1:number_sand
    pause(1);
    index_now = round(1+rand(1,1)*(n-1)); % randomly choose;
    
    theta_now = sand_pile(1,index_now);
    radius_now = sand_pile(2,index_now);
    sand_pile(3,index_now) = sand_pile(3,index_now) + 1;
  

    [position_tops] = find( sand_pile(3,:) > ZC);
    number_top = length(position_tops);
    while number_top > 0
        for j = 1: number_top
            sand_pile(3,position_tops(j)) = sand_pile(3,position_tops(j)) - (ZC+1);
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
            
            [B,I] = mink(d,shorest_number);
            for q=2:length(I)
                sand_pile(3,I(q)) = sand_pile(3,I(q)) + 1;
            end   
    
        end
        
        [position_tops] = find( sand_pile(3,:) > ZC );
        number_top = length(position_tops);
     end
    
[exist_position]=find(sand_pile(3,:)>0);
s = 20*sand_pile(3,exist_position);

polarscatter(sand_pile(1,exist_position),sand_pile(2,exist_position),s,sand_pile(3,exist_position),'filled',"square");
colormap(flipud(gray))
h=colorbar;
rlim([0 23])
axis off

 % inclued rotation here:
    th0=circshift(th0,[0,v1]); % index move 1.
    th1=circshift(th1,[0,v2]);
    th2=circshift(th2,[0,v3]);
    th3=circshift(th3,[0,v4]);
    th4=circshift(th4,[0,v5]);
    th5=circshift(th5,[0,v6]);
    th6=circshift(th6,[0,v7]);
    th7=circshift(th7,[0,v8]);
    th8=circshift(th8,[0,v9]);
    th9=circshift(th9,[0,v10]);
    th10=circshift(th10,[0,v11]);
    th11=circshift(th11,[0,v12]);
    th12=circshift(th12,[0,v13]);
    th13=circshift(th13,[0,v14]);
    th14=circshift(th14,[0,v15]);
    th15=circshift(th15,[0,v16]);
    th16=circshift(th16,[0,v17]);
    th17=circshift(th17,[0,v18]);
    th18=circshift(th18,[0,v19]);
    th19=circshift(th19,[0,v20]);
    th20=circshift(th20,[0,v21]);
    
    %position now.
    sand_pile(1,:)=[th0 th1 th2 th3 th4 th5 th6 th7 th8 th9 th10 th11 th12 th13 th14 th15 th16 th17 th18 th19 th20];
    sand_pile(2,:)=[r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20];
 
end