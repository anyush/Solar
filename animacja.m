function animacja(YPS)
% Autor: Anton Yushkevich
% Animacja uk³adu s³oniecznego z zachowaniem proporcji rozmiarów ...
% planet, odleg³oœci pomiêdzy nimi i szybkoœci ich obrotów wokó³ ...
% s³oñca.
% Argumenty wejœciowe:
% YPS (years_per_second) - wspó³czynnik szybkoœci ruchu planet ...
% (domyœlnie: 3)
% W folderze z funkcj¹ musz¹ siê znajdowaæ:
% 1) Plik bg.jpg - t³o
% 2) Funkcje pomocnicze:
%       move_planet
%       orbit

% Ustawienie domyœlnej wartoœci dla argumentu
if nargin < 1 || isempty(YPS)
    YPS = 3;
end

f = figure;
time = 0.01; % Czas pauzy
orb_color = [0, 0, 0.5];
% T³o
A = imread("bg.jpg");
ax = axes(f);
ax.set("Position", [0, 0, 1, 1], "Visible", "off");
h = image(A);
set(h.Parent,'visible','off');

% Generowanie przestrzeni odpowiedniej wielkoœci
ax = axes(f);
% Ten wykres jest potrzebny jedynie dla stworzenia przestrzeni 3D
plot3(ax, [-5500, 5500], [-5500, 5500], [-5500, -5500; 5500, 5500], ...
    "Visible", "off");
xlim([-5500, 5500]);
ylim([-5500, 5500]);
zlim([-5500, 5500]);
f.set("Color", [0, 0, 0], "menubar", "none", "toolbar", "none", "name", ...
    "Solar System");
ax.set("Visible", "off");
enableDefaultInteractivity(ax);
hold on;

% Tabeli wszystkich sta³ych dla ka¿dej z planet + s³oñca
% [promieñ, odleg³oœæ od powierzchni s³oñca, prêdkoœæ k¹towa, ...
%  nachylenie orbity(deg), kolor(R), kolor(G), kolor(B)]
sun_t = [690, 0, 0, 1, 1, 0.07];
mercury_t = [2.5, 57, -2*pi*YPS*time/0.24, 7, 0.75, 0.75, 0.75];
venus_t = [6, 108, 2*pi*YPS*time/0.62, 3.39, 0.76, 0.65, 0.285];
earth_t = [6, 149, -2*pi*YPS*time, 0, 0, 0, 1];
mars_t = [3.5, 228, -2*pi*YPS*time/1.9, 1.85, 1, 0, 0];
jupiter_t = [71.3, 778.5, -2*pi*YPS*time/11.9, 1.31, 0.9, 0.73, 0.164];
saturn_t = [60.1, 1400, -2*pi*YPS*time/29.5, 2.48, 0.785, 0.57, 0.285];
uranus_t = [26.5, 2800, -2*pi*YPS*time/84, 0.76, 0.285, 0.777, 0.785];
neptune_t = [25, 4500, -2*pi*YPS*time/165, 1.77, 0.285, 0.48, 0.785];

% Generowanie s³oñca i planet
[x, y, z] = sphere();
% sun - s³oñce, sun1 - "korona" s³oñca, odleg³oœæ od s³oñca liczy siê ...
% jako odleg³oœæ od tej "korony" (sun_t tak naprawdê tabela sta³ych ...
% "korony", nie samego s³oñca 
sun = surf(x*600, y*600, z*600, "FaceColor", [1, 0.41, 0.16], ...
    "FaceAlpha", 0.7, "EdgeColor", [1, 0.6, 0.1]);
sun1 = surf(x*sun_t(1), y*sun_t(1), z*sun_t(1), ...
    "FaceColor", sun_t(4:6), "FaceAlpha", 0.7, "EdgeAlpha", 0.05);
sun.DataTipTemplate.DataTipRows = dataTipTextRow("Sun", "");
sun1.DataTipTemplate.DataTipRows = dataTipTextRow("Sun", "");

mercury = surf((x*mercury_t(1))+sun_t(1)+mercury_t(2), ...
    y*mercury_t(1), z*mercury_t(1));
mercury.set("FaceColor", mercury_t(5:7), "EdgeColor", mercury_t(5:7));
mercury_angle = 0;
mercury_speed = mercury_t(3);
mercury_orb = orbit(sun_t(1)+mercury_t(2), mercury_t(4));
mercury_orb.set("Color", orb_color);
mercury_orb.DataTipTemplate.DataTipRows = ...
    dataTipTextRow("Mercury Orbit", "");
mercury.DataTipTemplate.DataTipRows = dataTipTextRow("Mercury", "");

venus = surf((x*venus_t(1))+sun_t(1)+venus_t(2), y*venus_t(1), ...
    z*venus_t(1));
venus.set("FaceColor", venus_t(5:7), "EdgeColor", venus_t(5:7));
venus_angle = 0;
venus_speed = venus_t(3);
venus_orb = orbit(sun_t(1)+venus_t(2), venus_t(4));
venus_orb.set("Color", orb_color);
venus_orb.DataTipTemplate.DataTipRows = ...
    dataTipTextRow("Venus Orbit", "");
venus.DataTipTemplate.DataTipRows = dataTipTextRow("Venus", "");

earth = surf((x*earth_t(1))+sun_t(1)+earth_t(2), y*earth_t(1), ...
    z*earth_t(1));
earth.set("FaceColor", earth_t(5:7), "EdgeColor", earth_t(5:7));
earth_angle = 0;
earth_speed = earth_t(3);
earth_orb = orbit(sun_t(1)+earth_t(2), earth_t(4));
earth_orb.set("Color", orb_color);
earth_orb.DataTipTemplate.DataTipRows = ...
    dataTipTextRow("Earth Orbit", "");
earth.DataTipTemplate.DataTipRows = dataTipTextRow("Earth", "");

mars = surf((x*mars_t(1))+sun_t(1)+mars_t(2), y*mars_t(1), ...
    z*mars_t(1));
mars.set("FaceColor", mars_t(5:7), "EdgeColor", mars_t(5:7));
mars_angle = 0;
mars_speed = mars_t(3);
mars_orb = orbit(sun_t(1)+mars_t(2), mars_t(4));
mars_orb.set("Color", orb_color);
mars_orb.DataTipTemplate.DataTipRows = ...
    dataTipTextRow("Mars Orbit", "");
mars.DataTipTemplate.DataTipRows = dataTipTextRow("Mars", "");

jupiter = surf((x*jupiter_t(1))+sun_t(1)+jupiter_t(2), y*jupiter_t(1), ...
    z*jupiter_t(1));
jupiter.set("FaceColor", jupiter_t(5:7), "EdgeColor", jupiter_t(5:7));
jupiter_angle = 0;
jupiter_speed = jupiter_t(3);
jupiter_orb = orbit(sun_t(1)+jupiter_t(2), jupiter_t(4));
jupiter_orb.set("Color", orb_color);
jupiter_orb.DataTipTemplate.DataTipRows = ...
    dataTipTextRow("Jupiter Orbit", "");
jupiter.DataTipTemplate.DataTipRows = dataTipTextRow("Jupiter", "");

saturn = surf((x*saturn_t(1))+sun_t(1)+saturn_t(2), y*saturn_t(1), ...
    z*saturn_t(1));
saturn.set("FaceColor", saturn_t(5:7), "EdgeColor", saturn_t(5:7));
saturn_angle = 0;
saturn_speed = saturn_t(3);
saturn_orb = orbit(sun_t(1)+saturn_t(2), saturn_t(4));
saturn_orb.set("Color", orb_color);
saturn_orb.DataTipTemplate.DataTipRows = ...
    dataTipTextRow("Saturn Orbit", "");
saturn.DataTipTemplate.DataTipRows = dataTipTextRow("Saturn", "");

uranus = surf((x*uranus_t(1))+sun_t(1)+uranus_t(2), y*uranus_t(1), ...
    z*uranus_t(1));
uranus.set("FaceColor", uranus_t(5:7), "EdgeColor", uranus_t(5:7));
uranus_angle = 0;
uranus_speed = uranus_t(3);
uranus_orb = orbit(sun_t(1)+uranus_t(2), uranus_t(4));
uranus_orb.set("Color", orb_color);
uranus_orb.DataTipTemplate.DataTipRows = ...
    dataTipTextRow("Uranus Orbit", "");
uranus.DataTipTemplate.DataTipRows = dataTipTextRow("Uranus", "");

neptune = surf((x*neptune_t(1))+sun_t(1)+neptune_t(2), y*neptune_t(1), ...
    z*neptune_t(1));
neptune.set("FaceColor", neptune_t(5:7), "EdgeColor", neptune_t(5:7));
neptune_angle = 0;
neptune_speed = neptune_t(3);
neptune_orb = orbit(sun_t(1)+neptune_t(2), neptune_t(4));
neptune_orb.set("Color", orb_color);
neptune_orb.DataTipTemplate.DataTipRows = ...
    dataTipTextRow("Neptune Orbit", "");
neptune.DataTipTemplate.DataTipRows = dataTipTextRow("Neptune", "");

while ishandle(f) == 1
    [x, y, z, mercury_angle] = move_planet(mercury_t(1), ...
        sun_t(1)+mercury_t(2), mercury_t(4), mercury_speed, mercury_angle);
    mercury.set("XData", x, "YData", y, "ZData", z);
    
    [x, y, z, venus_angle] = move_planet(venus_t(1), ...
        sun_t(1)+venus_t(2), venus_t(4), venus_speed,venus_angle);
    venus.set("XData", x, "YData", y, "ZData", z);
    
    [x, y, z, earth_angle] = move_planet(earth_t(1), ...
        sun_t(1)+earth_t(2), earth_t(4), earth_speed, earth_angle);
    earth.set("XData", x, "YData", y, "ZData", z);
    
    [x, y, z, mars_angle] = move_planet(mars_t(1), ...
        sun_t(1)+mars_t(2), mars_t(4), mars_speed, mars_angle);
    mars.set("XData", x, "YData", y, "ZData", z);
    
    [x, y, z, jupiter_angle] = move_planet(jupiter_t(1), ...
        sun_t(1)+jupiter_t(2), jupiter_t(4), jupiter_speed, jupiter_angle);
    jupiter.set("XData", x, "YData", y, "ZData", z);

    [x, y, z, saturn_angle] = move_planet(saturn_t(1), ...
        sun_t(1)+saturn_t(2), saturn_t(4), saturn_speed, saturn_angle);
    saturn.set("XData", x, "YData", y, "ZData", z);
    
    [x, y, z, uranus_angle] = move_planet(uranus_t(1), ...
        sun_t(1)+uranus_t(2), uranus_t(4), uranus_speed, uranus_angle);
    uranus.set("XData", x, "YData", y, "ZData", z);
    
    [x, y, z, neptune_angle] = move_planet(neptune_t(1), ...
        sun_t(1)+neptune_t(2), neptune_t(4), neptune_speed, neptune_angle);
    neptune.set("XData", x, "YData", y, "ZData", z);
    
    drawnow;
    pause(time);
end

end % function