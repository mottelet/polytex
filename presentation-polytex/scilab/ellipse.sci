function main()

// Petite fonction pour tracer les courbes iso-valeurs d'une ellipse
// dans le plan.
//
// S. Mottelet, 19/4/99, pour RO04

A=[2 -1;-1 2];
b=[1;1];

while %t

A=readMatrix(A,'Donner la matrice A');
if A==[], return, end

b=readMatrix(b,'Donner le vecteur b')
if b==[], return, end


[D P]=bdiag(A);

a1=1/sqrt(D(1,1));
a2=1/sqrt(D(2,2));

x0=A\b;
f0=-b'*x0/2;


t=linspace(0,2*%pi,100);

c=f0+(abs(f0):-abs(f0)/9:0);
K=length(c)

for k=1:K

   R=sqrt(2*(c(k)-f0));

   z=[R*a1*cos(t);R*a2*sin(t)];

   x=P*z;
   x(1,:)=x(1,:)+x0(1);
   x(2,:)=x(2,:)+x0(2);

   plot(x(1,:),x(2,:),'axis','equal')

   if k==1
      hold on
   end

end

plot(x0(1),x0(2),'r+')

hold off

end

function a=readMatrix(a0,message)

[n,m]=size(a0);

row='';labelv=row(ones(1,n))+string(1:n)
col='';labelh=col(ones(1,m))+string(1:m)
a=evstr(x_mdialog(message,labelv,labelh,string(a0)));

