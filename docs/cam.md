# 📋 CAM - Content-Addressable Memory

> **16x8 bit associative memory for fast lookup**

🇫🇷 [Version française](cam_FR.md)

## 🔌 Pins

### Selection: `ui_in[7:6] = 00`

```
┌─────────────────┬─────────┬─────────────────────┐
│      PIN        │   DIR   │      FUNCTION       │
├─────────────────┼─────────┼─────────────────────┤
│ ui_in[5]       │   IN    │ WRITE (1=write)     │
│ ui_in[4:0]     │   IN    │ ADDRESS[4:0]        │
│ uio_in[7:0]    │   IN    │ DATA[7:0]           │
│ uo_out[5]      │   OUT   │ FOUND               │
│ uo_out[4:0]    │   OUT   │ MATCH_ADDR[4:0]     │
│ uo_out[7:6]    │   OUT   │ Always 00           │
└─────────────────┴─────────┴─────────────────────┘
```

## 🔄 Operations

### Write Mode
```
ui_in[5] = 1 (WRITE)
ui_in[4:0] = address
uio_in[7:0] = data to store
```

### Search Mode
```
ui_in[5] = 0 (SEARCH)
uio_in[7:0] = data to find
→ uo_out[5] = 1 if found
→ uo_out[4:0] = address where found
```

## 💾 Memory

- **Capacity**: 16 entries × 8 bits
- **Search**: Parallel (all entries checked simultaneously)
- **Speed**: Single cycle lookup

## 📂 Source
- File: `src/cam.v:1-75`