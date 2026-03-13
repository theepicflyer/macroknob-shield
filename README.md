# MacroKnob Shield

A ZMK dongle shield for the [MacroKnob](https://github.com/davidphilipbarr/macroknob).
Lets a Nice!Nano act as a USB/wireless receiver for an existing ZMK split keyboard.

## Getting started

1. Fork or clone this repo.
2. Follow the `// STEP N:` comments in the files under `boards/shields/macroknob/`
   in order (Steps 1–5).
3. Push to GitHub — Actions will build your firmware automatically.

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
