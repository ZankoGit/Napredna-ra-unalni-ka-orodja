function risi_kroznico_in_tocke_nedasemi()
    stTock = 10000;
    r = 1;
    [ocenjenoPi, napaka] = area_pi(stTock, r);
    disp(['Ocenjeno π: ', num2str(ocenjenoPi)]);
    disp(['Napaka: ', num2str(napaka)]);
    risi_kroznico_in_tocke(stTock, r);
end

function [ocenjenoPi, napaka] = area_pi(stTock, r)
    znotrajKroga = 0;
    for i = 1:stTock
        x = 2 * rand() - 1;
        y = 2 * rand() - 1;
        if x^2 + y^2 <= r^2
            znotrajKroga = znotrajKroga + 1;
        end
    end
    ocenjenoPi = 4 * znotrajKroga / stTock;
    napaka = abs(ocenjenoPi - pi);
end

function risi_kroznico_in_tocke(stTock, r)
    x = 2 * rand(stTock, 1) - 1;
    y = 2 * rand(stTock, 1) - 1;
    razdalja = sqrt(x.^2 + y.^2);
    tockeZnotraj = razdalja <= r;
    tockeZunaj = razdalja > r;
    scatter(x(tockeZnotraj), y(tockeZnotraj), 50, 'b', 'filled');
    hold on;
    scatter(x(tockeZunaj), y(tockeZunaj), 50, 'r', 'x');
    izrisi_kroznico(r);
    axis equal;
end

function izrisi_kroznico(r)
    theta = linspace(0, 2 * pi, 1000);
    x = r * cos(theta);
    y = r * sin(theta);
    plot(x, y, 'g', 'LineWidth', 2);
end
