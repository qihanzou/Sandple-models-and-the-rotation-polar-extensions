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

N21=21;
th21 = 2*pi/(N21*6):2*pi/(N21*6):2*pi;
n21=length(th21);
r21 =21*ones(n21,1)';
act21 = zeros(1,n21);

N22=22;
th22 = 2*pi/(N22*6):2*pi/(N22*6):2*pi;
n22=length(th22);
r22 =22*ones(n22,1)';
act22 = zeros(1,n22);

N23=23;
th23 = 2*pi/(N23*6):2*pi/(N23*6):2*pi;
n23=length(th23);
r23 =23*ones(n23,1)';
act23 = zeros(1,n23);

N24=24;
th24 = 2*pi/(N24*6):2*pi/(N24*6):2*pi;
n24=length(th24);
r24 =24*ones(n24,1)';
act24 = zeros(1,n24);

N25=25;
th25 = 2*pi/(N25*6):2*pi/(N25*6):2*pi;
n25=length(th25);
r25 =25*ones(n25,1)';
act25 = zeros(1,n25);

N26=26;
th26 = 2*pi/(N26*6):2*pi/(N26*6):2*pi;
n26=length(th26);
r26 =26*ones(n26,1)';
act26 = zeros(1,n26);

N27=27;
th27 = 2*pi/(N27*6):2*pi/(N27*6):2*pi;
n27=length(th27);
r27 =27*ones(n27,1)';
act27 = zeros(1,n27);

N28=28;
th28 = 2*pi/(N28*6):2*pi/(N28*6):2*pi;
n28=length(th28);
r28 =28*ones(n28,1)';
act28 = zeros(1,n28);

N29=29;
th29 = 2*pi/(N29*6):2*pi/(N29*6):2*pi;
n29=length(th29);
r29 =29*ones(n29,1)';
act29 = zeros(1,n29);

N30=30;
th30 = 2*pi/(N30*6):2*pi/(N30*6):2*pi;
n30=length(th30);
r30 =30*ones(n30,1)';
act30 = zeros(1,n30);

n = n4+n5+n6+n7+n8+n9+n10+n11+n12+n13+n14+n15+n16+n17+n18+n19+n20+n21+n22+n23+n24+n25+n26+n27+n28+n29+n30;
sand_pile = [th4 th5 th6 th7 th8 th9 th10 th11 th12 th13 th14 th15 th16 th17 th18 th19 th20 th21 th22 th23 th24 th25 th26 th27 th28 th29 th30;r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30; zeros(1,n) ];
active_matrix = [th4 th5 th6 th7 th8 th9 th10 th11 th12 th13 th14 th15 th16 th17 th18 th19 th20 th21 th22 th23 th24 th25 th26 th27 th28 th29 th30;r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30; act4 act5 act6 act7 act8 act9 act10 act11 act12 act13 act14 act15 act16 act17 act18 act19 act20 act21 act22 act23 act24 act25 act26 act27 act28 act29 act30];
number_sand = 5000;
p_sp=0.1;
p_st=0.28;


interval=1; % every few sand drops polt a graph.
frames(number_sand/interval)=struct('cdata',[],'colormap',[]);
bb=1; %index of images



regeneration_time_1 = 200; % dropping regerneration time
regeneration_time_2 = 200; % topping regerneration time
shorest_number = 5;
add_number=3;

choose_p = 1;
ZC = 1; % critical values
ZO = 0;


v4=1;
v5=1;
v6=1;
v7=1;
v8=1;
v9=2;
v10=2;
v11=2;
v12=2;
v13=2;
v14=2;
v15=3;
v16=3;
v17=3;
v18=3;
v19=3;
v20=3;
v21=3;
v22=3;
v23=3;
v24=3;
v25=3;
v26=3;
v27=3;
v28=3;
v29=3;
v30=3;


for i=1:number_sand
    %pause(0.001);
   
    [in_active_position] = find(active_matrix(3,:) > 0);
    in_act = length(in_active_position);
    for g=1:in_act
       active_matrix(3,in_active_position(g)) = active_matrix(3,in_active_position(g)) - 1; 
    end
    
    [active_position] = find(active_matrix(3,:) == 0);
    act = length(active_position);
    active_position = active_position(1:round(act-1));
    act = length(active_position);
    randomNUM = round(1+rand(1,1)*(act-1));
    index_now = active_position(randomNUM);
    
    theta_now = sand_pile(1,index_now);
    radius_now = sand_pile(2,index_now);
    theta_now_degree = theta_now*180/pi;
    
    radius_1 = discretize(radius_now, [3,6])==1;
    
    RA1=60;
    RA2=90;
    RB1=150;
    RB2=180;
    RC1=240;
    RC2=270;
    RD1=330;
    RD2=360;
    
    RA=[RA1,RA2];
    RB=[RB1,RB2];
    RC=[RC1,RC2];
    RD=[RD1,RD2];
    
    isInside_1 = discretize(theta_now_degree, RA)==1;
    isInside_2 = discretize(theta_now_degree, RB)==1;
    isInside_3 = discretize(theta_now_degree, RC)==1;
    isInside_4 = discretize(theta_now_degree, RD)==1;

    active_or_not = rand;
    if active_or_not <= p_sp
         
       if radius_1 == 1
        sand_pile(3,index_now) = sand_pile(3,index_now) + add_number;
        active_matrix(3,index_now) = active_matrix(3,index_now) + regeneration_time_1;
       elseif isInside_1==1 || isInside_2==1 || isInside_3==1 || isInside_4==1
        %if isInside_1==1 || isInside_2==1 || isInside_3==1 || isInside_4==1 || isInside_5==1|| isInside_6==1
        sand_pile(3,index_now) = sand_pile(3,index_now) + add_number;
        active_matrix(3,index_now) = active_matrix(3,index_now) + regeneration_time_1; % become inactive and need a regeneration
       end

    end
    
    
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
                    active_or_not2 = rand;
                    if active_or_not2 <= p_st
                       sand_pile(3,I(q)) = sand_pile(3,I(q)) + 1;
                       active_matrix(3,I(q)) = active_matrix(3,I(q)) + regeneration_time_2;
                    end
                end
            end    
        end        
        [position_tops] = find( sand_pile(3,:) > ZC );
        number_top = length(position_tops);
     end
    
[exist_position]=find(sand_pile(3,:)>0);
s = 20*sand_pile(3,exist_position);

if mod(i,interval)==0 
        polarscatter(sand_pile(1,exist_position),sand_pile(2,exist_position),s,sand_pile(3,exist_position),'filled',"square");
        colormap(flipud(gray))
        h=colorbar;
        rlim([0 33])
        axis off
        graphsetting([0.2 0.1 0.6 0.8]);  
        axis off
        title(['number of sand: ',sprintf('%d',i)])
        drawnow;
        frames(bb) = getframe(gcf);
        bb=bb+1;
end
    th4=circshift(th4,[0,v4]);
    th5=circshift(th5,[0,v5]);
    th6=circshift(th6,[0,v6]);
    th7=circshift(th7,[0,v7]);
    th8=circshift(th8,[0,v8]);
    th9=circshift(th9,[0,v9]);
    th10=circshift(th10,[0,v10]);
    th11=circshift(th11,[0,v11]);
    th12=circshift(th12,[0,v12]);
    th13=circshift(th13,[0,v13]);
    th14=circshift(th14,[0,v14]);
    th15=circshift(th15,[0,v15]);
    th16=circshift(th16,[0,v16]);
    th17=circshift(th17,[0,v17]);
    th18=circshift(th18,[0,v18]);
    th19=circshift(th19,[0,v19]);
    th20=circshift(th20,[0,v20]);
    th21=circshift(th21,[0,v21]);
    th22=circshift(th22,[0,v22]);
    th23=circshift(th23,[0,v23]);
    th24=circshift(th24,[0,v24]);
    th25=circshift(th25,[0,v25]);
    th26=circshift(th26,[0,v26]);
    th27=circshift(th27,[0,v27]);
    th28=circshift(th28,[0,v28]);
    th29=circshift(th29,[0,v29]);
    th30=circshift(th30,[0,v30]);

    act4=circshift(act4,[0,v4]);
    act5=circshift(act5,[0,v5]);
    act6=circshift(act6,[0,v6]);
    act7=circshift(act7,[0,v7]);
    act8=circshift(act8,[0,v8]);
    act9=circshift(act9,[0,v9]);
    act10=circshift(act10,[0,v10]);
    act11=circshift(act11,[0,v11]);
    act12=circshift(act12,[0,v12]);
    act13=circshift(act13,[0,v13]);
    act14=circshift(act14,[0,v14]);
    act15=circshift(act15,[0,v15]);
    act16=circshift(act16,[0,v16]);
    act17=circshift(act17,[0,v17]);
    act18=circshift(act18,[0,v18]);
    act19=circshift(act19,[0,v19]);
    act20=circshift(act20,[0,v20]);
    act21=circshift(act21,[0,v21]);
    act22=circshift(act22,[0,v22]);
    act23=circshift(act23,[0,v23]);
    act24=circshift(act24,[0,v24]);
    act25=circshift(act25,[0,v25]);
    act26=circshift(act26,[0,v26]);
    act27=circshift(act27,[0,v27]);
    act28=circshift(act28,[0,v28]);
    act29=circshift(act29,[0,v29]);
    act30=circshift(act30,[0,v30]);
    
    %position now.
    sand_pile(1,:)=[th4 th5 th6 th7 th8 th9 th10 th11 th12 th13 th14 th15 th16 th17 th18 th19 th20 th21 th22 th23 th24 th25 th26 th27 th28 th29 th30];
    sand_pile(2,:)=[ r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30];
    active_matrix = [ th4 th5 th6 th7 th8 th9 th10 th11 th12 th13 th14 th15 th16 th17 th18 th19 th20 th21 th22 th23 th24 th25 th26 th27 th28 th29 th30; r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30; act4 act5 act6 act7 act8 act9 act10 act11 act12 act13 act14 act15 act16 act17 act18 act19 act20 act21 act22 act23 act24 act25 act26 act27 act28 act29 act30];
end

Video = VideoWriter('galaxy','MPEG-4');
open(Video);
writeVideo(Video,frames)
close(Video);

function graphsetting(setting)
    set(0,'units','centimeters') % we want to get unit in cm.
    computerscreensize=get(0,'screensize');  
    Length = computerscreensize(3); %length of computer screen
    Height = computerscreensize(4); %height of computer screen
    position=[setting(1)*Length setting(2)*Height setting(3)*Length setting(4)*Height];
    set(gcf,'units','centimeters','position',position); %Set the position & size of graph.
end