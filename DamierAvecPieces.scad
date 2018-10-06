// couleur des cases pour les noirs : 0.65, 0.49, 0.36 #a67d5d
// couleur des cases pour les blancs : 0.91, 0.82, 0.67 #e8d0aa
// couleur des pieces pour les blancs : 0.96, 0.76, 0.29 #f5c14b
// couleur des pieces pour les noirs : 0.51, 0.41, 0.36 #83695c
couleurCasesNoires = [.65, .49, .36];
couleurCasesBlanches = [.91, .82, .67];
couleurPiecesBlanches = [.96, .76, .29];
couleurPiecesNoires = [.51, .41, .36];

rangeesExclues = [4,5];
rangeesPiecesNoires = [0,1,2,3];

// Conception du damier
for(x = [0:9]){
    for(y = [0:9]){
        if( ( x + y ) % 2 == 0){
            translate([x,y,0]) color(couleurCasesBlanches) cube([1,1,.5]);
        } else {
            translate([x,y,0]) color(couleurCasesNoires) cube([1,1,.5]);
            
            // Conception des pieces
            if(!(search(x, rangeesExclues))) {
                if(search(x, rangeesPiecesNoires)){
                    translate([x+.5,y+.5,.5]) color(couleurPiecesNoires) cylinder(r=.5,h=.2, $fn = 50);
                }else{
                    translate([x+.5,y+.5,.5]) color(couleurPiecesBlanches) cylinder(r=.5,h=.2, $fn = 50);
                 }
            }
        }
    }
}