function [points_in_circle, points_in_square] = mcc_pi(num_points)

    x = rand(1, num_points);
    y = rand(1, num_points);

    
    r = sqrt(x.^2 + y.^2);
    inside_circle = r <= 1;

    
    points_in_circle = [x(inside_circle); y(inside_circle)];
    points_in_square = [x; y];

end