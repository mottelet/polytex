function main()

t=linspace(0,16*%pi,256);
carre = objet( 'xy',[0 1 1 0 0; 0 0 1 1 0],'co',1,'rc',0*[t;t],'ra',t);  
xselect();
xbasc(); 
animate(list(carre),256,[-2 -2 2 2]);     

function animate(listeObjets,n,rect,efface,withPixmap)

// listeObjets : liste d'objets (listes) ayant la structure suivante
//
// listeObjets(i)(1) = xy : coordonnees de base de l'objet
// listeObjets(i)(2) = co : couleur de l'objet 
// listeObjets(i)(2) = tr : vecteurs successifs de translations
// listeObjets(i)(3) = rc : centres de rotation successifs
// listeObjets(i)(4) = ra : angles de rotation successifs
// listeObjets(i)(5) = hc : centres d'homotetie successifs
// listeObjets(i)(6) = hf : facteurs d'homotetie

// Initialisations diverses et avariees

[lhs,rhs]=argn(0);
if rhs==3
   efface='clear';
end

if efface=='clear'

  xsetech([0 0 1 1]);

  cm=[255 255 0;
  255 0 255;
  0 255 255;
  0 0 255;
  0 255 0;
  255 0 0;
  255 255 255;
  0 0 0];

  xset('colormap',cm/255)
  driver('X11')

  xset('background',8)
  xselect()
  xbasc()
  xclear()
  xset('alufunction',3)
  xset('pixmap',1)
  xset('wwpc')
elseif efface=='xor'
  driver('X11');
  if rhs==5
     if withPixmap='pixmap'	// on redessine ce qui existe deja
        xset('alufunction',3);	// dans la fenetre
	xset('pixmap',1);
        xset('wwpc');
        xbasr(0);		// ici
        xset('wshow')
     else
        error(withPixmap+' : Unknown xor mode option.')
     end
  end
  xset('alufunction',6);
else
  error(efface+' : Unknown animation mode.')
end

no = size(listeObjets);

// Objets a leur position initiale

for j=1:no
   dessineObjet(listeObjets(j),1);
end

// Animation

if efface=='clear'
   for i=1:n-1
      xset('wwpc');
      for j=1:no;
        dessineObjet(listeObjets(j),i+1);
      end
      xset('wshow');
   end
   xset('pixmap',0);
elseif efface=='xor'
   if rhs==5 // mode xor avec pixmap
     for i=1:n-1
      for j=1:no;
        dessineObjet(listeObjets(j),i);
        dessineObjet(listeObjets(j),i+1);
      end
      xset('wshow');
     end
     xset('pixmap',0);
   else
    for i=1:n-1
      for j=1:no;
        dessineObjet(listeObjets(j),i);
        dessineObjet(listeObjets(j),i+1);
      end
     end
   end
   xset('alufunction',3);   
end

driver('Rec')

// Game over man ...

function dessineObjet(obj,iTime)

xy=obj('xy');

if length(obj('hc'))
   hc=obj('hc')(:,iTime);
   hf=obj('hf')(:,iTime);
   xy(1,:)=(xy(1,:)-hc(1))*hf(1)+hc(1);
   xy(2,:)=(xy(2,:)-hc(2))*hf(2)+hc(2);
end

if length(obj('rc'))
  rc=obj('rc')(:,iTime);
  ra=obj('ra')(iTime);
  c=cos(ra);
  s=sin(ra);
  mrot=[c -s; s c];
  xy(1,:)=xy(1,:)-rc(1);
  xy(2,:)=xy(2,:)-rc(2);
  xy=mrot*xy;
  xy(1,:)=xy(1,:)+rc(1);
  xy(2,:)=xy(2,:)+rc(2);
end

if length(obj('tr'))
  tr=obj('tr')(:,iTime);
  xy(1,:)=xy(1,:)+tr(1);
  xy(2,:)=xy(2,:)+tr(2);
end


if obj('fill')
   xset('pattern',obj('co'));
   xfpoly(xy(1,:),xy(2,:))
else
   plot2d(xy(1,:),xy(2,:),obj('co'),'030',' ',rect);
end

// Game over man ...

function [obj]=initObjet()

obj=tlist(['obj','xy','co','fill','tr','rc','ra','hc','hf'],[],[],[],[],[],[],[] ) ;

function [obj]=objet(p1,v1,p2,v2,p3,v3,p4,v4,p5,v5,p6,v6,p7,v7,p8,v8)

[lhs,rhs]=argn(0);
obj=initObjet();

for i=1:rhs/2
	str=sprintf("obj(p%d)=v%d",i,i);
	execstr(str);
end

// Game over man ...
