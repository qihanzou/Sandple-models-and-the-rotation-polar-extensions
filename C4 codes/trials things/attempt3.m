N=99;
M=99;
dec = -4;
T = ones((N-1)/2,(M-1)/2);
T_ll=dec*tril(T);
T_lr=rot90(T_ll);
T_ur=rot90(T_lr);
T_ul=rot90(T_ur);
L1=zeros((N-1)/2,1);
L2=zeros(1,N);
cancel_matrix = [T_ul L1 T_ur;L2;T_ll L1 T_lr];



[x_coord_all,y_coord_all] = find(sand_pile>=0);
number_all = length(x_coord_all);

while number_all > 0
        for k = 1: number_all
              if x_coord_all(k) < ceil((N-1)/2) && y_coord_all(k)>=ceil((M-1)/2)
                 sand_pile(x_coord_all(k)+1,y_coord_all(k)+1)=sand_pile(x_coord_all(k),y_coord_all(k));
              end
              if x_coord_all(k) >= ceil((N-1)/2) && y_coord_all(k)>ceil((M-1)/2)
                 sand_pile(x_coord_all(k)+1,y_coord_all(k)-1)=sand_pile(x_coord_all(k),y_coord_all(k));
              end
              if x_coord_all(k) > ceil((N-1)/2) && y_coord_all(k)<=ceil((M-1)/2)
                 sand_pile(x_coord_all(k)-1,y_coord_all(k)-1)=sand_pile(x_coord_all(k),y_coord_all(k));
              end
              if x_coord_all(k) <= ceil((N-1)/2) && y_coord_all(k)<ceil((M-1)/2)
                 sand_pile(x_coord_all(k)-1,y_coord_all(k)+1)=sand_pile(x_coord_all(k),y_coord_all(k));
              end
        end
end


