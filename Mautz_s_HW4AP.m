%%Boundary Conditions and givens
n=10;
L=1
k=10;
lambda=(k^2);
U0=1;
v=1;
h=L/n;
a=ones(n+2,1);
b=-(2+lambda*(h^2))*ones(n+2,1);
c=ones(n+2,1);
d=zeros(n+2,1);