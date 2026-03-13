# MacroKnob Shield — AI Agent Instructions

This repo is a ZMK dongle shield that lets a Nice!Nano act as a wireless
receiver for an existing ZMK keyboard. The template files in
`boards/shields/macroknob/` need to be filled in for the target keyboard.

## How to help the user

Ask the following questions **one at a time** before making any edits:

### Question 1 — Target keyboard

> "Which keyboard are you adding to the MacroKnob dongle?
> (e.g. Corne, Kyria, Sofle, Lily58, Reviung41, ...)"

### Question 2 — Split or unibody

> "Is that keyboard a split (two separate halves) or a unibody (one piece)?"

This affects `ZMK_SPLIT_BLE_CENTRAL_PERIPHERALS` (2 for split, 1 for unibody) and
the cmake-arg snippet the user needs to add to their existing keyboard repo.

### Question 3 — Existing config

> "Do you have an existing ZMK config repo for that keyboard, or should we
> use the default ZMK keymap for it?
>
> - If you have one: please share the repo URL or paste the contents of
>   the relevant files (keymap, dtsi, overlay).
> - If not: I'll look up the default ZMK config for your keyboard."

---

## Before editing the shield files

Tell the user they also need to update their **existing keyboard repo's** `build.yaml`.
Add `-DCONFIG_ZMK_SPLIT_ROLE_CENTRAL=n` to each peripheral's cmake-args:

- **Split keyboard:**
  ```yaml
  - board: nice_nano_v2
    shield: my_keyboard_left
    cmake-args: -DCONFIG_ZMK_SPLIT_ROLE_CENTRAL=n
  - board: nice_nano_v2
    shield: my_keyboard_right
    cmake-args: -DCONFIG_ZMK_SPLIT_ROLE_CENTRAL=n
  ```
- **Unibody keyboard:**
  ```yaml
  - board: nice_nano_v2
    shield: my_keyboard
    cmake-args: -DCONFIG_ZMK_SPLIT=y -DCONFIG_ZMK_SPLIT_ROLE_CENTRAL=n
  ```

This is a prerequisite — without it the keyboard halves will still try to act as
central and conflict with the MacroKnob dongle.

## Once you have the answers

Work through the STEP comments in order across the following files:

| Step | File |
|------|------|
| STEP 1 | `boards/shields/macroknob/Kconfig.defconfig` |
| STEP 2 | `boards/shields/macroknob/macroknob.dtsi` |
| STEP 3 | `boards/shields/macroknob/macroknob-layouts.dtsi` |
| STEP 4 | `boards/shields/macroknob/macroknob.keymap` |
| STEP 5 | `boards/shields/macroknob/macroknob.overlay` |

Read each file before editing it. Follow the STEP comments exactly.
Do not modify anything outside the STEP markers.

After all steps are done, commit with a descriptive message naming the keyboard.
