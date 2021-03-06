%%Boundary Conditions and givens
n=80; %increase for grid convergence
L=1;
k=100;
lambda=(k^2);
U0=1;
v=1;
h=L/n;
a=ones(n+2,1);                          %superdiagonal
b=-(2+lambda*(h^2))*ones(n+2,1);        %diagonal
c=ones(n+2,1);                          %subdiagonal
d=zeros(n+2,1);
b(1)=1;     
c(1)=1;     
a(n+2)=1;   
b(n+2)=1;
d(1)=2*U0;

c1=zeros(n+2,1);
d1=zeros(n+2,1);
d1(1)=d(1)/b(1);
c1(1)=c(1)/b(1);

for i=2:n+2
c1(i)=c(i)/(b(i)-a(i)*c1(i-1));
d1(i)=(d(i)-a(i)*d1(i-1))/(b(i)-a(i)*c1(i-1));
end
%back substitution
u=zeros(n+2,1);
u(n+2)=d1(n+2);
for i=n+1:-1:1
    u(i)=d1(i)-c1(i)*u(i+1);
end
%%Graphing
x=h/2:h:(L-h/2);
ut=(((sinh(k*(L-x))+sinh(k*x))/sinh(k*L))-1)*(1/(k^2))+U0*(sinh(k*(L-x))/sinh(k*L));
%%plot(x,ut,x,u(2:n+1))
%%title('Case One, N=20, k=100')
%%xlabel('x')
%%ylabel('u')
%%legend('Theoretical Temperature','Actual Temperature')

%%Part 2
h=L/n;
U0=1
a=-ones(n+2,1);
b=(2+lambda*(h^2))*ones(n+2,1);
c=-ones(n+2,1);
d=zeros(n+2,1);
b(1)=1;
a(n+2)=1;
c(1)=-1
b(n+2)=1
d(1)=n*2*h;
%%Forward elimination
d1=zeros(n+2,1);
c1=zeros(n+2,1);
d1(1)=d(1)/b(1);
c1(1)=c(1)/b(1);
for i=2:n+2
    c1(i)=c(i)/(b(i)-a(i)*c1(i-1));
    d1(i)=(d(i)-a(i)*d1(i-1))/(b(i)-a(i)*c1(i-1));
end
%Back Substitiution
u=zeros(n+2,1);
u(n+2)=d1(n+2);
for i=n+1:-1:1
    u(i)=d1(i)-c1(i)*u(i+1);
end
ut2=((cosh(k*x)/cosh(k*L))-1)*(1/(k^2))-(v/k)*(sinh(k*(L-x))/cosh(k*L));
plot(x,ut2,x,u(2:n+1))
plot(x,ut,x,u(2:n+1))
title('Case Two, N=40, k=100')
xlabel('x')
ylabel('u')
legend('Theoretical Temperature','Actual Temperature')

%%error of u for n

du_n(n+2,1)=ut(i)-u(i);

error_n=abs(sum(du_n))


%%2n
%%Boundary Conditions and givens
n=2*n; %increase for grid convergence
L=1;
k=100;
lambda=(k^2);
U0=1;
v=1;
h=L/n;
a=ones(n+2,1);                          %superdiagonal
b=-(2+lambda*(h^2))*ones(n+2,1);        %diagonal
c=ones(n+2,1);                          %subdiagonal
d=zeros(n+2,1);
b(1)=1;     
c(1)=1;     
a(n+2)=1;   
b(n+2)=1;
d(1)=2*U0;

c1=zeros(n+2,1);
d1=zeros(n+2,1);
d1(1)=d(1)/b(1);
c1(1)=c(1)/b(1);

for i=2:n+2
c1(i)=c(i)/(b(i)-a(i)*c1(i-1));
d1(i)=(d(i)-a(i)*d1(i-1))/(b(i)-a(i)*c1(i-1));
end
%back substitution
u1=zeros(n+2,1);
u1(n+2)=d1(n+2);
for i=n+1:-1:1
    u1(i)=d1(i)-c1(i)*u1(i+1);
end
%%Graphing
x=h/2:h:(L-h/2);
ut=(((sinh(k*(L-x))+sinh(k*x))/sinh(k*L))-1)*(1/(k^2))+U0*(sinh(k*(L-x))/sinh(k*L));
%%plot(x,ut,x,u(2:n+1))
%%title('Case One, N=20, k=100')
%%xlabel('x')
%%ylabel('u')
%%legend('Theoretical Temperature','Actual Temperature')

%%Part 2
h=L/n;
U0=1
a=-ones(n+2,1);
b=(2+lambda*(h^2))*ones(n+2,1);
c=-ones(n+2,1);
d=zeros(n+2,1);
b(1)=1;
a(n+2)=1;
c(1)=-1
b(n+2)=1
d(1)=n*2*h;
%%Forward elimination
d1=zeros(n+2,1);
c1=zeros(n+2,1);
d1(1)=d(1)/b(1);
c1(1)=c(1)/b(1);
for i=2:n+2
    c1(i)=c(i)/(b(i)-a(i)*c1(i-1));
    d1(i)=(d(i)-a(i)*d1(i-1))/(b(i)-a(i)*c1(i-1));
end
%Back Substitiution
u1=zeros(n+2,1);
u1(n+2)=d1(n+2);
for i=n+1:-1:1
    u1(i)=d1(i)-c1(i)*u1(i+1);
end
ut2=((cosh(k*x)/cosh(k*L))-1)*(1/(k^2))-(v/k)*(sinh(k*(L-x))/cosh(k*L));
plot(x,ut2,x,u1(2:n+1))
plot(x,ut,x,u1(2:n+1))
title('Case Two, N=40, k=100')
xlabel('x')
ylabel('u')
legend('Theoretical Temperature','Actual Temperature')

%%error of u for n

du_2n(n+2,1)=ut2(i)-u1(i);

error_2n=abs(sum(du_2n))

%%Order of Accuracy

OAC=log((error_n/error_2n))/log(2)


