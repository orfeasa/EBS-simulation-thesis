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

% offset in Y axis 
rho = 0.01; % in m

% bunch length
sigma_s = 4e-3; % in m

% beta: relative velocity of the testing beam, beta = v_t / c
gamma = 1 + V / E_0; % because E_0 in eV
beta = sqrt(1 - 1 / (gamma ^ 2));

% charge per pulse
Q_i = 5.9e-4; % in Coulomb, 590 uC

% bunches per pulse
N_b = 70128;

% electrons per bunch
N_e = Q_i / (N_b * q_e);

% n(z): relativistic bunch linear density along Z
sigma = sigma_s; 
n = @(z) N_e * normpdf(z, 0, sigma);

%% Values for variable ranges

% The resolution of the plots is specified here by the number of
% samples
x_acc = 500;
y_acc = x_acc;


xmin = -0.5;
xmax = 0.5;
x = linspace(xmin, xmax, x_acc);

Q_i_min = 5.9e-5;
Q_i_max = 5.9e-3;

sigma_min = 0.1e-3;
sigma_max = 2e-1;

rho_min = 0;
rho_max = 2;

V_min = 2e2; %was 20e2
V_max = 2e6; %was 20e4

