clear all
close all
clc
E_f = 62;
E_m = 3.03;
rho_f = 1400;
rho_m = 1150;
v_f = 0:0.01:1;
v_m = 1-v_f;
eta=2;
sigma_fu = 2758;
sigma_mu = 46.5;
zeta=0.866;
G_m = 2.09;
eta_1 = 1;
zeta_1 = 0.91;
V_f = 0.44;
V_m = 0.35;
sigma_fcy= 3858;
sigma_mcy = 75.84;
%Density of composite
rho_c = (v_f*rho_f)+(v_m*rho_m);
%Youngs modulus of composite
%gpa
E_c = ((E_m*v_f.*((E_f/E_m) - 1))+1);
%Transverse modulus using Halpin-Tsai relation of composite
%in gpa
E_ct = (((1+(eta*zeta.*v_f))./(1-(zeta.*v_f)))).*E_m;
%Calculation of transverse tensile strength of composite
%in mpa
a = 1-(E_m/E_f);
scf = (1-(v_f.*a))./(1-(sqrt(v_f.*4./3.14).*a));
sigma_tu = sigma_mu./scf;
%Calculation of shear modulus using Halpin-Tsai model for 
composite in gpa
G_c = ((1+ eta_1.*v_f)./(1- zeta_1.*v_f)).*G_m;
%Tensile yield strenght of composite. 
%in mpa
sigma_cu=(sigma_fu.*v_f)+(sigma_mu.*v_m);
%poisson’s ratio of composite
V_c = (v_f.*V_f)+(v_m.*V_m);
%Compressive yield strength
sigma_cy=(sigma_fcy.*v_f)+(sigma_mcy.*v_m);
%Calculation of transverse compresive strength of composite
sigma_ctu = sigma_cy./scf;
 
subplot(4,4,1),plot(v_f,G_c)
xlabel('volume fraction')
ylabel('shear modulus')
subplot(4,4,2),plot(v_f,E_ct)
ylabel('transverse modulus')
xlabel('volume fraction')
subplot(4,4,3),plot(v_f,E_c)
xlabel('volume fraction')
ylabel('longitudinal modulus')
subplot(4,4,4),plot(v_f,rho_c)
xlabel('volume fraction')
ylabel('density')
subplot(4,4,5),plot(v_f,sigma_cu)
xlabel('volume fraction')
ylabel('ultimate strength')
subplot(4,4,6),plot(v_f,sigma_tu)
xlabel('volume fraction')
ylabel('transverse strength')
subplot(4,4,7),plot(v_f,V_c)
xlabel('volume fraction')
ylabel('poissions ratio')
subplot(4,4,8),plot(v_f,sigma_cy)
xlabel('volume fraction')
ylabel('compressive yield')
subplot(4,4,9),plot(v_f,sigma_ctu)
xlabel('volume fraction')
ylabel('CTYS')
