function [theta_y, theta_z] = staticBeamDeflection( ...
	x, rho, beta, n, r_e, sigma)
%STATICBEAMDEFLECTION Calculates the deflection angle of the 
% testing beam
% x:	position of the scanning beam, assuming the main beam is 
%	   centered at x = 0	   
% rho:  offset of the scanning beam in Y axis
% beta: relative velocity of the main beam, beta = v_t / c
% n(z): function expressing the main beam linear density along 
%	   Z axis
% r_e:  electron radius
% sigma:main beam bunch length
	  
	% compute theta Y
	fun_y = @(z) n(z) ./ (rho .* rho + (x + beta .* z) .* ...
		(x + beta .* z));
	%Integral_y = integral(fun_y, -Inf, Inf);
	Integral_y = integral(fun_y, -3 * sigma, 3 * sigma);
	theta_y = 2 * rho * r_e / beta * Integral_y;

	
	% compute theta Z
	fun_z = @(z) ((x + beta .* z) .* n(z)) ./ (...
        rho .* rho + (x + beta .* z) .* (x + beta .* z));
	
	%Integral_z = integral(fun_z, -Inf, Inf);
	Integral_z = integral(fun_z, -3 * sigma, 3 * sigma);
	theta_z = 2 * r_e * Integral_z;

end

