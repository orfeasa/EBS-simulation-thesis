function [pos_new, v_new, t_new] = calcNextPosition(...
    pos_old, v_old, t_old, E_field, timeUnit, finalTime)
%CALCNEXTPOSITION Calculates the position and velocity of a 
%particle moving inside an electric field 

	% update position: x1 = x0 + v_x0t
	pos_new = pos_old + v_old .* timeUnit;

	% constants
	m_e = 9.1093829140e-31; % kilograms
	q_e = -1.60217656535e-19; % coulomb
	const1 = q_e * timeUnit / m_e;

	% TODO make it work for diffferent time (interpolate 
	% linearly between the two calculated timesteps)
	t_new = t_old + timeUnit;

	% update field
	if (t_new <= finalTime)
		E_new = calcField(pos_new, E_field, t_new, ...
			timeUnit);
		
		% update velocity v1 = v0 + E1 * const1
		v_new = v_old + E_new .* const1;
	else
		%we are out of data
		v_new = NaN(1,3);	
	end
end