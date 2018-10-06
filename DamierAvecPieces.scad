// Conception du damier

// couleur des cases pour les noirs : 0.65, 0.49, 0.36 #a67d5d
// couleur des cases pour les blancs : 0.91, 0.82, 0.67 #e8d0aa
couleurCasesNoires = [.65, .49, .36];
couleurCasesBlanches = [.91, .82, .67];

for(x = [0:9]){
    for(y = [0:9]){
        if( ( x + y ) % 2 == 0){
            translate([x,y,0]) color(couleurCasesBlanches) cube([1,1,.5]);
        } else {
            translate([x,y,0]) color(couleurCasesNoires) cube([1,1,.5]);
        }
    }
}
