function [ u ] = Part2_exact( x,k )
%part 2 solution for a given x and k
L=1;
v=1;
A=1;

u=((cosh(x*k)/cosh(k*L))-1)*(A/k^2)-(v/k)*(sinh(k*(L-x))/cosh(k*L));

end

