// goindent.sci
//
// Recherche lineaire avec intervalle de securite
// plus interpolation quadratique

mode(-1);

getf ident.sci

N=50;

t=linspace(0,1,N);

y=exp(-5*t).*cos(20*t+1)+rand(1,N)/20;

// plot(t,y);

z=y;

x=rand(4,1,'normal');

[fa,g]=fcout(x,4,t,z);

d=-g;

h0=0.1;
h=h0;

alphamin=0;
ga=g'*d;
alphamax=0;

m1=0.2;
m2=.6;

// recherche d'une valeur de alphamax

fin=%F;
while alphamax==0 & ~fin

   [f,g]=fcout(x+h*d,2,t,z);

   alpha=linspace(alphamin,2*h,100);
   for k=1:np
      phi(k)=fcout(x+alpha(k)*d,2,t,z);
   end
   plot(h,f,'og',alpha,phi,...
     alpha,fa+m1*alpha*ga,alpha,fa+m2*alpha*ga,'axis','tight');
   xclick();

   if f < fa+m1*h*ga
      if f < fa+m2*h*ga
	alphamin=h;
	h=2*h;
      else
        fin=%T;
	alphachap=h;
	alphamax=2*h;
      end
   else
	alphamax=h;
        fb=f;
  end
end

if ~fin // si on n'a pas deja trouve un alpha satisfaisant

alpha=(alphamin+alphamax)/2;

it=0;
while 1
   it=it+1;

   alpha=(alphamin+alphamax)/2;
   [f,g]=fcout(x+alpha*d,4,t,z);

   hold on
   ax=axis();
   plot([alphamin alphamin],[ax(3) ax(4)],'g');
   plot([alphamax alphamax],[ax(3) ax(4)],'g');
   title('Intervalle de recherche')
xclick();
   plot(alpha,f,'o');
   hold off

   if f < fa+m1*alpha*ga
      if f > fa+m2*alpha*ga
         break;
      else
         alphamin=alpha;
	    hold on
      plot([alphamin alphamin],[ax(3) ax(4)],'g');  
      hold off
      end
      xclick()
   else
      alphamax=alpha;
      hold on
      plot([alphamax alphamax],[ax(3) ax(4)],'g');
      hold off
      xclick()
   end
   
   alphatrace=linspace(alphamin,alphamax,100);
   for k=1:np
     phi(k)=fcout(x+alphatrace(k)*d,2,t,z);
   end
   plot(alphatrace,phi,alphatrace,fa+m1*alphatrace*ga,alphatrace,fa+m2*alphatrace*ga);
   ax=axis();
   l=alphamax-alphamin;
   ax(1)=ax(1)-l/10;
   ax(2)=ax(2)+l/10;
   plot(alphatrace,phi,alphatrace,fa+m1*alphatrace*ga,alphatrace,fa+m2*alphatrace*ga,'axis',ax);

end

alphachap=alpha;

end

np=100;

alpha=linspace(alphamin,alphamax,np);

for k=1:np
  phi(k)=fcout(x+alpha(k)*d,2,t,z);
end

hold on

plot(alphachap,f,'or')

hold off
