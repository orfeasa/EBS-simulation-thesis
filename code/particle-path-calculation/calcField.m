function E_new = calcField(pos, Field, t, timeUnit)
%CALCFIELD Calculates the field in the position pos from the 
% data in Field. If the position is not in the datapoints 
% it uses cubic interpolation to calculate the field
%TEST: calcField([0.0250, 0.0250, 0.2200], Field, 50, 1) = 
% [-7.3163e+03, -7.2088e+03, 0.1743e+03]

	sampleNo = round(t/timeUnit); 
    % round because it sometimes gives result as double

	Xq = pos(1);
	Yq = pos(2);
	Zq = pos(3);

	X  = Field{sampleNo, 1};
	Y  = Field{sampleNo, 2};
	Z  = Field{sampleNo, 3};
	Ex = Field{sampleNo, 4};
	Ey = Field{sampleNo, 5};
	Ez = Field{sampleNo, 6};

	Exq = interp3(X, Y, Z, Ex, Xq, Yq, Zq, 'linear');
	Eyq = interp3(X, Y, Z, Ey, Xq, Yq, Zq, 'linear');
	Ezq = interp3(X, Y, Z, Ez, Xq, Yq, Zq, 'linear');

	E_new = [Exq, Eyq, Ezq];
end