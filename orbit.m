function orb = orbit(radius, inclination)
% Autor: Anton Yushkevich
% Funkcja pomocnicza dla animacji (rysuje orbitê)
% Argumenty wejœciowe:
% radius - promieñ orbity
% inclination - nachylenie orbity

minangle = pi/180;
x = radius*cos(0:minangle:2*pi);
y = radius*sin(0:minangle:2*pi);
z = radius*sin(inclination*pi/180)*cos(0:minangle:2*pi);
orb = plot3(x, y, z);

end % function