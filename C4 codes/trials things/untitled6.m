clc;clear;close all;
number_sand = 300000; 
N=50;% table length
M=50;% table width
sand_pile = zeros(N,M);
avalanche_count = 0;
Mean_matrix = zeros(number_sand,1);

avalanche_matrix = zeros(10000,1); % create a empty matrix
avalanche_matrix = gpuArray(avalanche_matrix);
loss_matrix = zeros(10000000,1); % create a empty matrix for amount of loss in the model.
loss_matrix = gpuArray(loss_matrix);
area_matrix = zeros(10000000,1);
area_matrix = gpuArray(area_matrix);

loss_record = 0;
area_record = 0;
area_record = gpuArray(area_record);

interval=1; % every 1000 sand drops polt a graph.
frames(number_sand/interval)=struct('cdata',[],'colormap',[]);
bi=1; %index of images

for i=1:number_sand 
    x_coord_now = round(1+rand(1,1)*(N-1));
    y_ccord_now = round(1+rand(1,1)*(M-1));
    sand_pile(x_coord_now,y_ccord_now) = sand_pile(x_coord_now,y_ccord_now) + 1;
    [x_coord_tops,y_coord_tops] = find(sand_pile==1);
    number_top = length(x_coord_tops);
    
    avalanche_matrix(i,1) = number_top;
    
    while number_top > 0
        for j = 1: number_top
            if x_coord_tops(j)==1 || y_coord_tops(j)==1 || x_coord_tops(j)==N || y_coord_tops(j)==M   % or        
            sand_pile(x_coord_tops(j),y_coord_tops(j))=sand_pile(x_coord_tops(j),y_coord_tops(j))-1;
            avalanche_count = avalanche_count + 1;
                if x_coord_tops(j)+1 <= N
            sand_pile(x_coord_tops(j)+1,y_coord_tops(j))=sand_pile(x_coord_tops(j)+1,y_coord_tops(j))+1;
            %area_record = area_record +1;
                end
                if x_coord_tops(j)-1 >= 1
            sand_pile(x_coord_tops(j)-1,y_coord_tops(j))=sand_pile(x_coord_tops(j)-1,y_coord_tops(j))+1;
            %area_record = area_record +1;
                end
                if y_coord_tops(j)+1 <= M
            sand_pile(x_coord_tops(j),y_coord_tops(j)+1)=sand_pile(x_coord_tops(j),y_coord_tops(j)+1)+1;
            %area_record = area_record +1;
                end
                if y_coord_tops(j)-1 >= 1
            sand_pile(x_coord_tops(j),y_coord_tops(j)-1)=sand_pile(x_coord_tops(j),y_coord_tops(j)-1)+1;
            %area_record = area_record +1;
                end
            else
            sand_pile(x_coord_tops(j),y_coord_tops(j))=sand_pile(x_coord_tops(j),y_coord_tops(j))-1;
            sand_pile(x_coord_tops(j)+1,y_coord_tops(j))=sand_pile(x_coord_tops(j)+1,y_coord_tops(j))+1;
            sand_pile(x_coord_tops(j)-1,y_coord_tops(j))=sand_pile(x_coord_tops(j)-1,y_coord_tops(j))+1;
            sand_pile(x_coord_tops(j),y_coord_tops(j)+1)=sand_pile(x_coord_tops(j),y_coord_tops(j)+1)+1;
            sand_pile(x_coord_tops(j),y_coord_tops(j)-1)=sand_pile(x_coord_tops(j),y_coord_tops(j)-1)+1;
            area_record = area_record +4;
            end

            
        end
        [x_coord_tops,y_coord_tops] = find(sand_pile==1);
        number_top = length(x_coord_tops);
        % need to record size here.
         avalanche_matrix(i,1) = avalanche_matrix(i,1) + number_top;
         
    end
Mean_matrix(i,1) = mean(sand_pile,"all");
loss_matrix(i) = loss_matrix(i) + loss_record;
loss_record = 0;
area_matrix(i) = area_matrix(i) + area_record;
area_record = 0;

    if mod(i,interval)==0 %for each time statisfy the interval,draw graph.
        image(sand_pile,'CDataMapping','scaled')
        colorbar
        graphsetting([0.2 0.1 0.6 0.8]); %percentage of the graph size corresponding to computer screen.
        str=['number of sand: ',sprintf('%d',i)];
        set(text(0,0,str),'interpreter','latex','HorizontalAlignment','left');    
        drawnow;
        frames(bi) = getframe(gcf);
        bi=bi+1;
    end

end



% create video
Video = VideoWriter('random added sandpile','MPEG-4');
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





