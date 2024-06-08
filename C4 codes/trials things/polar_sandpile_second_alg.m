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

number_sand = 2000;
p_sp=0.1;
p_st=0.28;
p_st_h=0.28;
regeneration_time = 0; 
life_time_a=8;
life_time_b=15;
life_time_c=12;
life_time2=1;
ZC=1;

interval=1; % every few sand drops polt a graph.
frames(number_sand/interval)=struct('cdata',[],'colormap',[]);
bb=1; %index of images



for i=1:number_sand

    for n=1:50
        [life] = find(ring{n}(4,:) > 1);
        for m=1:length(life)
            ring{n}(4,life(m)) = ring{n}(4,life(m)) - 1; 
        end
        [dead] = find(ring{n}(4,:) == 1);
        for mm=1:length(dead)
            ring{n}(4,dead(mm)) = 0; 
            ring{n}(5,dead(mm)) = 0;
        end  
    end


    for n=1:50
        [in_active_position] = find(ring{n}(3,:) > 1);
        for g=1:length(in_active_position)
            ring{n}(3,in_active_position(g)) = ring{n}(3,in_active_position(g)) - 1; 
        end
    end

    for n=1:50
        [active_position] = find(ring{n}(3,:) <= 0);
        for b=1:length(active_position)
            active_or_not_for_this_site = rand;
            if active_or_not_for_this_site <= p_sp
               theta_here = ring{n}(1,active_position(b));
               isInside_1 = discretize(theta_here, [65/(180/pi),85/(180/pi)])==1;
               isInside_2 = discretize(theta_here, [155/(180/pi),175/(180/pi)])==1;
               isInside_3 = discretize(theta_here, [245/(180/pi),265/(180/pi)])==1;
               isInside_4 = discretize(theta_here, [335/(180/pi),355/(180/pi)])==1;
               if isInside_1==1 || isInside_2==1 || isInside_3==1 || isInside_4==1
               ring{n}(5,active_position(b)) = ring{n}(5,active_position(b)) + 1;
               ring{n}(3,active_position(b)) = ring{n}(3,active_position(b)) + regeneration_time;
               if ring{n}(2,active_position(b)) <= 20
               ring{n}(4,active_position(b)) = ring{n}(4,active_position(b)) + life_time_c;
               end
               if ring{n}(2,active_position(b)) <= 40 && ring{n}(2,active_position(b)) > 20
               ring{n}(4,active_position(b)) = ring{n}(4,active_position(b)) + life_time_a;
               end
               if ring{n}(2,active_position(b)) >40
               ring{n}(4,active_position(b)) = ring{n}(4,active_position(b)) + life_time_b;
               end
               end
            end
        end
    end
    
    for n=1:50
        [position_tops] = find(ring{n}(5,:) > ZC);
        number_top = length(position_tops);

      while number_top > 0
        for j=1:number_top
            ring{n}(5,position_tops(j)) = ring{n}(5,position_tops(j))-4;
            theta_top_now  = ring{n}(1,position_tops(j));
            radius_top_now = ring{n}(2,position_tops(j));

            ring{n}(3,position_tops(j)) = ring{n}(3,position_tops(j)) + regeneration_time;
            
            radius_now = gpuArray(radius_top_now);
            theta_now  = gpuArray(rad2deg(theta_top_now));

               radius_same  = gpuArray(ring{n}(2,:));
               theta_same   = gpuArray(ring{n}(1,:));
               radius_now_square=radius_now^2;
               radius_now_new = ones(1,length(radius_same))*radius_now_square;
               d_square = radius_now_new + radius_same.^2 - (2 * radius_now * radius_same .* cos(theta_now - theta_same));
               [B,I] = mink(d_square,2);
               [active_position] = find(ring{n}(3,:) <= 0);
               for q=2:length(I)
                   if ismember(I(q),active_position)==1
                   active_or_not_here1 = rand;
                      if active_or_not_here1 <= p_st_h %&& ring{n}(1,I(q))>theta_now
                         ring{n}(5,I(q)) = ring{n}(5,I(q)) + 1;
                         ring{n}(3,I(q)) = ring{n}(3,I(q)) + regeneration_time;
                         ring{n}(4,I(q)) = ring{n}(4,I(q)) + life_time2;
                       end
                    end
                end 

            if n+1 <=50
               radius_up  = gpuArray(ring{n+1}(2,:));
               theta_up   = gpuArray(ring{n+1}(1,:));
               radius_now_square=radius_now^2;
               radius_now_new = ones(1,length(radius_up))*radius_now_square;
               d_square = radius_now_new + radius_up.^2 - (2 * radius_now * radius_up .* cos(theta_now - theta_up));
               [B,I] = mink(d_square,2);
               [active_position] = find(ring{n}(3,:) <= 0);
               for q=1:length(I)
                   if ismember(I(q),active_position)==1
                   active_or_not_here2 = rand;
                      if active_or_not_here2 <= p_st %&& ring{n+1}(1,I(q))>theta_now
                         ring{n+1}(5,I(q)) = ring{n+1}(5,I(q)) + 1;
                         ring{n+1}(3,I(q)) = ring{n+1}(3,I(q)) + regeneration_time;
                         ring{n+1}(4,I(q)) = ring{n+1}(4,I(q)) + life_time2;
                       end
                    end
                end 
            end

            if n-1 >=1
               radius_down  = gpuArray(ring{n-1}(2,:));
               theta_down   = gpuArray(ring{n-1}(1,:));
               radius_now_square=radius_now^2;
               radius_now_new = ones(1,length(radius_down))*radius_now_square;
               d_square = radius_now_new + radius_down.^2 - (2 * radius_now * radius_down .* cos(theta_now - theta_down));
               [B,I] = mink(d_square,2);
               [active_position] = find(ring{n}(3,:) <= 0);
               for q=2:length(I)
                   if ismember(I(q),active_position)==1
                   active_or_not_here3 = rand;
                      if active_or_not_here3 <= p_st %&& ring{n-1}(1,I(q))>theta_now
                         ring{n-1}(5,I(q)) = ring{n-1}(5,I(q)) + 1;
                         ring{n-1}(3,I(q)) = ring{n-1}(3,I(q)) + regeneration_time;
                         ring{n-1}(4,I(q)) = ring{n-1}(4,I(q)) + life_time2;
                       end
                    end
                end 
            end 

        end
        [position_tops] = find(ring{n}(5,:) > ZC);
        number_top = length(position_tops);
      end

    end
    
    for n=1:50
        sand_pile_one{1,n}=ring{n};
    end
    
    sand_pile2=[sand_pile_one{:}];
    [exist_position2]=find(sand_pile2(5,:) > 0);

    if mod(n,interval)==0 
    polarscatter(sand_pile2(1,exist_position2),sand_pile2(2,exist_position2),[],"pentagram","filled");
    colormap(flipud(gray))
    axis off
    rlim([0 55])
    graphsetting([0.2 0.1 0.6 0.8]);  
    title(['number of sand: ',sprintf('%d',i)])
    drawnow;
    frames(bb) = getframe(gcf);
    bb=bb+1;
    end

    V=[1 1 1 2 1 0 0 0  0 -1 -1 -2];
    for n=1:5
        th_ring{n}=circshift(th_ring{n},[0,V(1)]);
        ring{n}(1,:)=th_ring{n};
    end
    for n=6:10
        th_ring{n}=circshift(th_ring{n},[0,V(2)]);
        ring{n}(1,:)=th_ring{n};
    end
    for n=11:15
        th_ring{n}=circshift(th_ring{n},[0,V(3)]);
        ring{n}(1,:)=th_ring{n};
    end
    for n=16:20
        th_ring{n}=circshift(th_ring{n},[0,V(4)]);
        ring{n}(1,:)=th_ring{n};
    end
    for n=21:35
        th_ring{n}=circshift(th_ring{n},[0,V(5)]);
        ring{n}(1,:)=th_ring{n};
    end
    for n=26:30
        th_ring{n}=circshift(th_ring{n},[0,V(6)]);
        ring{n}(1,:)=th_ring{n};
    end
    for n=31:35
        th_ring{n}=circshift(th_ring{n},[0,V(7)]);
        ring{n}(1,:)=th_ring{n};
    end
    for n=35:36
        th_ring{n}=circshift(th_ring{n},[0,V(8)]);
        ring{n}(1,:)=th_ring{n};
    end
    for n=37:40
        th_ring{n}=circshift(th_ring{n},[0,V(9)]);
        ring{n}(1,:)=th_ring{n};
    end
    for n=41:45
        th_ring{n}=circshift(th_ring{n},[0,V(10)]);
        ring{n}(1,:)=th_ring{n};
    end
    for n=46:48
        th_ring{n}=circshift(th_ring{n},[0,V(11)]);
        ring{n}(1,:)=th_ring{n};
    end
    for n=49:50
        th_ring{n}=circshift(th_ring{n},[0,V(12)]);
        ring{n}(1,:)=th_ring{n};
    end


  
 
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