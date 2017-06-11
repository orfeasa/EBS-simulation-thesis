function FieldCell = convertFieldDataToCell(Field)
%CONVERTFIELDDATATOCELL Converts the input file which is in 
% the CST format into a cell array with mesh format.
% The format of the input file is timeslotsXpositionsXvalues. 
% This is not usable to do any interpolation. This function 
% converts it to a cell array where each cell contains the 
% data for each timestep in mesh format.
% Output format: FieldCell{timestep, coordinate}, 
% where coordinate is 1: x, 2:y, 3:z, 4:Ex, 5:Ey, 6:Ez

	% number of timeslots
	timeslots = size(Field, 1);

	% initialize cell array
	FieldCell = cell(timeslots, 6);

	for currTime = 1:timeslots
		% take values from input
		xs  = Field(currTime, :, 1);
		ys  = Field(currTime, :, 2);
		zs  = Field(currTime, :, 3);
		exs = Field(currTime, :, 4);
		eys = Field(currTime, :, 5);
		ezs = Field(currTime, :, 6);
		
		% calculate number of x, y and z points
		dim1 = length(unique(xs));
		dim2 = length(unique(ys));
		dim3 = length(unique(zs));
		
		% from 1d array to 3d mesh-like matrix
		Xtemp  = reshape(xs,  [dim1, dim2, dim3]);
		Ytemp  = reshape(ys,  [dim1, dim2, dim3]);
		Ztemp  = reshape(zs,  [dim1, dim2, dim3]);
		ExTemp = reshape(exs, [dim1, dim2, dim3]);
		EyTemp = reshape(eys, [dim1, dim2, dim3]);
		EzTemp = reshape(ezs, [dim1, dim2, dim3]);
		
		% the reshape() function does not change the 
        % dimentions correctly, so we have to change them 
        % again using reshape(). newOrder is the argument for 
        % permute() to have the right order
		newOrder = [2 1 3];
		X = permute(Xtemp, newOrder);
		Y = permute(Ytemp, newOrder);
		Z = permute(Ztemp, newOrder);
		Ex = permute(ExTemp, newOrder);
		Ey = permute(EyTemp, newOrder);
		Ez = permute(EzTemp, newOrder);
		
		% store data to the cell
		FieldCell{currTime, 1} = X;
		FieldCell{currTime, 2} = Y;
		FieldCell{currTime, 3} = Z;
		FieldCell{currTime, 4} = Ex;
		FieldCell{currTime, 5} = Ey;
		FieldCell{currTime, 6} = Ez;
	end

end