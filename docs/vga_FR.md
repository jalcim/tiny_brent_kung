# 📺 VGA - Générateur de Signal Vidéo

> **VGA 640x480 avec pattern animé**

🇺🇸 [English version](vga.md)

## 🔌 Broches

### Sélection: `ui_in[7:6] = 01`

```
┌─────────────────┬─────────┬─────────────────────┐
│     BROCHE      │   DIR   │      FONCTION       │
├─────────────────┼─────────┼─────────────────────┤
│ uo_out[7]      │   OUT   │ HSYNC               │
│ uo_out[6]      │   OUT   │ BLUE[1]             │
│ uo_out[5]      │   OUT   │ GREEN[1]            │
│ uo_out[4]      │   OUT   │ RED[1]              │
│ uo_out[3]      │   OUT   │ VSYNC               │
│ uo_out[2]      │   OUT   │ BLUE[0]             │
│ uo_out[1]      │   OUT   │ GREEN[0]            │
│ uo_out[0]      │   OUT   │ RED[0]              │
└─────────────────┴─────────┴─────────────────────┘
```

## 📱 Sortie

- **Résolution**: 640x480 @ 60Hz
- **Couleurs**: RGB 2-bit (64 couleurs)
- **Pattern**: Barres horizontales animées
- **Autonome**: Aucune entrée requise

## 📂 Source
- Fichier: `src/vga.v:8-126`