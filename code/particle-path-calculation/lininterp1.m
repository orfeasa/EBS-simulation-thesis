function yq = lininterp1(x0, x1, y0, y1, xq)
%LININTERP1 Interpolates linearly between two points 
% Interpolates linearly between y0 and y1 according to the 
% position of xq in the range x0-xq  

	yq = (y1 - y0) / (x1 - x0) * xq;

end