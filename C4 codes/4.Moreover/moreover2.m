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

number_sand = 100;
p_sp=0.002;
p_st=0.28;
regeneration_time = 11; 




for i=1:number_sand


    for n=1:50
        [in_active_position] = find(ring{n}(3,:) > 0);
        for g=1:length(in_active_position)
            ring{n}(3,in_active_position(g)) = ring{n}(3,in_active_position(g)) - 1; 
        end
    end

    for n=1:50
        [active_position] = find(ring{n}(3,:) <= 0);
        for b=1:length(active_position)
            active_or_not_for_this_site = rand;
            if active_or_not_for_this_site <= p_sp
               ring{n}(5,active_position(b)) = ring{n}(5,active_position(b)) + 1;
               ring{n}(3,active_position(b)) = ring{n}(3,active_position(b)) + regeneration_time;
               
            end
        end
    end
    
    for n=1:50
        sand_pile_zero{1,n}=ring{n};
    end
    pause(1)
    sand_pile=[sand_pile_zero{:}];
    [exist_position]=find(sand_pile(5,:) > 0);
    polarscatter(sand_pile(1,exist_position),sand_pile(2,exist_position),"pentagram","filled");
    colormap(flipud(gray))
    axis off
    rlim([0 55])
    hold on

    for n=1:50
        [position_tops] = find(ring{n}(5,:) > 0);
        for j=1:length(position_tops)
            ring{n}(5,position_tops(j)) = 0;
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
                   active_or_not_here = rand;
                      if active_or_not_here <= p_st 
                         ring{n}(5,I(q)) = ring{n}(5,I(q)) + 1;
                         ring{n}(3,I(q)) = ring{n}(3,I(q)) + regeneration_time;
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
                   active_or_not_here = rand;
                      if active_or_not_here <= p_st 
                         ring{n}(5,I(q)) = ring{n}(5,I(q)) + 1;
                         ring{n}(3,I(q)) = ring{n}(3,I(q)) + regeneration_time;
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
                   active_or_not_here = rand;
                      if active_or_not_here <= p_st 
                         ring{n}(5,I(q)) = ring{n}(5,I(q)) + 1;
                         ring{n}(3,I(q)) = ring{n}(3,I(q)) + regeneration_time;
                       end
                    end
                end 
            end    
        end
    end
    
    for n=1:50
        sand_pile_one{1,n}=ring{n};
    end
    pause(1)
    sand_pile=[sand_pile_one{:}];
    [exist_position]=find(sand_pile(5,:) > 0);
    polarscatter(sand_pile(1,exist_position),sand_pile(2,exist_position),"pentagram","filled");
    colormap(flipud(gray))
    axis off
    rlim([0 55])
    hold off

    V=[1 2 3 4 5];


    for n=1:10
        th_ring{n}=circshift(th_ring{n},[0,V(1)]);
    end
    for n=11:20
        th_ring{n}=circshift(th_ring{n},[0,V(2)]);
    end
    for n=21:30
        th_ring{n}=circshift(th_ring{n},[0,V(3)]);
    end
    for n=31:40
        th_ring{n}=circshift(th_ring{n},[0,V(4)]);
    end
    for n=41:50
        th_ring{n}=circshift(th_ring{n},[0,V(5)]);
    end
  
    


end



