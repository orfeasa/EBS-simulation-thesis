%% Constants
global r_e; % electron radius
r_e = 2.8179403267e-15; % in m
global c;   % speed of light
c = 299792458; % in m/s
global e;   % electron charge
e = 1.602176565e-19;
global E_0;
E_0 = 0.510998910e+6; %in eV
global q_e;
q_e = 1.602176565e-19; %in Coulomb

%% Initial Variables
% accelerated voltage
V = 20e3; %volts

% offset in Y axis (?) 
rho = 0.1; % in m

% bunch length
sigma_s = 4e-3; % in m

% beta: relative velocity of the testing beam, beta = v_t / c
gamma = 1 + V / E_0;
beta = sqrt(1 - 1 / (gamma * gamma));

% charge per pulse
Q_i = 590e-6; % in Coulomb

% bunches per pulse
N_b = 70128;

% electrons per bunch
N_e = Q_i / (N_b * q_e);

% n(z): relativistic bunch linear density along Z
sigma = sigma_s; 
n = @(z) N_e * normpdf(z, 0, sigma);