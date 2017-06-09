sigma = 0.01 / 4;
Rout = 0.01;
Rin = 0;

syms coff;

% find coff such as coff = cscale(coff)
fsolve(@(coff) calculateCscale(sigma, coff, Rout, Rin) - coff);