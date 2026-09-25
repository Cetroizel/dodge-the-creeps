# Dodge the Creeps — POC d'apprentissage Godot 4

Le tutoriel officiel [« Your first 2D game »](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/index.html), terminé, puis transformé en terrain d'exercice : chaque modification personnelle applique **un design pattern précis** plutôt que la première solution qui fonctionne.

Ce n'est pas un jeu destiné à être joué. C'est un support pour ancrer des concepts d'architecture dans du code qui tourne.

## Les étapes

Le highscore persistant (autoload `GameState` et sauvegarde JSON) a été ajouté avant la roadmap. Tout le reste suit la roadmap, une étape par session et une issue par étape :

| Étape | Modification | Pattern | Issue |
|---|---|---|---|
| 0.1 | Typage statique sur les cinq scripts | — | [#2](https://github.com/Cetroizel/dodge-the-creeps/issues/2) |
| 0.2 | Rangement par feature | — | [#17](https://github.com/Cetroizel/dodge-the-creeps/issues/17) |
| 1.1 | `MobType` en Resource | Composition, Flyweight | [#3](https://github.com/Cetroizel/dodge-the-creeps/issues/3) |
| 1.2 | `MobSpawner` | Factory | [#4](https://github.com/Cetroizel/dodge-the-creeps/issues/4) |
| 2.1 | Strategy à comportement identique | Strategy | [#5](https://github.com/Cetroizel/dodge-the-creeps/issues/5) |
| 2.2 | Mobs qui poursuivent et qui zigzaguent | Strategy | [#6](https://github.com/Cetroizel/dodge-the-creeps/issues/6) |
| 3.1 | Score découplé de l'interface | Observer | [#7](https://github.com/Cetroizel/dodge-the-creeps/issues/7) |
| 4.1 | Machine à états globale du jeu | Singleton, machine à états | [#8](https://github.com/Cetroizel/dodge-the-creeps/issues/8) |
| 4.2 | Power-up temporaire | State | [#9](https://github.com/Cetroizel/dodge-the-creeps/issues/9) |
| 5.1 | Difficulté par vagues (`WaveData`) | Flyweight, entité de jointure promue | [#10](https://github.com/Cetroizel/dodge-the-creeps/issues/10) |
| 6.1 | Pool de mobs, justifié par une mesure | Object Pool | [#11](https://github.com/Cetroizel/dodge-the-creeps/issues/11) |
| 6.2 | Fond défilant à bandes recyclées | Fenêtre glissante | [#12](https://github.com/Cetroizel/dodge-the-creeps/issues/12) |
| 7.1 | Sauvegarde étendue et versionnée | Memento | [#13](https://github.com/Cetroizel/dodge-the-creeps/issues/13) |
| 7.2 | Tests unitaires avec gdUnit4 | — | [#14](https://github.com/Cetroizel/dodge-the-creeps/issues/14) |
| 8.1 | Remapping des touches | Command | [#15](https://github.com/Cetroizel/dodge-the-creeps/issues/15) |
| 8.2 | Déblocages en bitmask | Flag set | [#16](https://github.com/Cetroizel/dodge-the-creeps/issues/16) |

**L'avancement se suit sur les [jalons](https://github.com/Cetroizel/dodge-the-creeps/milestones)** : une issue fermée est une étape faite, et le commit qui la clôt est lié depuis l'issue.

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
