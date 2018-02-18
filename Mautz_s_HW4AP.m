%%Boundary Conditions and givens
n=10;
L=1
k=10;
lambda=(k^2);
U0=1;
v=1;
h=L/n;
a=ones(n+2,1);                          %diagonal
b=-(2+lambda*(h^2))*ones(n+2,1);        %subdiagonal
c=ones(n+2,1);                          %superdiagonal
d=zeros(n+2,1);
b(1)=1;     
c(1)=1      
a(n+2)=1;   
b(n+2)=1
d(1)=2*U0;