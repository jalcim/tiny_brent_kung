# 🎵 1HALF - Latch Audio Sigma-Delta

> **Latch 1.5-bit empêchant la commutation simultanée des transistors**

🇺🇸 [English version](1half_latch.md)

## 🔌 Broches

### Sélection: `ui_in[7:6] = 10`

```
┌─────────────────┬─────────┬─────────────────────┐
│     BROCHE      │   DIR   │      FONCTION       │
├─────────────────┼─────────┼─────────────────────┤
│ ui_in[3:0]     │   IN    │ in_p[3:0]           │
│ uio_in[3:0]    │   IN    │ in_n[3:0]           │
│ uo_out[7:0]    │   OUT   │ 4x {out_p, out_n}   │
└─────────────────┴─────────┴─────────────────────┘
```

## ⚠️ Logique de Sécurité

Empêche l'état interdit `11` (les deux transistors ON):
- `00` = Les deux OFF ✅
- `01` = Transistor N ON ✅  
- `10` = Transistor P ON ✅
- `11` = Les deux ON ❌ **BLOQUÉ**

## 🔄 Fonctionnement

4 latches indépendants, chacun avec:
- Fonctionnement synchronisé à l'horloge
- Protection état interdit
- Commutation sûre pour amplificateur classe-D

## 📂 Source
- Fichier: `src/1half_latch.v:23-43`