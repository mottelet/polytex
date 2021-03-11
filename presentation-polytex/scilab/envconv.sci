function main()

// Petite fonction de generation de combinaisons complexes de N points
// dans le plan.
//
// S. Mottelet, 14/1/2000, pour RO04

P=1000; // nombre de combinaisons de points affiches a chaque passe
NP=20;   // nombre de passes

ax=[-1 1 -1 1];

while %t

   plot(-1,1,'axis',ax)
   title('Bouton de gauche : ajouter un point, bouton de droite : terminer')
   hold on
   
   ok=%t;
   x=[];
   while ok
        [b,x1,x2,w,m]=xclick();
        if b==0
             x=[x [x1;x2]];
             plot(x1,x2,'og');
	else
	    ok=%f;
	end  
   end
   hold off
   clf();
   
   plot(x(1,:),x(2,:),'og','axis',ax);
   hold on

   N=size(x,2);

   for i=1:NP // On y va, pour chaque passe
      c=rand(N,P); // coefficients tires au hasard
      s=sum(c,'r');  // Somme suivant les lignes

      p=sparse([1:P;1:P]',1../s); // On travaille avec une matrice diagonale creuse
      c=c*p; // normalisation des coeff
      y=x*c; // calcul des combinaisons convexes 

      plot(y(1,:),y(2,:),'.r');
      plot(x(1,:),x(2,:),'og');
   end

   hold off
   title('Cliquez dans le graphe pour continuer, a l''exterieur pour sortir')
   ax=axis();
   [b xc yc]=xclick(); // on attend un clic

   if ~(xc>=ax(1) & xc<=ax(2) & yc>=ax(3) & yc<=ax(4)) // si on a clique
     return                                            // a l'exterieur du graphe
   end                                                 // on sort.

end



