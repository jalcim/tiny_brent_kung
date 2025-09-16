[🏠 Back to Main](../README.md)

# ➕ BRENT-KUNG - Fast 4-bit Adder

> **Ultra-fast parallel adder • 3x faster than ripple carry**

🇫🇷 [Version française](brent-kung_FR.md)

## 🎯 What it does
Adds two 4-bit numbers + carry = 5-bit result in just 3 gate delays!

## 🔌 Pin Connections

### Selection: Set `ui_in[7:6] = 00`

```
┌─────────────────┬─────────┬─────────────────────┐
│      PIN        │   DIR   │      FUNCTION       │
├─────────────────┼─────────┼─────────────────────┤
│ ui_in[3:0]     │   IN    │ 🅰️ Number A (4-bit) │
│ uio_in[3:0]    │   IN    │ 🅱️ Number B (4-bit) │
│ uio_in[7]      │   IN    │ ➕ Carry In         │
│ uo_out[4:0]    │   OUT   │ 📊 Sum (5-bit)      │
│ uo_out[7:5]    │   OUT   │ 🚫 Always 000       │
└─────────────────┴─────────┴─────────────────────┘
```

## 📊 Examples

### Simple Addition
```
🅰️ = 1010 (10)  →  ui_in[3:0]  = 1010
🅱️ = 0110 (6)   →  uio_in[3:0] = 0110  
➕ = 0         →  uio_in[7]   = 0
                 uo_out[4:0] = 10000 (16)
```

### With Carry
```
🅰️ = 1111 (15) →  ui_in[3:0]  = 1111
🅱️ = 0001 (1)  →  uio_in[3:0] = 0001
➕ = 1         →  uio_in[7]   = 1
                 uo_out[4:0] = 10001 (17)
```

## ⚡ Performance

```
┌──────────────┬─────────────┬─────────────┐
│    METRIC    │ RIPPLE CARRY│ BRENT-KUNG  │
├──────────────┼─────────────┼─────────────┤
│ 🕐 Speed     │ 4 delays    │ 3 delays    │
│ 📐 Size      │ Small       │ Medium      │
│ 🔋 Power     │ Low         │ Medium      │
│ 🎯 Best for  │ Area        │ Speed       │
└──────────────┴─────────────┴─────────────┘
```

## 🏗️ How it Works

```mermaid
flowchart TD
    subgraph Stage0 ["Stage 0: Generate P,G"]
        A3B3["A₃B₃"] --> G3["G"]
        A2B2["A₂B₂"] --> G2["G"]
        A1B1["A₁B₁"] --> G1["G"]
        A0B0["A₀B₀"] --> G0["G"]
    end
    
    subgraph Stage1 ["Stage 1: Black cells"]
        G3 --> B31["B"]
        G2 --> B31
        G2 --> B21["B"]
        G1 --> B21
        G1 --> B10["B"]
        G0 --> B10
    end
    
    subgraph Stage2 ["Stage 2: More black"]
        B31 --> B32["B"]
        B21 --> B32
        B21 --> G2S2["G"]
    end
    
    subgraph Stage3 ["Stage 3: Final carry"]
        B32 --> GFINAL["G"]
        G2S2 --> GFINAL
    end
    
    GFINAL --> CARRY["Final Carry Output"]
```

**G** = Generate, **B** = Black (combine)

![Brent-Kung Algorithm Stages](step0_4.png)

![4-bit Implementation](brent4.png)

## 📂 Source
- File: `src/brent-kung.v:38-85`
- Self-contained (no dependencies)

---
[🏠 Back to Main](../README.md)