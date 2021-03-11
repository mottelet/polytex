// goindent.sci
//
// Recherche lineaire avec intervalle de securite

mode(-1);

getf ident.sci

clf();
fig(gcf());

N=50;
np=100;

t=linspace(0,1,N);

y=exp(-5*t).*cos(20*t+1)+rand(1,N)/20;

// plot(t,y);

z=y;

x=rand(4,1,'normal');
//x=[1 1 1 1]';
[f0,g0]=fcout(x,4,t,z);

fa=f0;
d=-g0;

h0=0.5;
h=h0;

alphamin=0;
ga=g0'*d;
g0=g0'*d;
alphamax=0;

m1=0.2;
m2=.7;

// recherche d'une valeur de alphamax

fin=%F;
while alphamax==0 & ~fin

   [f,g]=fcout(x+h*d,4,t,z);
   g=g'*d;

   alpha=linspace(alphamin,2*h,100);
   for k=1:np
      phi(k)=fcout(x+alpha(k)*d,2,t,z);
   end
   plot(h,f,'og',alpha,phi,...
     alpha,fa+m1*alpha*ga,'axis','tight');

   if f < fa+m1*h*ga
      if g < m2*ga
	alphamin=h;
        fa=f;
	ga=g;
	h=2*h;
      else
        fin=%T;
	alphachap=h;
	alphamax=2*h;
      end
   else
	alphamax=h;
        fb=f;
	gb=g;
  end
end

if ~fin // si on n'a pas deja trouve un alpha satisfaisant


it=0;
while 1
   it=it+1;
   tau=(alphamax-alphamin);
   a=tau*(ga+gb)+2*(fa-fb);
   b=3*(fb-fa)-tau*(2*ga+gb);
   c=tau*ga;
   e=fa;

   s=(-b+sqrt(b^2-3*a*c))/3/a;

   alpha = alphamin+s*tau;

   s=linspace(0,1,100);
   q=a*s.^3+b*s.^2+c.*s+e;

//   alpha=(alphamin+alphamax)/2;

   [f,g]=fcout(x+alpha*d,4,t,z);
   g=g'*d;

   hold on
   ax=axis();
   plot([alphamin alphamin],[ax(3) ax(4)],'g');
   plot([alphamax alphamax],[ax(3) ax(4)],'g');
   
   // On trace la cubique
   
   plot(alphamin+s*tau,q,'r');
   
   title('Intervalle de recherche')
   plot(alpha,f,'o');
   hold off

   xclick();

   if f < fa+m1*alpha*ga
      if g > m2*ga
         break;
      else
         alphamin=alpha;
	 fa=f;
	 ga=g;
	    hold on
      plot([alphamin alphamin],[ax(3) ax(4)],'g');  
      hold off
      end
      xclick()
   else
      alphamax=alpha;
      fb=f;
      gb=g;
      hold on
      plot([alphamax alphamax],[ax(3) ax(4)],'g');
      hold off
      xclick()
   end
   
   alphatrace=linspace(alphamin,alphamax,100);
   for k=1:np
     phi(k)=fcout(x+alphatrace(k)*d,2,t,z);
   end
   plot(alphatrace,phi,alphatrace,fa+m1*alphatrace*g0);
   ax=axis();
   l=alphamax-alphamin;
   ax(1)=ax(1)-l/10;
   ax(2)=ax(2)+l/10;
   plot(alphatrace,phi,alphatrace,fa+m1*alphatrace*g0,alphatrace,'axis',ax);

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
