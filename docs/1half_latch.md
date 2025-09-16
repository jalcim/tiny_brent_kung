# 🎵 1HALF - Sigma-Delta Audio Latch

> **1.5-bit latch preventing simultaneous transistor switching**

🇫🇷 [Version française](1half_latch_FR.md)

## 🔌 Pins

### Selection: `ui_in[7:6] = 10`

```
┌─────────────────┬─────────┬─────────────────────┐
│      PIN        │   DIR   │      FUNCTION       │
├─────────────────┼─────────┼─────────────────────┤
│ ui_in[3:0]     │   IN    │ in_p[3:0]           │
│ uio_in[3:0]    │   IN    │ in_n[3:0]           │
│ uo_out[7:0]    │   OUT   │ 4x {out_p, out_n}   │
└─────────────────┴─────────┴─────────────────────┘
```

## ⚠️ Safety Logic

Prevents forbidden state `11` (both transistors ON):
- `00` = Both OFF ✅
- `01` = N-transistor ON ✅  
- `10` = P-transistor ON ✅
- `11` = Both ON ❌ **BLOCKED**

## 🔄 Operation

4 independent latches, each with:
- Clock-synchronized operation
- Forbidden state protection
- Class-D amplifier safe switching

## 📂 Source
- File: `src/1half_latch.v:23-43`