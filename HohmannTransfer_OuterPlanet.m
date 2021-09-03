clear, clc, close all

%radii of planets
orbit = 200;
R_earth = 6378;
R_outer = 3379;

%radii of orbit
r_earth = 149600000;
r_outer = 227944173.6;

%gravitational parameters
m_sun = 132715000000;
m_earth = 398601;
m_outer = 43058;

%calculate useful values
a_t = 0.5*(r_earth + r_outer);
e_t = -m_sun / (2*a_t);

%Calaculate TOF and convert to days
TOF = pi()*sqrt(a_t^3 / (m_sun));
TOF_days = TOF/86400;

%Perihelion Velocity
v1 = sqrt(2*((m_sun / r_earth) + e_t));
%Velocity of earth
v_earth = sqrt(m_sun / r_earth);
%Hyperbolic escape velocity
v_escape = v1 - v_earth;
%deltaV req @ perigee
r1 = R_earth + orbit;
r2 = r_outer - r_earth;
et = -m_earth / (r1 + r2);
vp_earth = sqrt(2*((m_earth / r1) + et));
vc_earth = sqrt(m_earth / (R_earth + orbit));
dV_earth = vp_earth - vc_earth;
%Aphelion velocity
v2 = sqrt(2*((m_sun / r_outer) + e_t));
%Outer planet velocity
v_outer = sqrt(m_sun / r_outer);
%Hyberbolic Approach velocity
v_approach = v_outer - v2;
%deltaV for soft landing
dV_outer = 5.7;
%Total deltaV
dV_total = dV_earth + dV_outer;


%test


%Print output
fprintf('TOF = %d days \n',TOF_days)
fprintf('V_1 (perihelion velocity) = %d km/s \n',v1)
fprintf('V_earth = %d km/s \n',v_earth)
fprintf('Hyperbolic escape velocity = %d km/s \n',v_escape)
fprintf('V_p (earth) = %d km/s \n',vp_earth)
fprintf('V_c (earth) = %d km/s \n',vc_earth)
fprintf('deltaV required at perigee = %d km/s \n',dV_earth)
fprintf('V_2 (aphelion velocity) = %d km/s \n',v2)
fprintf('V_outer = %d km/s \n',v_outer)
fprintf('Hyperbolic approach velocity = %d km/s \n',v_approach)
fprintf('deltaV for soft landing = %d km/s \n',dV_outer)
