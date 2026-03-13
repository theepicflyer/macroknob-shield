# MacroKnob Shield

A ZMK dongle shield for the [MacroKnob](https://github.com/theepicflyer/macroknob).
Lets a Nice!Nano act as a USB/wireless receiver for an existing ZMK keyboard.

## Standalone vs. dongle

The MacroKnob can be used two ways:

1. **Standalone** — as just a macropad. The firmware in this repo builds and works as-is.
2. **Dongle** — as a wireless receiver for another ZMK keyboard. Follow the guide below to integrate your keyboard's config into this repo.

## Getting started (dongle mode)

### In this repo

1. Fork or clone this repo.
2. Follow the `// STEP N:` comments in the files under `boards/shields/macroknob/`
   in order (Steps 1–5).
3. Push to GitHub — Actions will build your MacroKnob firmware automatically.

### In your existing keyboard repo

Add `-DCONFIG_ZMK_SPLIT_ROLE_CENTRAL=n` to each peripheral's cmake-args in your keyboard's `build.yaml`. This tells ZMK that those halves are no longer the central — the MacroKnob dongle is.

**Split keyboard (left + right halves):**
```yaml
# build.yaml
  - board: nice_nano_v2
    shield: my_keyboard_left
    cmake-args: -DCONFIG_ZMK_SPLIT_ROLE_CENTRAL=n

  - board: nice_nano_v2
    shield: my_keyboard_right
    cmake-args: -DCONFIG_ZMK_SPLIT_ROLE_CENTRAL=n
```

**Unibody keyboard:**
```yaml
# build.yaml
  - board: nice_nano_v2
    shield: my_keyboard
    cmake-args: -DCONFIG_ZMK_SPLIT=y -DCONFIG_ZMK_SPLIT_ROLE_CENTRAL=n
```

See the [`splitkb_aurora_sofle`](../../tree/splitkb_aurora_sofle) branch for a
fully worked example using the Aurora Sofle keyboard.

## AI-assisted setup

If you're using Claude Code or another AI agent, open this repo and ask it to
help you set up the MacroKnob for your keyboard. The `CLAUDE.md` file gives the
agent the context it needs to guide you through the steps.

## Files

| File | Purpose |
|------|---------|
| `Kconfig.defconfig` | Keyboard name, BLE peripheral count |
| `macroknob.dtsi` | Matrix transform, encoders, OLED/peripherals |
| `macroknob-layouts.dtsi` | Physical layout for ZMK Studio |
| `macroknob.keymap` | Key bindings per layer |
| `macroknob.overlay` | Row offset for the matrix transform |
| `macroknob.conf` | Encoder Kconfig flags |
| `build.yaml` | GitHub Actions build matrix |
