%debugging tri diagonal algorithm
%algorithm works 
clear
clc

coeff=[2.04,-1,0,0;-1,2.04,-1,0;0,-1,2.04,-1;0,0,-1,2.04]
N=4
f=[40.8;0.8;0.8;200.8]
%tri-diagonal algorithm

%creating and setting first value in g matrix
g=f

%creating matrix's a,b,c to hold values needed for algorithm
a=zeros(N,1);
for j=1:N
    a(j)=coeff(j,j);
end

b=zeros(N,1);
for j=2:N
    b(j)=coeff(j,j-1);
end

c=zeros(N,1);
for j=1:N-1
    c(j)=coeff(j,j+1);
end

%for loop to create actual a and g matrix 
for j=2:N
    a(j)=a(j)-(b(j)/a(j-1))*c(j-1);
    g(j)=f(j)-(b(j)/a(j-1))*g(j-1);
end

%finding u_n and creating u column vector
u=zeros(N,1);
u(N)=g(N)/a(N);

%finding rest of u
for k = (N-1):-1:1
    u(k)=(g(k)-(c(k))*u(k+1))/a(k);
end

u