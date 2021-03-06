function f = dispersion(kz)

w = 2*pi*.5e12;
e_0 = 8.85e-12;
c = 3e8;
e = 1.60218e-19; 
m_e = 9.109e-31; % Electron mass

k0 = w/c;
% Material properties
Ns = 1.4e11 *1e4;
e_d = 12.8;
ms = .067*m_e; % Effective mass


% layer thicknesses
d = 400e-9;


kxd = sqrt(k0^2*e_d - kz.^2);
kxa = sqrt(k0^2 - kz.^2);

Gamma = -1i*e*Ns*kxd*d/(2*ms*e_0*e_d)/w^2;
zeta = kxd*d./(kxa*e_d);

f = (1 - Gamma).*(1 + zeta).*exp(-1i*kxd*d) ...
     - Gamma.*(1 - zeta).*exp(1i*kxd*d);
