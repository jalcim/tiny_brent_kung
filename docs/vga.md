# 📺 VGA - Video Signal Generator

> **640x480 VGA with animated pattern**

🇫🇷 [Version française](vga_FR.md)

## 🔌 Pins

### Selection: `ui_in[7:6] = 01`

```
┌─────────────────┬─────────┬─────────────────────┐
│      PIN        │   DIR   │      FUNCTION       │
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

## 📱 Output

- **Resolution**: 640x480 @ 60Hz
- **Colors**: 2-bit RGB (64 colors)
- **Pattern**: Animated horizontal bars
- **Autonomous**: No input required

## 📂 Source
- File: `src/vga.v:8-126`