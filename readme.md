# Damier Openscad

##Introduction 

Module pour faire un damier avec ses pièces.

Le module affiche par défaut le damier sans les pièces.
```
damier ();
```

Pour afficher le damier avec ses pièces utiliser le code suivant :
```
damier (avecPieces = 1);
```

Pour changer la couleur des pièces :
```
damier (avecPieces = 1, couleurPiecesBlanches="white",couleurPiecesNoires="black");
```

Pour changer la couleur des cases du damier :
```
damier (avecPieces = 0, couleurCasesBlanches="white",couleurCasesNoires="black");
```

Code avec tout les paramètres disponibles :
```
damier (avecPieces = 0, couleurCasesNoires = [.65, .49, .36], couleurCasesBlanches = [.91, .82, .67],couleurPiecesBlanches = [.96, .76, .29],couleurPiecesNoires = [.51, .41, .36],epaisseurDamier = .5,epaisseurPieces = .2);
```

## Résultat 
<blockquote class="imgur-embed-pub" lang="en" data-id="a/hl3vXor" data-context="false"><a href="//imgur.com/hl3vXor"></a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>
