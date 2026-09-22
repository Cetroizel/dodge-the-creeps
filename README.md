# Dodge the Creeps — POC d'apprentissage Godot 4

Le tutoriel officiel [« Your first 2D game »](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/index.html), terminé, puis transformé en terrain d'exercice : chaque modification personnelle applique **un design pattern précis** plutôt que la première solution qui fonctionne.

Ce n'est pas un jeu destiné à être joué. C'est un support pour ancrer des concepts d'architecture dans du code qui tourne.

## État des modifications

| # | Modification | Pattern visé | État |
|---|---|---|---|
| 1 | Highscore persistant | Autoload + sérialisation JSON | ✅ fait |
| 2 | Nouveau type de mob | Strategy | en cours |
| 3 | Score découplé de l'interface | Observer | à faire |
| 4 | Power-up temporaire | State | à faire |
| 5 | Difficulté progressive | Flyweight, relation avec payload | à faire |
| 6 | Fond défilant | Fenêtre glissante, recyclage | à faire |
| 7 | Sauvegarde étendue et tests unitaires | Memento | à faire |

## La roadmap détaillée

Elle vit dans un autre dépôt, et c'est volontaire :

**[Cetroizel/godot-retro-architecture → `prochaines-etapes.md`](https://github.com/Cetroizel/godot-retro-architecture/blob/main/prochaines-etapes.md)**

Ce dépôt-là contient le décorticage architectural de huit jeux classiques — Pokémon Rouge/Bleu, Zelda 1 et 2, Super Mario Bros., Final Fantasy, Metroid, Sonic, F-Zero — analysés selon une grille en quatre niveaux et vérifiés contre les désassemblages communautaires.

La roadmap y est parce que chaque étape renvoie à l'analyse qui l'éclaire. Le power-up en State, par exemple, s'appuie sur un bug documenté de Sonic 1 où les capteurs de collision ne sont pas repositionnés en roulade : l'état change une dimension du personnage, et tout ce qui consomme cette dimension doit suivre. Déplacée ici, la roadmap perdrait ces renvois et ne serait plus qu'une liste de tâches.

Pour comprendre la démarche sans lire les 330 Ko du corpus : [`CONTEXTE.md`](https://github.com/Cetroizel/godot-retro-architecture/blob/main/CONTEXTE.md).

## Faire tourner le projet

Godot **4.7** ou plus récent — `project.godot` déclare `config/features=PackedStringArray("4.7", "Forward Plus")`, donc une version antérieure refusera d'ouvrir le projet.

```bash
git clone https://github.com/Cetroizel/dodge-the-creeps.git
```

Puis ouvrir le dossier dans Godot et lancer avec F5.

## Notes sur le dépôt

Les exports du jeu (`.exe`, `.pck`) et les addons d'outillage d'éditeur ne sont pas versionnés : ce sont des artefacts de build ou des dépendances locales réinstallables, et ils pesaient 128 Mo. Voir `.gitignore`.

Les assets graphiques et sonores proviennent du tutoriel officiel Godot. La police Xolonium est distribuée avec sa licence dans `fonts/`.

## Conventions de code

- Indentation par **tabulations réelles**, jamais d'espaces
- Typage statique sur les signatures de fonction et les variables
- Un commit par modification, avec le pattern nommé dans le message
