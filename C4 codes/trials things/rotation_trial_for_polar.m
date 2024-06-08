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

n = n0+n1+n2+n3+n4;
height = zeros(n,1)';
sand_pile = [th0 th1 th2 th3 th4; r0 r1 r2 r3 r4; height ];
number_sand = 1000;

for i=1:number_sand 
    % inclued rotation here.
    th0=circshift(th0,[0,0]); % index move 1.
    th1=circshift(th1,[0,1]);
    th2=circshift(th2,[0,2]);
    th3=circshift(th3,[0,3]);
    th4=circshift(th4,[0,4]);
    %position now.
    sand_pile(1,:)=[th0 th1 th2 th3 th4];
    sand_pile(2,:)=[r0 r1 r2 r3 r4];
    index_now = randi([1 n],1,1);
    theta_now = sand_pile(1,index_now);
    radius_now = sand_pile(2,index_now);
    sand_pile(3,index_now) = sand_pile(3,index_now) + 1;
    height_now = sand_pile(3,:);
    
    [position_tops] = find( height_now >3);
    number_top = length(position_tops);
end

    