function [ cscale ] = calculate-cscale( sigma, coff, Rout, Rin)
%CALCULATE-CSCALE Calculates the scaling factor cscale for a CST circular
%particle source with gaussian radial pendency 
    % create symbolic variables
    syms r;
    syms cscales;

    % define radial function    
    f = @(r) coff + cscales * (exp( (-r .^ 2) / (2 * sigma ^ 2)) - 1);
   
    % calculate indefinite indegral
    I = @(r) int(f(r) * r, r);
    
    % calculate definite integral
    Idef = subs(I, r, Rout) - subs(I, r, Rin);
    
    %solve equation
    %FSOLVE requires all values returned by functions to be of data type double.
    cscale = double(solve(Idef - 0.5 * (Rout^2 - Rin^2), cscales));
end