function main()

// Petite fonction pour illustrer la méthode du gradient
// à pas optimal.
// S. Mottelet, 27/4/99, pour RO04

A=[2 -1;-1 2];
b=[1;1];

A=readMatrix(A,'Donner la matrice A');
if A==[], return, end

b=readMatrix(b,'Donner le vecteur b')
if b==[], return, end


x0=A\b;
f0=-b'*x0/2;

ax=[x0(1)-10 x0(1)+10 x0(2)-10 x0(2)+10];

plot(x0(1),x0(2),'+r','axis',ax,'axis','equal');
hold on

// On attend le point initial

title('Cliquez sur le point de depart')

[butt x1 x2]=xclick();
x=[x1;x2];
plot(x1,x2,'go')

traceEllipse(A,b,x);

// et on y va


butt=0;
g=A*x-b;

xset('alufunction',0)
title('Cliquez sur le point de depart')
xset('alufunction',3)

x_message(['Bouton de gauche pour faire avancer la methode pas a pas';'Bouton du milieu pour enchainer automatiquement les pas';'Bouton de droite pour arreter'])


it=0;
MAXIT=50;
while butt~=2 & norm(x-x0) > 1e-5 & it < MAXIT
   it=it+1;
   if butt~=1
   [butt bidon bidon]=xclick();
   end

   g=A*x-b;
   alpha=g'*g/(g'*A*g);

   d=-alpha*g;
   plot([x(1) x(1)+d(1)],[x(2) x(2)+d(2)],'go-');
   x=x+d;
   traceEllipse(A,b,x)
end

hold off
if it==MAXIT
  x_message(sprintf('Nombre maximum d''iterations (%d) atteint.',MAXIT))
elseif butt==2
  x_message('Les iterations ont ete interrompues')
else
  x_message(sprintf('La methode a converge apres %d iterations',it))
end

function a=readMatrix(a0,message)

[n,m]=size(a0);

row='';labelv=row(ones(1,n))+string(1:n)
col='';labelh=col(ones(1,m))+string(1:m)
a=evstr(x_mdialog(message,labelv,labelh,string(a0)));


function traceEllipse(A,b,x)

// trace l'isovaleur de la forme quadratique associee
// a A et b passant par x=[x1;x2];

[D P]=bdiag(A);

a1=1/sqrt(D(1,1));
a2=1/sqrt(D(2,2));

x0=A\b;
f0=-b'*x0/2;
c=.5*x'*A*x-b'*x;

t=linspace(0,2*%pi,100);

R=sqrt(2*(c-f0));

z=[R*a1*cos(t);R*a2*sin(t)];

x=P*z;
x(1,:)=x(1,:)+x0(1);
x(2,:)=x(2,:)+x0(2);

plot(x(1,:),x(2,:),'axis','equal')
