clc;clear;close all;
% Parameters
L = 50;              % Grid size (LxL)
n_iterations = 1000; % Number of iterations

% Initialize grid with all zeros
grid = zeros(L);

% Function to check if a cell is unstable
is_unstable = @(x, y) grid(x, y) >= 4;

% Directions for rotation (right, down, left, up)
dx = [0, 1, 0, -1];
dy = [1, 0, -1, 0];

% Perform the rotational sandpile dynamics
for iteration = 1:n_iterations
    % Select a random site
    x = randi(L);
    y = randi(L);
    
    % Topple the site if it's unstable
    while is_unstable(x, y)
        grid(x, y) = grid(x, y) - 4;
        
        % Rotate the grains to neighboring sites
        for dir = 1:4
            nx = x + dx(dir);
            ny = y + dy(dir);
            
            if nx >= 1 && nx <= L && ny >= 1 && ny <= L
                grid(nx, ny) = grid(nx, ny) + 1;
            end
        end
    end
end

% Visualization (you can use any method you prefer)
imagesc(grid);
colormap('hot');
colorbar;
title('Rotational Sandpile Model');
This code should correctly implement the rotational aspect of the Rotational Sandpile Model by rotating grains to neighboring sites in a clockwise direction when a site becomes unstable.





