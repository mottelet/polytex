function [xlast,lambda]=pq(A,b,C,d,x0)

// resolution du probleme
//
// min 1/2x'*A*x-b'*x
// Cx-d <= 0
//

x=x0;
n=length(x0);
m=length(d);
ok=%T;
TOL=1e-10;

k=0;
while 1
  if ok
     disp(sprintf('x%d=',k));
     disp(x);
     I=find(abs(C*x-d)<=%eps);
     J=find(abs(C*x-d)>%eps);
     g=A*x-b;
     disp('contraintes saturées');
     disp(I);
  end
   
  ns=length(I);

  ok=%T;

  if ns>0
    [q,r]=qr(C(I,:)');
    u=q(:,1:ns);
    r=r(1:ns,1:ns);
    p=u'*g;
    DIR=-g+u*p;
    if norm(DIR) <= TOL
        lambda=zeros(m,1);
        lambda(I)=-r\p;
        disp('lambda=');
	disp(lambda');
	if and(lambda>=0)
           xlast=x;
	   return;
        else
	    [ls,ind]=sort(lambda);
	    J=[J I(ind($))];
            disp(sprintf('on enleve la contrainte %d',I(ind($))));
            I(ind($))=[];
	    ok=%F;
	end
     end
  else
     DIR=-g;
  end
  if ok 
     rho_opt = -(DIR'*g)/(DIR'*A*DIR);
     rho_lim = (d(J)-C(J,:)*x)./(C(J,:)*DIR); 
     rho_lim( rho_lim <= 0)=[];
     rho=min([rho_lim;rho_opt]);
     x=x+rho*DIR;
     k=k+1;
  end
end
