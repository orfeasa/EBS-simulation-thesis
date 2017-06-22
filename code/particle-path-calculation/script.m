%% Data to import
filename = 'AllSamples0.01-smallerbox.txt';

%% store the data
Field = importField(filename);
 
save(strcat(filename, '.mat'), 'Field');

%% import field
load(strcat(filename, '.mat'));

%% convert field to grid
% convert to mesh
FieldCell = convertFieldDataToCell(Field);

% rename FieldCell to Field
Field = FieldCell;
clear FieldCell;

%% initial data
% all parameters in SI
% cst parameters
simulation_time = 2e-8;

main_pipe_diameter = 0.1;
main_pipe_length = 5;

scan_pipe_diameter = main_pipe_diameter;
scan_beam_energy = 2e4;
scan_pipe_length = 0.25;

xmin = -1/2 * scan_pipe_length;
xmax = 1/2 * scan_pipe_length;
ymin = -1/2 * scan_pipe_diameter;
ymax = 1/2 * scan_pipe_diameter;
zmin = -0.75 * scan_pipe_diameter;
zmax = 0.75 * scan_pipe_diameter;

% other parameters
c = 299792458;
E0 = 0.510998910e6;
monitorPosX = xmax; %x cut position
timeUnit = 1 / 100 * simulation_time;

beta = sqrt(1 - 1 / ( (scan_beam_energy / E0) + 1 ) );
startingPos = [xmin, ymax/10, 0, c * beta, 0, 0];
timeZero = 0;
finalTime = size(Field, 1) * timeUnit + timeZero;

%%
% initial position
finalPositions = [];
NoOfParticles = 0;
while (true)
	% create particle
	NoOfParticles = NoOfParticles + 1;
	pos_old = startingPos(1:3);
	v_old = startingPos(4:6);
	t_old = timeZero + (NoOfParticles - 1) * timeUnit;
	hasReachedMonitor = false;
	timeStepsTravelling = 0;
	
	% put it through the pipe and save its final position
	while (not(hasReachedMonitor))
		% travel in field until it reaches final destination
		% record final position, velocity and time
		% position = (x, y, z, v_x, v_y, v_z)
		% calculate position and velocity in the next step
		[pos_new, v_new, t_new] = calcNextPosition(pos_old, ...
			v_old, t_old, Field, timeUnit, finalTime);
		timeStepsTravelling = timeStepsTravelling + 1;
		
		% has the particle reached the monitor?
		if (pos_new(1) >= monitorPosX)
			% change flag so it exits the loop
			hasReachedMonitor = true;
			
			% interpolate between the two last positions to 
            % find the data in the monitor's position
			x  = monitorPosX;			
			y  = lininterp1(pos_old(1), pos_new(1), ...
				pos_old(2), pos_new(2), monitorPosX);
			z  = lininterp1(pos_old(1), pos_new(1), ...
				pos_old(3), pos_new(3), monitorPosX);
			vx = lininterp1(pos_old(1), pos_new(1), ...
				v_old(1), v_new(1), monitorPosX);
			vy = lininterp1(pos_old(1), pos_new(1), ...
				v_old(2), v_new(2), monitorPosX);
			vz = lininterp1(pos_old(1), pos_new(1), ...
				v_old(3), v_new(3), monitorPosX);
			
			% save the final position and velocity
			endPos = [x, y, z, vx, vy, vz];
		end
		
		% did we run out of field data?
		if (t_new >= finalTime)
			break;
		end
		
		% update current position for next iteration
		pos_old = pos_new;
		v_old = v_new;
		t_old = t_new;
	end
	
	% did the particle reach its final position?
	if (hasReachedMonitor)
		% save the final position
		% TODO optimize with non-dynamical allocation
		finalPositions = [finalPositions; endPos];
	else
		% we're done here, there is no more data
		break;
	end
end
