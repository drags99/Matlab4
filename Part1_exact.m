function [ u ] = Part1_exact( x,k )
%part 1 exact solution for a given x and k
L=1;
U_0=1;
A=1;

u=(1-(sinh(k*(L-x))+sinh(k*x))/sinh(k*L))*(A/(k^2))+U_0*sinh(k*(L-x))/sinh(k*L);

end

