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

N9= 9 ;
th9 = 2*pi/(N9*6):2*pi/(N9*6):2*pi;
n9=length(th9);
r9 =9*ones(n9,1)';
act9 = zeros(1,n9);

N10= 10;
th10 = 2*pi/(N10*6):2*pi/(N10*6):2*pi;
n10=length(th10);
r10 =10*ones(n10,1)';
act10 = zeros(1,n10);

N11= 11;
th11 = 2*pi/(N11*6):2*pi/(N11*6):2*pi;
n11=length(th11);
r11 =11*ones(n11,1)';
act11 = zeros(1,n11);

N12= 12;
th12 = 2*pi/(N12*6):2*pi/(N12*6):2*pi;
n12=length(th12);
r12 =12*ones(n12,1)';
act12 = zeros(1,n12);

N13= 13;
th13 = 2*pi/(N13*6):2*pi/(N13*6):2*pi;
n13=length(th13);
r13 =13*ones(n13,1)';
act13 = zeros(1,n13);

N14=14;
th14 = 2*pi/(N14*6):2*pi/(N14*6):2*pi;
n14=length(th14);
r14 =14*ones(n14,1)';
act14 = zeros(1,n14);

N15=15;
th15 = 2*pi/(N15*6):2*pi/(N15*6):2*pi;
n15=length(th15);
r15 =15*ones(n15,1)';
act15 = zeros(1,n15);

N16=16;
th16 = 2*pi/(N16*6):2*pi/(N16*6):2*pi;
n16=length(th16);
r16 =16*ones(n16,1)';
act16 = zeros(1,n16);

N17=17;
th17 = 2*pi/(N17*6):2*pi/(N17*6):2*pi;
n17=length(th17);
r17 =17*ones(n17,1)';
act17 = zeros(1,n17);

N18=18;
th18 = 2*pi/(N18*6):2*pi/(N18*6):2*pi;
n18=length(th18);
r18 =18*ones(n18,1)';
act18 = zeros(1,n18);

N19=19;
th19 = 2*pi/(N19*6):2*pi/(N19*6):2*pi;
n19=length(th19);
r19 =19*ones(n19,1)';
act19 = zeros(1,n19);

N20=20;
th20 = 2*pi/(N20*6):2*pi/(N20*6):2*pi;
n20=length(th20);
r20 =20*ones(n20,1)';
act20 = zeros(1,n20);


n = n0+n1+n2+n3+n4+n5+n6+n7+n8+n9+n10+n11+n12+n13+n14+n15+n16+n17+n18+n19+n20;
sand_pile = [th0 th1 th2 th3 th4 th5 th6 th7 th8 th9 th10 th11 th12 th13 th14 th15 th16 th17 th18 th19 th20; r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20; zeros(1,n) ];
%active_matrix = [th0 th1 th2 th3 th4 th5 th6 th7 th8 th9 th10 th11 th12 th13 th14 th15 th16 th17 th18 th19 th20; r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20; zeros(1,n)];
active_matrix = [th0 th1 th2 th3 th4 th5 th6 th7 th8 th9 th10 th11 th12 th13 th14 th15 th16 th17 th18 th19 th20; r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20; act0 act1 act2 act3 act4 act5 act6 act7 act8 act9 act10 act11 act12 act13 act14 act15 act16 act17 act18 act19 act20];
number_sand = 1000;

regeneration_time_1 = 100; % dropping regerneration time
regeneration_time_2 = 100; % topping regerneration time
shorest_number = 5;
p = 0.5;
choose_p = 1;
ZC = 3; % critical values

v1=0;
v2=1;
v3=2;
v4=3;
v5=4;
v6=5;
v7=6;
v8=7;
v9=8;
v10=9;
v11=11;
v12=12;
v13=13;
v14=13;
v15=14;
v16=14;
v17=14;
v18=15;
v19=15;
v20=15;
v21=15;


for i=1:number_sand
    pause(0.01);
   
    [in_active_position] = find(active_matrix(3,:) > 0);
    in_act = length(in_active_position);
    for g=1:in_act
       active_matrix(3,in_active_position(g)) = active_matrix(3,in_active_position(g)) - 1; 
    end
    
    [active_position] = find(active_matrix(3,:) == 0);
    act = length(active_position);
    %index_now = round(1+rand(1,1)*(act-1)); % randomly choose
    active_position = active_position(1:round(act*choose_p-1));
    act = length(active_position);
    index_now = round(1+rand(1,1)*(act-1));
    
    theta_now = sand_pile(1,index_now);
    radius_now = sand_pile(2,index_now);
    sand_pile(3,index_now) = sand_pile(3,index_now) + 1;
    active_matrix(3,index_now) = active_matrix(3,index_now) + regeneration_time_1; % become inactive and need a regeneration

    [position_tops] = find( sand_pile(3,:) > ZC);
    number_top = length(position_tops);
    while number_top > 0
        for j = 1: number_top
            sand_pile(3,position_tops(j)) = sand_pile(3,position_tops(j)) - (ZC+1);
            theta_top_now  = sand_pile(1,position_tops(j));
            radius_top_now = sand_pile(2,position_tops(j));
            active_matrix(3,position_tops(j)) = active_matrix(3,position_tops(j)) + regeneration_time_2;
            
            radius1 = gpuArray(radius_top_now);
            theta1  = gpuArray(rad2deg(theta_top_now));
            radius2 = gpuArray(sand_pile(2,:));
            theta2  = gpuArray(rad2deg(sand_pile(1,:)));
            
            radius1_square=radius1^2;
            radius1_new = ones(1,length(radius2))*radius1_square;
            d_square_gpu = radius1_new + radius2.^2 - (2 * radius1 * radius2 .* cos(theta1 - theta2));
            d = d_square_gpu;
            
            [B,I] = mink(d,shorest_number);
            z = length(I);
            
            % need to check if active
            [active_position] = find(active_matrix(3,:) == 0);
            
            for q=2:z
                if ismember(I(q),active_position)==1
                   sand_pile(3,I(q)) = sand_pile(3,I(q)) + 1;
                   active_matrix(3,I(q)) = active_matrix(3,I(q)) + regeneration_time_2;
                end
            end
                
        end
        
        [position_tops] = find( sand_pile(3,:) > ZC );
        number_top = length(position_tops);
     end
    
[exist_position]=find(sand_pile(3,:)>0);
s = 20*sand_pile(3,exist_position);
%XXX = sand_pile(3,exist_position);

%XXX(sand_pile(3,exist_position)==1)=100;
%XXX(sand_pile(3,exist_position)==2)=50;
%XXX(sand_pile(3,exist_position)==3)=25;
%s = XXX;

%s = 20*ones(1,length(exist_position));
polarscatter(sand_pile(1,exist_position),sand_pile(2,exist_position),s,sand_pile(3,exist_position),'filled',"square");
colormap(flipud(gray))
%colormap(winter)
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
    
    act0=circshift(act0,[0,v1]);
    act1=circshift(act1,[0,v2]);
    act2=circshift(act2,[0,v3]);
    act3=circshift(act3,[0,v4]);
    act4=circshift(act4,[0,v5]);
    act5=circshift(act5,[0,v6]);
    act6=circshift(act6,[0,v7]);
    act7=circshift(act7,[0,v8]);
    act8=circshift(act8,[0,v9]);
    act9=circshift(act9,[0,v10]);
    act10=circshift(act10,[0,v11]);
    act11=circshift(act11,[0,v12]);
    act12=circshift(act12,[0,v13]);
    act13=circshift(act13,[0,v14]);
    act14=circshift(act14,[0,v15]);
    act15=circshift(act15,[0,v16]);
    act16=circshift(act16,[0,v17]);
    act17=circshift(act17,[0,v18]);
    act18=circshift(act18,[0,v19]);
    act19=circshift(act19,[0,v20]);
    act20=circshift(act20,[0,v21]);
    
    %position now.
    sand_pile(1,:)=[th0 th1 th2 th3 th4 th5 th6 th7 th8 th9 th10 th11 th12 th13 th14 th15 th16 th17 th18 th19 th20];
    sand_pile(2,:)=[r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20];
    %active_matrix = [th0 th1 th2 th3 th4 th5 th6 th7 th8 th9 th10 th11 th12 th13 th14 th15 th16 th17 th18 th19 th20; r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20; zeros(1,n)];
    active_matrix = [th0 th1 th2 th3 th4 th5 th6 th7 th8 th9 th10 th11 th12 th13 th14 th15 th16 th17 th18 th19 th20; r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20; act0 act1 act2 act3 act4 act5 act6 act7 act8 act9 act10 act11 act12 act13 act14 act15 act16 act17 act18 act19 act20];
   
end


