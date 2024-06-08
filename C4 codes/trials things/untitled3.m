            theta_top_now  = sand_pile(1,I(q)+1);
            radius_top_now = sand_pile(2,I(q)+1);
            radius1 = gpuArray(radius_top_now);
            theta1  = gpuArray(rad2deg(theta_top_now));
            radius2 = gpuArray(sand_pile(2,:));
            theta2  = gpuArray(rad2deg(sand_pile(1,:)));            
            radius1_square=radius1^2;
            radius1_new = ones(1,length(radius2))*radius1_square;
            d_square_gpu = radius1_new + radius2.^2 - (2 * radius1 * radius2 .* cos(theta1 - theta2));
            d = d_square_gpu;          
            [B,I] = mink(d,4);
            [active_position] = find(active_matrix(3,:) == 0);            
            for v=2:length(I)
                if ismember(I(v),active_position)==1
                    active_or_not2 = rand;
                    active_or_not3 = rand;
                    if active_or_not2 <= p_st && sand_pile(2,I(v)) ~= radius_top_now
                       sand_pile(3,I(v)) = sand_pile(3,I(v)) + add_number_induce;
                       active_matrix(3,I(v)) = active_matrix(3,I(v)) + regeneration_time_2;
                       life_time(3,I(v)) = life_time(3,I(v)) + lifetime2;
                    elseif active_or_not3 <= p_st_c && sand_pile(2,I(v)) == radius_top_now
                       sand_pile(3,I(v)) = sand_pile(3,I(v)) + add_number_induce;
                       active_matrix(3,I(v)) = active_matrix(3,I(v)) + regeneration_time_2 + 1;
                       life_time(3,I(v)) = life_time(3,I(v)) + lifetime2;
                    end
                end
            end    