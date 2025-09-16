[🏠 Retour à l'Accueil](../README_FR.md)

# ➕ BRENT-KUNG - Additionneur 4-bit

> **Additionneur parallèle ultra-rapide**

🇺🇸 [English version](brent-kung.md)

## 🔌 Connexions

### Sélection: `ui_in[7:6] = 00`

```
┌─────────────────┬─────────┬─────────────────────┐
│      PIN        │   DIR   │      FONCTION       │
├─────────────────┼─────────┼─────────────────────┤
│ ui_in[3:0]     │   IN    │ 🅰️ Nombre A (4-bit) │
│ uio_in[3:0]    │   IN    │ 🅱️ Nombre B (4-bit) │
│ uio_in[7]      │   IN    │ ➕ Retenue entrée   │
│ uo_out[4:0]    │   OUT   │ 📊 Somme (5-bit)    │
│ uo_out[7:5]    │   OUT   │ 🚫 Toujours 000     │
└─────────────────┴─────────┴─────────────────────┘
```

## 📊 Exemples

### Addition simple
```
🅰️ = 1010 (10)  →  ui_in[3:0]  = 1010
🅱️ = 0110 (6)   →  uio_in[3:0] = 0110  
➕ = 0         →  uio_in[7]   = 0
                 uo_out[4:0] = 10000 (16)
```

### Avec retenue
```
🅰️ = 1111 (15) →  ui_in[3:0]  = 1111
🅱️ = 0001 (1)  →  uio_in[3:0] = 0001
➕ = 1         →  uio_in[7]   = 1
                 uo_out[4:0] = 10001 (17)
```


## 🏗️ Fonctionnement

### Structure de l'Algorithme
L'algorithme Brent-Kung utilise une structure arborescente pour calculer les retenues en parallèle sur plusieurs étapes :

![Étapes Algorithme Brent-Kung](step0_4.png)

*Calcul de retenues parallèles en 4 étapes montrant la propagation dans la structure arborescente*

### Implémentation 4-bit
Cette implémentation spécifique montre la disposition complète du circuit pour l'addition 4-bit :

![Implémentation 4-bit](brent4.png)

*Circuit complet de l'additionneur Brent-Kung 4-bit avec toutes les étapes et interconnexions*

## 📂 Source
- Fichier: `src/brent-kung.v:38-85`

---
[🏠 Retour à l'Accueil](../README_FR.md)