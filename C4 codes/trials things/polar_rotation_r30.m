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

N12=12;
th12 = 2*pi/(N12*6):2*pi/(N12*6):2*pi;
n12=length(th12);
r12 =12*ones(n12,1)';

N13=13;
th13 = 2*pi/(N13*6):2*pi/(N13*6):2*pi;
n13=length(th13);
r13 =13*ones(n13,1)';

N14=14;
th14 = 2*pi/(N14*6):2*pi/(N14*6):2*pi;
n14=length(th14);
r14 =14*ones(n14,1)';

N15=15;
th15 = 2*pi/(N15*6):2*pi/(N15*6):2*pi;
n15=length(th15);
r15 =15*ones(n15,1)';

N16=16;
th16 = 2*pi/(N16*6):2*pi/(N16*6):2*pi;
n16=length(th16);
r16 =16*ones(n16,1)';

N17=17;
th17 = 2*pi/(N17*6):2*pi/(N17*6):2*pi;
n17=length(th17);
r17 =17*ones(n17,1)';

N18=18;
th18 = 2*pi/(N18*6):2*pi/(N18*6):2*pi;
n18=length(th18);
r18 =18*ones(n18,1)';

N19=19;
th19 = 2*pi/(N19*6):2*pi/(N19*6):2*pi;
n19=length(th19);
r19 =19*ones(n19,1)';

N20=20;
th20 = 2*pi/(N20*6):2*pi/(N20*6):2*pi;
n20=length(th20);
r20 =20*ones(n20,1)';

N21=21;
th21 = 2*pi/(N21*6):2*pi/(N21*6):2*pi;
n21=length(th21);
r21 =21*ones(n21,1)';

N22=22;
th22 = 2*pi/(N22*6):2*pi/(N22*6):2*pi;
n22=length(th22);
r22 =22*ones(n22,1)';

N23=23;
th23 = 2*pi/(N23*6):2*pi/(N23*6):2*pi;
n23=length(th23);
r23 =23*ones(n23,1)';

N24=24;
th24 = 2*pi/(N24*6):2*pi/(N24*6):2*pi;
n24=length(th24);
r24 =24*ones(n24,1)';

N25=25;
th25 = 2*pi/(N25*6):2*pi/(N25*6):2*pi;
n25=length(th25);
r25 =25*ones(n25,1)';

N26=26;
th26 = 2*pi/(N26*6):2*pi/(N26*6):2*pi;
n26=length(th26);
r26 =26*ones(n26,1)';

N27=27;
th27 = 2*pi/(N27*6):2*pi/(N27*6):2*pi;
n27=length(th27);
r27 =27*ones(n27,1)';

N28=28;
th28 = 2*pi/(N28*6):2*pi/(N28*6):2*pi;
n28=length(th28);
r28 =28*ones(n28,1)';

N29=29;
th29 = 2*pi/(N29*6):2*pi/(N29*6):2*pi;
n29=length(th29);
r29 =29*ones(n29,1)';

N30=30;
th30 = 2*pi/(N30*6):2*pi/(N30*6):2*pi;
n30=length(th30);
r30 =30*ones(n30,1)';


n = n0+n1+n2+n3+n4+n5+n6+n7+n8+n9+n10+n11+n12+n13+n14+n15+n16+n17+n18+n19+n20+n21+n22+n23+n24+n25+n26+n27+n28+n29+n30;
sand_pile = [th0 th1 th2 th3 th4 th5 th6 th7 th8 th9 th10 th11 th12 th13 th14 th15 th16 th17 th18 th19 th20 th21 th22 th23 th24 th25 th26 th27 th28 th29 th30; r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30; zeros(1,n) ];
number_sand = 1000;
m = n;

for i=1:number_sand
    pause(0.01);
    % inclued rotation here.
    th0=circshift(th0,[0,0]); % index move 1.
    th1=circshift(th1,[0,1]);
    th2=circshift(th2,[0,1]);
    th3=circshift(th3,[0,2]);
    th4=circshift(th4,[0,2]);
    th5=circshift(th5,[0,3]);
    th6=circshift(th6,[0,3]);
    th7=circshift(th7,[0,7]);
    th8=circshift(th8,[0,4]);
    th9=circshift(th9,[0,5]);
    th10=circshift(th10,[0,6]);
    th11=circshift(th11,[0,6]);
    th12=circshift(th12,[0,7]);
    th13=circshift(th13,[0,7]);
    th14=circshift(th14,[0,8]);
    th15=circshift(th15,[0,8]);
    th16=circshift(th16,[0,9]);
    th17=circshift(th17,[0,10]);
    th18=circshift(th18,[0,10]);
    th19=circshift(th19,[0,11]);
    th20=circshift(th20,[0,12]);
    th21=circshift(th21,[0,12]);
    th22=circshift(th22,[0,13]);
    th23=circshift(th23,[0,13]);
    th24=circshift(th24,[0,14]);
    th25=circshift(th25,[0,15]);
    th26=circshift(th26,[0,15]);
    th27=circshift(th27,[0,16]);
    th28=circshift(th28,[0,16]);
    th29=circshift(th29,[0,17]);
    th30=circshift(th30,[0,18]);
    %position now.
    sand_pile(1,:)=[th0 th1 th2 th3 th4 th5 th6 th7 th8 th9 th10 th11 th12 th13 th14 th15 th16 th17 th18 th19 th20 th21 th22 th23 th24 th25 th26 th27 th28 th29 th30];
    sand_pile(2,:)=[r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30];
    
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
    
%[exist_position]=find(sand_pile(3,:)>0);
%s = 30*sand_pile(3,exist_position);
%polarscatter(sand_pile(1,exist_position),sand_pile(2,exist_position),s,sand_pile(3,exist_position),'filled')
%colormap(flipud(gray))
%h=colorbar;
%caxis([0 3])
%rlim([0 30])

s = 10*ones(1,n);
polarscatter(sand_pile(1,:),sand_pile(2,:),s,sand_pile(3,:),'filled')
colormap(flipud(hot))
h=colorbar;
%caxis([0 3])
rlim([0 30])
axis off;
end



