clc;clear;close all;

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


n = n4+n5+n6+n7+n8+n9+n10+n11+n12+n13+n14+n15+n16+n17+n18+n19+n20;
sand_pile = [th4 th5 th6 th7 th8 th9 th10 th11 th12 th13 th14 th15 th16 th17 th18 th19 th20;r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20; zeros(1,n); act4 act5 act6 act7 act8 act9 act10 act11 act12 act13 act14 act15 act16 act17 act18 act19 act20];
sand_pile = gpuArray(sand_pile);
number_sand = 1000;

regeneration_time= 11; % active regerneration time
p_sp = 0.3; % spontaneous prob
p_st = 0.28; %neighbour prob
shorest_number = 5;

for i=1:number_sand
    pause(0.1)


    % find positions that can active:
    [active_position] = find(sand_pile(4,:) == 0);
    act = length(active_position);
    for l=1:length(active_position)
        active_or_not = rand;
        if active_or_not <= p_sp
           sand_pile(3,l) = sand_pile(3,l) + 1;
        end
    end

    [position_tops] = find( sand_pile(3,:) == 1);
    number_top = length(position_tops);
    while number_top > 0
        for j = 1: number_top
            sand_pile(3,position_tops(j))=sand_pile(3,position_tops(j)) - 1;
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

            % need to check if active
            [active_position] = find(sand_pile(4,:) == 0);
            
            for q=2:length(I)
                if gpuArray(ismember(I(q),active_position)) == 1
                   active_or_not2 = gpuArray(rand);
                   if active_or_not2 <= p_st
                       sand_pile(3,I(q)) = sand_pile(3,I(q)) + 1;
                   end
                end
            end 

        end        
        %[position_tops] = find(sand_pile(3,:) > ZC );
        %number_top = length(position_tops);
     end
    
[exist_position]=find(sand_pile(3,:)>=0);
s = 20*sand_pile(3,exist_position);

polarscatter(sand_pile(1,exist_position),sand_pile(2,exist_position),s,sand_pile(3,exist_position),'filled',"square");
 
end

