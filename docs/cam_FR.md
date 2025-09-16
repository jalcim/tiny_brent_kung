# 📋 CAM - Mémoire Associative

> **Mémoire associative 16x8 bit pour recherche rapide**

🇺🇸 [English version](cam.md)

## 🔌 Broches

### Sélection: `ui_in[7:6] = 00`

```
┌─────────────────┬─────────┬─────────────────────┐
│     BROCHE      │   DIR   │      FONCTION       │
├─────────────────┼─────────┼─────────────────────┤
│ ui_in[5]       │   IN    │ WRITE (1=écriture)  │
│ ui_in[4:0]     │   IN    │ ADRESSE[4:0]        │
│ uio_in[7:0]    │   IN    │ DONNÉES[7:0]        │
│ uo_out[5]      │   OUT   │ TROUVÉ              │
│ uo_out[4:0]    │   OUT   │ ADDR_TROUVÉE[4:0]   │
│ uo_out[7:6]    │   OUT   │ Toujours 00         │
└─────────────────┴─────────┴─────────────────────┘
```

## 🔄 Opérations

### Mode Écriture
```
ui_in[5] = 1 (ÉCRITURE)
ui_in[4:0] = adresse
uio_in[7:0] = données à stocker
```

### Mode Recherche
```
ui_in[5] = 0 (RECHERCHE)
uio_in[7:0] = données à chercher
→ uo_out[5] = 1 si trouvé
→ uo_out[4:0] = adresse où trouvé
```

## 💾 Mémoire

- **Capacité**: 16 entrées × 8 bits
- **Recherche**: Parallèle (toutes entrées vérifiées simultanément)
- **Vitesse**: Recherche en un cycle

## 📂 Source
- Fichier: `src/cam.v:1-75`