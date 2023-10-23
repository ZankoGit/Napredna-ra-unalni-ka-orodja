function calc_pi()

stevilo_tock = 100:100:10000;
pi_priblizek = zeros(1, length(stevilo_tock));
napaka = zeros(1, length(stevilo_tock));

% y-koordinate na loku krožnice
y_circ = @(x, r) sqrt(r^2 - x.^2);
r=1;
for i = 1:length(stevilo_tock)
    [points_in_circle, points_in_square] = mcc_pi(stevilo_tock(i));
    
    % Izračun π in napaka
    pi_priblizek(i) = area_pi(points_in_circle, points_in_square);
    napaka(i) = abs(pi_priblizek(i) - pi);
    
    fprintf('Število točk: %d, Ocena za π: %.6f, Napaka: %.6f\n', stevilo_tock(i), pi_priblizek(i), napaka(i));
    
    
    if stevilo_tock(i) == 5000
        % Preveri, ali so točke znotraj loka krožnice
        y_values = y_circ(points_in_square(1, :), 1);
        inside_circle = abs(points_in_square(2, :)) <= abs(y_values);
        
        % Izris točk znotraj in zunaj kroga ter loka krožnice
        figure;
        plot(points_in_square(1, inside_circle), points_in_square(2, inside_circle), 'ro', 'MarkerSize', 6);
        hold on;
        plot(points_in_square(1, ~inside_circle), points_in_square(2, ~inside_circle), 'b*', 'MarkerSize', 6);
        
        % Risanje loka krožnice
        r = 1;
        x = linspace(-r, r, 1000); % Interval x od -r do r
        y_positive = y_circ(x, r); % Pozitivna y vrednost krožnice
        y_negative = -y_circ(x, r); % Negativna y vrednost krožnice

        plot(x, y_positive, 'k', 'LineWidth', 2); % Del krožnice z y > 0
        plot(x, y_negative, 'k', 'LineWidth', 2); % Del krožnice z y < 0
        
        axis equal;
        ...................
        hold off;
    end
end

% Izris rezultatov
figure;
plot(stevilo_tock, napaka, '-o');
xlabel('Število naključnih točk');
ylabel('Napaka od π');
title('Približevanje vrednosti π z Monte Carlo metodo');
grid on;

end

function estimated_pi = area_pi(points_in_circle, points_in_square)
    ratio = size(points_in_circle, 2) / size(points_in_square, 2);
    estimated_pi = ratio * 4; % Ker je razmerje ploščin kroga in kvadrata π/4
end