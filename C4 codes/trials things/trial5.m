% Define your scalar values
r1 = 3; % Replace with your actual value
theta1 = 0.5; % Replace with your actual value

% Define your vector values for r2 and theta2
r2 = [4, 5, 6]; % Replace with your actual values
theta2 = [0.3, 0.4, 0.2]; % Replace with your actual values

% Calculate the result element-wise
result = r1^2 + r2.^2 - 2 * r1 * r2 .* cos(theta1 - theta2);

% Display the result
disp(result);

            r1 = gpuArray(theta_top_now);
            theta1 = gpuArray(radius_top_now);
            theta2 = gpuArray(sand_pile(1,:));
            r2 = gpuArray(sand_pile(2,:)); 
            d_square = r1^2 + r2.^2 - 2 * r1 * r2 .* cos(theta1 - theta2);
            [position_formation]=find(d_square< 1.1);
            sand_pile(3,position_formation) = sand_pile(3,position_formation) + 1;

            