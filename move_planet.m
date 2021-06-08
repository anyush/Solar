function [x, y, z, angle] = move_planet(radius, orbital_radius, ...
    inclination, angular_vel, angle)
% Autor: Anton Yushkevich
% Funkcja pomocnicza dla animacji (wylicza nast�pn� pozycj� planety)
% Argumenty wej�ciowe:
% radius - promie� planety
% orbital_radius - promie� orbity planety
% inclination - nachylenie orbity
% angular_vel - pr�dko�� k�towa
% angle - aktualny k�t wzgl�dem miejsca pocz�tku animacji

angle = angle + angular_vel;
if angle > 2*pi
    angle = angle - 2*pi;
end

[x, y, z] = sphere;
x = x*radius + orbital_radius*cos(angle);
y = y*radius + orbital_radius*sin(angle);
z = z*radius + orbital_radius*sin(inclination*pi/180)*cos(angle);

end % function