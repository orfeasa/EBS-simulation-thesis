function [ c_scale ] = calculate_cscale( sigma, c_off, Rout, Rin)
%CALCULATE_CSCALE Calculates the scaling factor c_scale for a CST circular
%particle source with gaussian radial pendency 
    % create symbolic variables
    syms r;
    syms c_scales;

    % define radial function    
    f = @(r) c_off + c_scales * (exp( (-r .^ 2) / (2 * sigma ^ 2)) - 1);
   
    % calculate indefinite indegral
    I = @(r) int(f(r) * r, r);
    
    % calculate definite integral
    Idef = subs(I, r, Rout) - subs(I, r, Rin);
    
    %solve equation
    %FSOLVE requires all values returned by functions to be of data type double.
    c_scale = double(solve(Idef - 0.5 * (Rout^2 - Rin^2), c_scales));
end