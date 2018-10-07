 /* couleur des cases pour les noirs : 0.65, 0.49, 0.36 #a67d5d
      couleur des cases pour les blancs : 0.91, 0.82, 0.67 #e8d0aa
      couleur des pieces pour les blancs : 0.96, 0.76, 0.29 #f5c14b
      couleur des pieces pour les noirs : 0.51, 0.41, 0.36 #83695c
*/

/*
  Paramètres :
  avecPieces : 1 si l'on veut rajouter les pièces, 0 par défaut
  couleurCasesNoires : tableau [r,g,b] ou couleur standardisé ex: "red"
  couleurCasesBlanches  : tableau [r,g,b] ou couleur standardisé ex: "red"
  couleurPiecesBlanches : tableau [r,g,b] ou couleur standardisé ex: "red"
  couleurPiecesNoires : tableau [r,g,b] ou couleur standardisé ex: "red"
  epaisseurDamier : épaisseur du damier
  epaisseurPieces : épaisseur des pièces
  avecAnimation  : animation du déplacement d'une pièce
*/

module damier (avecPieces = 0, couleurCasesNoires = [.65, .49, .36], couleurCasesBlanches = [.91, .82, .67],couleurPiecesBlanches = [.96, .76, .29],couleurPiecesNoires = [.51, .41, .36],epaisseurDamier = .5,epaisseurPieces = .2, avecAnimation = 1)
{
    rangeesExclues = [4,5];
    rangeesPiecesNoires = [0,1,2,3];

    // Conception du damier
    for(x = [0:9]){
        for(y = [0:9]){
            if( ( x + y ) % 2 == 0){
                translate([x,y,0]) color(couleurCasesBlanches) cube([1,1,epaisseurDamier]);
            } else {
                translate([x,y,0]) color(couleurCasesNoires) cube([1,1,epaisseurDamier]);

                // Conception des pieces
                if(avecPieces){
                    //Si x ne se trouve pas dans la liste des rangées exclues
                    if(!(search(x, rangeesExclues))) {
                        if(search(x, rangeesPiecesNoires)){
                            /*On n'oublie pas d'ajouter le rayon des pieces à x et y pour la translation
                                $fn correspond au nombre de fragements
                                pour rendre la pièce plus circulaire */
                            translate([x+.5,y+.5,.5]) color(couleurPiecesNoires) cylinder(r=.5,h=epaisseurPieces, $fn = 50);
                        }else{
                            // Pour représenter la dame
                            if((x == 9) && (y == 4)) {
                                translate([x+.5,y+.5,.5]) color(couleurPiecesBlanches) cylinder(r=.5,h=epaisseurPieces, $fn = 6);
                            }else{
                                if(avecAnimation) {
                                    if((x != 6) || (y != 5)){
                                        translate([x+.5,y+.5,.5]) color(couleurPiecesBlanches) cylinder(r=.5,h=epaisseurPieces, $fn = 50);
                                    }else{
                                        // Petite animation
                                        translate([(x+$t*-1.5),(y+$t*-1.5),.5]) color(couleurPiecesBlanches) cylinder(r=.5,h=epaisseurPieces, $fn = 50);
                                    }
                                 }else{
                                        translate([x+.5,y+.5,.5]) color(couleurPiecesBlanches) cylinder(r=.5,h=epaisseurPieces, $fn = 50);
                                  }
                            }
                         }
                    }
                 }
            }
        }
    }
}
//damier ();
damier (avecPieces = 1, avecAnimation = 0);
//damier (avecPieces = 1, couleurPiecesBlanches="white",couleurPiecesNoires="black");
//damier (avecPieces = 0, couleurCasesBlanches="white",couleurCasesNoires="black");
