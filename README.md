# macroknob-shield — `splitkb_aurora_lily58` branch

> **You are on a keyboard-specific branch, not the template.**
> This branch is the finished MacroKnob dongle config for the SplitKB Aurora
> Lily58 — it is the dongle firmware for my daily driver. Build from here to get
> a working Lily58 dongle. Start from [`main`](../../tree/main) instead if you
> are setting up the MacroKnob for a different keyboard.

A simple 2-key, 1 rotary encoder shield for ZMK. Designed to complement any ZMK keyboard as a dongle.

This repo contains the firmware required to use the Macroknob. The PCB and case files can be found here: https://github.com/theepicflyer/macroknob

## What lives where

The MacroKnob is spread across three repos plus a branch. This is the map:

| Repo / branch | What it is |
|---|---|
| [`macroknob`](https://github.com/theepicflyer/macroknob) | The hardware — KiCad PCB and case files. No firmware. |
| [`macroknob-shield`](../../tree/main) (`main`) | The fill-in-the-blanks **template**. Follow the `// STEP N:` comments to port the MacroKnob to any keyboard. |
| `macroknob-shield` → `splitkb_aurora_lily58` | **This branch.** The template filled in for the Aurora Lily58. Builds the dongle firmware. |
| [`macroknob-shield`](../../tree/splitkb_aurora_sofle) → `splitkb_aurora_sofle` | Same, for the Aurora Sofle. A second worked example. |
| [`lily58`](https://github.com/theepicflyer/lily58) | The **keyboard-side** firmware for both Aurora Lily58s — the halves, not the dongle. |
| `lily58-nice`, `lily58-zmk`, `macroknob-dongle` | Archived. Superseded, kept for history only. |

### Which firmware goes on which board

The dongled Lily58 needs firmware from **two** repos — this branch for the
MacroKnob, and [`lily58`](https://github.com/theepicflyer/lily58) for the halves:

| Board | Artifact | From |
|---|---|---|
| MacroKnob (dongle, central) | `macroknob-nice_nano_v2` | this branch |
| Lily58 left — dongled | `splitkb_aurora_lily58_left_dongled` | `lily58` |
| Lily58 right — either setup | `splitkb_aurora_lily58_right-nice_nano_v2` | `lily58` |
| Lily58 left — standalone, no dongle | `splitkb_aurora_lily58_left-nice_nano_v2` | `lily58` |

The right half is always a peripheral, so the same artifact serves both the
dongled and the standalone keyboard. Only the left half differs: dongled builds
with `CONFIG_ZMK_SPLIT_ROLE_CENTRAL=n`, standalone builds as central.

Because the dongle is the central, **this branch's keymap is the one that's
live** whenever the dongle is in use. The keymap in `lily58` only takes effect
on the standalone keyboard.

# Standalone vs Dongle
The Macroknob can be used two ways.

1. To use it standalone, as just a macropad, the firmware in this repo can be built and used as-is.
2. To use it as a dongle for another ZMK keyboard, follow the guide below and the instructions in each file to integrate the configuration from your existing keyboard into this.

# Dongle mode
As a high level overview, you will modify slightly our existing keyboard's firmware, then build it as per usual in your existing repo. You will then build the Macroknob's firmware using this repo as a template. The Macroknob's firmware needs to be configured specifically for your keyboard before building, and you can follow the instructions in this repo.

## In this repo
Look at every file in [this directory](boards/shields/macroknob) and follow the instructions in each file. Keep your existing keyboard's repo open to copy some of the config over.

## In your existing keyboard repo
Add the `-DCONFIG_ZMK_SPLIT_ROLE_CENTRAL` cmake-arg to your existing keyboard's build options:

```yaml
# build.yml
  - board: nice_nano_v2
    shield: my_existing_keyboard_left
    cmake-args: -DCONFIG_ZMK_SPLIT_ROLE_CENTRAL=n

  - board: nice_nano_v2
    shield: my_existing_keyboard_right
    cmake-args: -DCONFIG_ZMK_SPLIT_ROLE_CENTRAL=n
```

If your existing keyboard is a unibody (i.e. not split), it will be treated as a split with the dongle. Hence you will also need to add that arg:
```yaml
include:
  - board: nice_nano_v2
    shield: my_existing_keyboard
    cmake-args: -DCONFIG_ZMK_SPLIT=y -DCONFIG_ZMK_SPLIT_ROLE_CENTRAL=n
```


All of the above is already done on this branch — the steps are here for
reference, and for when you port the MacroKnob to another keyboard from
[`main`](../../tree/main).
