%% Electron beam scanner variable analysis
% The following code calculates the deflecting angles of the beam
% using an electron beam scanner, according the following 
% equations:
% 
% $$\theta_y(x) = \frac{2 \rho r_e}{\beta} 
% \int\limits_{- \infty}^{+ \infty} \frac{n(z) dz}
% {\rho^2 + (x + \beta z)^2}$$ 
%
% $$\theta_z(x) = 2 r_e \int\limits_{- \infty}^{+ \infty} 
% \frac{(x + \beta z)n(z) dz}{\rho^2 + (x + \beta z)^2}$$  
% 


% Initialize 
clear variables; close all; clc;

%%
% 
% A script has been created to initialize all the variables and 
% values  after each variable iteration
% 
setInitialValues;


%% Initial results
% Plots of the initial results, with no iteration

Thetas = zeros(length(x), 2);

for i = 1:length(x)
	[theta_y, theta_z] = staticBeamDeflection( ...
		x(i), rho, beta, n, r_e, sigma);
	Thetas(i, 1) = theta_y;
	Thetas(i, 2) = theta_z;
end

f1 = figure;
plot(Thetas(:,2), Thetas(:,1));
axis equal;
title('Initial ellipse');
xlabel('\theta_z [rad]');
ylabel('\theta_y [rad]');

saveas(f1,'initial-ellipse','epsc')


f2 = figure;
subplot(2,1,1);
plot(x, Thetas(:,2));
title('Ellipse width');
ylabel('\theta_z [rad]');
xlabel('x [m]');
%axis([-5,5,-2e-3,2e-3]);


subplot(2,1,2);
plot(x, Thetas(:,1));
title('Ellipse height');
xlabel('x [m]');

saveas(f2,'initial-ellipse-height-width','epsc')

ellipseHeight = max(Thetas(:, 1)) - min(Thetas(:, 1));
ellipseWidth = max(Thetas(:, 2)) - min(Thetas(:, 2));
ellipseRatio = ellipseHeight / ellipseWidth;

%% Iterate by bunch intensity

Q_i_range = linspace(Q_i_min, Q_i_max, y_acc);
Heights_Q = zeros(length(Q_i_range), 1);
Ratios_Q = zeros(length(Q_i_range), 1);

for i = 1:length(Q_i_range)
	
	Q_i = Q_i_range(i);
	
	% electrons per bunch
	N_e = Q_i / (N_b * q_e);
	
	% compute new linear density
	n = @(z) N_e * normpdf(z, 0, sigma);
	
	Thetas = zeros(length(x), 2);

	for j = 1:length(x)
		[theta_y, theta_z] = staticBeamDeflection( ...
			x(j), rho, beta, n, r_e, sigma);
		Thetas(j, 1) = theta_y;
		Thetas(j, 2) = theta_z;
	end

	ellipseHeight = max(Thetas(:, 1)) - min(Thetas(:, 1));
	ellipseWidth = max(Thetas(:, 2)) - min(Thetas(:, 2));
	ellipseRatio = ellipseHeight / ellipseWidth;
	
	Heights_Q(i) = ellipseHeight;
	Ratios_Q(i) = ellipseRatio; 
end

f3 = figure;
subplot(2,1,1);
plot(Q_i_range, Heights_Q);
title('Ellipse height by bunch intensity');
xlabel('Bunch intensity [C]');
ylabel('Ellipse height');

subplot(2,1,2);
plot(Q_i_range, Ratios_Q);
title('Ellipse ratio by bunch intensity');
xlabel('Bunch intensity [C]');
ylabel('Ellipse ratio');
axis([0, 0.006, 3.63, 3.64]);

saveas(f3,'EBS-variables-intensity','epsc')


%% Iterate by bunch length

% Reinitialize from bunch intensity iteration
setInitialValues;

x = linspace(xmin, xmax, x_acc);

sigma_range = linspace(sigma_min, sigma_max, y_acc); 
Heights_sigma = zeros(length(sigma_range), 1);
Ratios_sigma = zeros(length(sigma_range), 1);

for i = 1:length(sigma_range)
	
	sigma = sigma_range(i);
	
	% compute new linear density
	n = @(z) N_e * normpdf(z, 0, sigma);
	
	Thetas = zeros(length(x), 2);

	for j = 1:length(x)
		[theta_y, theta_z] = staticBeamDeflection( ...
			x(j), rho, beta, n, r_e, sigma);
		Thetas(j, 1) = theta_y;
		Thetas(j, 2) = theta_z;
	end

	ellipseHeight = max(Thetas(:, 1)) - min(Thetas(:, 1));
	ellipseWidth = max(Thetas(:, 2)) - min(Thetas(:, 2));
	ellipseRatio = ellipseHeight / ellipseWidth;
	
	Heights_sigma(i) = ellipseHeight;
	Ratios_sigma(i) = ellipseRatio; 
end

f4 = figure;
subplot(2,1,1);
plot(sigma_range, Heights_sigma);
title('Ellipse height by bunch length');
xlabel('Bunch length [m]');
ylabel('Ellipse height');

subplot(2,1,2);
plot(sigma_range, Ratios_sigma);
title('Ellipse ratio by bunch length');
xlabel('Bunch length [m]');
ylabel('Ellipse ratio');

saveas(f4,'EBS-variables-length','epsc')

%% Iterate by Y-offset (rho)

% Reinitialize from bunch length iteration
setInitialValues;

x = linspace(xmin, xmax, x_acc);

rho_range = linspace(rho_min, rho_max, y_acc);
Heights_rho = zeros(length(rho_range), 1);
Ratios_rho = zeros(length(rho_range), 1);

for i = 1:length(rho_range)
	
	rho = rho_range(i);
	
	Thetas = zeros(length(x), 2);

	for j = 1:length(x)
		[theta_y, theta_z] = staticBeamDeflection( ...
			x(j), rho, beta, n, r_e, sigma);
		Thetas(j, 1) = theta_y;
		Thetas(j, 2) = theta_z;
	end

	ellipseHeight = max(Thetas(:, 1)) - min(Thetas(:, 1));
	ellipseWidth = max(Thetas(:, 2)) - min(Thetas(:, 2));
	ellipseRatio = ellipseHeight / ellipseWidth;
	
	Heights_rho(i) = ellipseHeight;
	Ratios_rho(i) = ellipseRatio; 
end

f5 = figure;
subplot(2,1,1);
plot(rho_range, Heights_rho);
title('Ellipse height by Y-offset (\rho)');
xlabel('Y-offset');
ylabel('Ellipse height');

subplot(2,1,2);
plot(rho_range, Ratios_rho);
title('Ellipse ratio by Y-offset (\rho)');
xlabel('Y-offset');
ylabel('Ellipse ratio');

saveas(f5,'EBS-variables-rho','epsc')


%% Iterate by probe beam voltage

% Reinitialize from Y-offset (rho) iteration
setInitialValues;

x = linspace(xmin, xmax, x_acc);

V_range = linspace(V_min, V_max, y_acc);
Heights_V = zeros(length(V_range), 1);
Ratios_V = zeros(length(V_range), 1);

for i = 1:length(V_range)
	
	V = V_range(i);
	gamma = 1 + V / E_0;
	beta = sqrt(1 - 1 / (gamma * gamma));
	
	Thetas = zeros(length(x), 2);

	for j = 1:length(x)
		[theta_y, theta_z] = staticBeamDeflection( ...
			x(j), rho, beta, n, r_e, sigma);
		Thetas(j, 1) = theta_y;
		Thetas(j, 2) = theta_z;
	end

	ellipseHeight = max(Thetas(:, 1)) - min(Thetas(:, 1));
	ellipseWidth = max(Thetas(:, 2)) - min(Thetas(:, 2));
	ellipseRatio = ellipseHeight / ellipseWidth;
	
	Heights_V(i) = ellipseHeight;
	Ratios_V(i) = ellipseRatio; 
end

f6 = figure;
subplot(2,1,1);
plot(V_range, Heights_V);
title('Ellipse height by Voltage [V]');
xlabel('Voltage [V]');
ylabel('Ellipse height');
axis([0, 2000000, 0, 0.3]);

subplot(2,1,2);
plot(V_range, Ratios_V);
title('Ellipse ratio by Voltage [V]');
xlabel('Voltage [V]');
ylabel('Ellipse ratio');
axis([0, 2000000, 0, 4]);

saveas(f6,'EBS-variables-voltage-linear','epsc')

% f7 = figure;
% subplot(2,1,1);
% semilogx(V_range, Heights_V);
% title('Ellipse height by Voltage [V]');
% xlabel('Voltage [V]');
% ylabel('Ellipse height');
% 
% subplot(2,1,2);
% semilogx(V_range, Ratios_V);
% title('Ellipse ratio by Voltage [V]');
% xlabel('Voltage [V]');
% ylabel('Ellipse ratio');
% 
% saveas(f7,'EBS-variables-voltage-log','epsc')
