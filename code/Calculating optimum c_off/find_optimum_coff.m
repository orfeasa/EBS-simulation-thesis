sigma = 0.01/4;
Rout = 0.01;
Rin = 0;

syms c_off;

fsolve(@(c_off) calculate_cscale( sigma, c_off, Rout, Rin) - c_off, 800);