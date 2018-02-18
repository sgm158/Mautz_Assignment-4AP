%%Boundary Conditions and givens
n=10;
L=1;
k=10;
lambda=(k^2);
U0=1;
v=1;
h=L/n;
a=ones(n,1);                          %diagonal
b=-(2+lambda*(h^2))*ones(n,1);        %subdiagonal
c=ones(n,1);                          %superdiagonal
d=zeros(n,1);
b(1)=1;     
c(1)=1;     
a(n+2)=1;   
b(n+2)=1;
d(1)=2*U0;

c1=zeros(n,1);
d1=zeros(n,1);
d1(1)=d(1)/b(1);
c1(1)=c(1)/b(1);

for i=2:n
c1(i)=c(i)/(b(i)-a(i)*c1(i-1));
d1(i)=(d(i)-a(i)*d1(i-1))/(b(i)-a(i)*c1(i-1));
end
%back substitution
u=zeros(n,1);
u(n+2)=d1(n);
for i=n+1:-1:1
    u(i)=d1(i)-c1(i)*u(i+1);
end
