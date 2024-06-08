clc;clear;
number_sand = 100000;
N=200;% table length
M=200;% table width
sand_pile = zeros(N,M);

interval=1000; % every 1000 sand drops polt a graph.
frames(number_sand/interval)=struct('cdata',[],'colormap',[]);
b=1; %index of images


for i=1:number_sand 
    sand_pile(ceil(N/2),ceil(M/2)) = sand_pile(ceil(N/2),ceil(M/2)) +1;
    [x_coord_tops,y_coord_tops] = find(sand_pile>3);
    number_top = length(x_coord_tops);
    while number_top > 0
        for j = 1: number_top
            if x_coord_tops(j)==1 || y_coord_tops(j)==1 || x_coord_tops(j)==N || y_coord_tops(j)==M           
            sand_pile(x_coord_tops(j),y_coord_tops(j))=sand_pile(x_coord_tops(j),y_coord_tops(j))-4;
                if x_coord_tops(j)+1 <= N
            sand_pile(x_coord_tops(j)+1,y_coord_tops(j))=sand_pile(x_coord_tops(j)+1,y_coord_tops(j))+1;
                end
                if x_coord_tops(j)-1 >= 1
            sand_pile(x_coord_tops(j)-1,y_coord_tops(j))=sand_pile(x_coord_tops(j)-1,y_coord_tops(j))+1;
                end
                if y_coord_tops(j)+1 <= M
            sand_pile(x_coord_tops(j),y_coord_tops(j)+1)=sand_pile(x_coord_tops(j),y_coord_tops(j)+1)+1;
                end
                if y_coord_tops(j)-1 >= 1
            sand_pile(x_coord_tops(j),y_coord_tops(j)-1)=sand_pile(x_coord_tops(j),y_coord_tops(j)-1)+1;
                end
            else
            sand_pile(x_coord_tops(j),y_coord_tops(j))=sand_pile(x_coord_tops(j),y_coord_tops(j))-4;
            sand_pile(x_coord_tops(j)+1,y_coord_tops(j))=sand_pile(x_coord_tops(j)+1,y_coord_tops(j))+1;
            sand_pile(x_coord_tops(j)-1,y_coord_tops(j))=sand_pile(x_coord_tops(j)-1,y_coord_tops(j))+1;
            sand_pile(x_coord_tops(j),y_coord_tops(j)+1)=sand_pile(x_coord_tops(j),y_coord_tops(j)+1)+1;
            sand_pile(x_coord_tops(j),y_coord_tops(j)-1)=sand_pile(x_coord_tops(j),y_coord_tops(j)-1)+1;
            end
        end
        [x_coord_tops,y_coord_tops] = find(sand_pile>3);
        number_top = length(x_coord_tops);
    end
    
    if mod(i,interval)==0 %for each time statisfy the interval,draw graph.
        image(sand_pile,'CDataMapping','scaled')
        colorbar
        graphsetting([0.2 0.1 0.6 0.8]); %percentage of the graph size corresponding to computer screen.
        str=['number of sand: ',sprintf('%d',i)];
        set(text(0,0,str),'interpreter','latex','HorizontalAlignment','left');    
        drawnow;
        frames(b) = getframe(gcf);
        b=b+1;
    end

end

Video = VideoWriter('middle','MPEG-4');
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
