 /* couleur des cases pour les noirs : 0.65, 0.49, 0.36 #a67d5d
  couleur des cases pour les blancs : 0.91, 0.82, 0.67 #e8d0aa
  couleur des pieces pour les blancs : 0.96, 0.76, 0.29 #f5c14b
  couleur des pieces pour les noirs : 0.51, 0.41, 0.36 #83695c
*/

var avecPieces = 0;
var couleurCasesNoires = [0.65, 0.49, 0.36];
var couleurCasesBlanches = [0.91, 0.82, 0.67];
var couleurPiecesBlanches = [0.96, 0.76, 0.29];
var couleurPiecesNoires = [0.51, 0.41, 0.36];
var epaisseurDamier = 0.5;
var epaisseurPieces = 0.2;
var rangeesExclues = [4,5];
var rangeesPiecesNoires = [0,1,2,3];
var result;

function main() {
    var o = [];
  // Conception du damier
    for(var x = 0; x<10; x++)
    {
        for(var y = 0; y<10; y++)
        {
            if( ( x + y ) % 2 === 0)
            {
                o.push(translate([x,y,0], cube({size:[1,1,epaisseurDamier]}).setColor(couleurCasesBlanches)));
            } 
            else 
            {
                o.push(translate([x,y,0], cube({size:[1,1,epaisseurDamier]}).setColor(couleurCasesNoires)));
                
                //Conception des pièces
                
                //Si x ne se trouve pas dans la liste des rangées exclues
                if(!rangeesExclues.includes(x)) 
                {
                    if(rangeesPiecesNoires.includes(x))
                    {
                        /*On n'oublie pas d'ajouter le rayon des pieces à x et y pour la translation
                        $fn correspond au nombre de fragements 
                        pour rendre la pièce plus circulaire */
                        o.push(translate([x+0.5,y+0.5,0.5], cylinder({r:0.5,h:epaisseurPieces, $fn:50}).setColor(couleurPiecesNoires)));
                    }
                    else
                    {
                        // Pour représenter la dame
                        if((x == 9) && (y == 4)) 
                        {
                            o.push(translate([x+0.5,y+0.5,0.5], cylinder({r:0.5,h:epaisseurPieces, $fn:6}).setColor(couleurPiecesBlanches)));
                        }
                        else
                        {
                            o.push(translate([x+0.5,y+0.5,0.5], cylinder({r:0.5,h:epaisseurPieces, $fn:50}).setColor(couleurPiecesBlanches)));
                        }
                    }
                }
            }
        }
    }
    
     return o;
}
