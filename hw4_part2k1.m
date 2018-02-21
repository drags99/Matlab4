%homework 4 part 2 for k=1
clear;
clc;

%defining parameters
K=1;
L=1;
U_L=0;
v=1;
A=1;
lamda=-1*K^2;
N=30;
h=L/(N+1);

%creating coefficient matrix 
coeff=zeros(N,N);

%first row assignment
coeff(1,1)=(h^2)*lamda-2;
coeff(1,2)=2;

%last row assignment
coeff(N,N-1)=1;
coeff(N,N)=(h^2)*lamda-2;

%assigning values for row between 2 and N-1
for i=2:N-1 %rows
    coeff(i,i-1)=1;
    coeff(i,i)=-1*(K^2)*(h^2)-2;
    coeff(i,i+1)=1;

end

%creating f column vector
f=A*(h^2)*ones(N,1);
f(1)=A*(h^2)+2*h*v;
f(N)=A*(h^2)-U_L;

%tri-diagonal algorithm

%creating and setting first value in g matrix
g=f;

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


%error calculation
x=h:h:1-h;
exact_solution=[];
for i=1:N
    exact_solution(i,1)=Part2_exact(x(i),K);
end

plot(x,exact_solution,'+',x,u,'x')
legend('exact solution','aproximate solution')
