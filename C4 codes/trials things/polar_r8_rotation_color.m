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

n = n0+n1+n2+n3+n4+n5+n6+n7+n8;
sand_pile = [th0 th1 th2 th3 th4 th5 th6 th7 th8; r0 r1 r2 r3 r4 r5 r6 r7 r8; zeros(1,n) ];
number_sand = 600;
m = n;
avalanche_count = 0;
Mean_matrix = zeros(number_sand,1);
avalanche_matrix = zeros(10000,1); % create a empty matrix

for i=1:number_sand
    pause(0.01);
    % inclued rotation here.
    th0=circshift(th0,[0,0]); % index move 1.
    th1=circshift(th1,[0,1]);
    th2=circshift(th2,[0,3]);
    th3=circshift(th3,[0,6]);
    th4=circshift(th4,[0,8]);
    th5=circshift(th5,[0,10]);
    th6=circshift(th6,[0,10]);
    th7=circshift(th7,[0,10]);
    th8=circshift(th8,[0,10]);

    
    %position now.
    sand_pile(1,:)=[th0 th1 th2 th3 th4 th5 th6 th7 th8];
    sand_pile(2,:)=[r0 r1 r2 r3 r4 r5 r6 r7 r8];
    
    %index_now = randi([1 n],1,1);
    index_now = round(1+rand(1,1)*(m-1));
    theta_now = sand_pile(1,index_now);
    radius_now = sand_pile(2,index_now);
    sand_pile(3,index_now) = sand_pile(3,index_now) + 1;

    [position_tops] = find( sand_pile(3,:) > 3);
    number_top = length(position_tops);
    avalanche_matrix(i,1) = number_top;
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
        avalanche_matrix(i,1) = avalanche_matrix(i,1) + number_top;
     end
    
[exist_position]=find(sand_pile(3,:)>0);
s = 30*sand_pile(3,exist_position);
polarscatter(sand_pile(1,exist_position),sand_pile(2,exist_position),s,sand_pile(3,exist_position),'filled')
h=colorbar;
rlim([0 9])
Mean_matrix(i,1) = mean(sand_pile(3,:),"all");
end

figure(2)
X = [1:1:number_sand];
plot(X,Mean_matrix)
title('Mean number of sand over time')
ylabel('Mean number')
xlabel('time')

% for the avalanche size and frequency:
B = avalanche_matrix(find(avalanche_matrix~=0)); % delete any zero element in the vetor and create a new vector that contain only non zero elments. 
% That is, the matrix with avalanche size.
Max_number_in_B = max(B); % detect the maximum avalanche size.
X1=[1:1:Max_number_in_B]'; % create the x axis element for the plot, that is, the avalanche size form 1 to the maximum size.
Y1=zeros(Max_number_in_B,1); % create a empty matrix for the x axis for the plot, now is null but we will add elemets into it later.

for k=1:Max_number_in_B % for each possible size k of avalanche
C = numel(find(avalanche_matrix==k)); % check the frequency of size k of avalanche
Y1(k,1)=C; % put the frequenct of size k into our matrix Y1
end
% plot the log of avalanche size vs log of frequency
figure(3)
plot(log(X1),log(Y1)) % do the log sclae plot
ylabel('log of avalanche size')
xlabel('log of frequency')
title('log(avalanche size) vs log(frequency) plot')

