# Design: Improve Inline Documentation + CLAUDE.md

Date: 2026-03-13

## Goal

Improve the `main` branch template so users can follow it without external guidance.
Add a `CLAUDE.md` so an AI agent can guide users through the integration interactively.
Keep `splitkb_aurora_sofle` in sync as a readable reference implementation.

## Approach

**Option B: Numbered step system across files.**
Replace all `/**` / `// **` placeholder comments with a consistent `// STEP N:` numbering scheme.
Each step explains what to change and why, co-located with the code it describes.
A single reference to the Aurora Sofle branch lives in `README.md` only — not repeated inline.

## Global Step Order

| Step | File | What changes |
|------|------|--------------|
| 1 | `Kconfig.defconfig` | Keyboard name, peripheral count |
| 2 | `macroknob.dtsi` | Matrix columns/rows, transform map, encoder nodes, OLED/peripherals, sensors list |
| 3 | `macroknob-layouts.dtsi` | Physical key layout |
| 4 | `macroknob.keymap` | Includes, bindings per layer |
| 5 | `macroknob.overlay` | row-offset |

Each file gets a short header comment listing which steps it contains.
Each `// STEP N:` marker explains what to change and why at that exact line.

## Aurora Sofle Branch Changes

Every `// STEP N:` marker in `main` gets a matching `// (STEP N applied — <what was done>)` comment
in `splitkb_aurora_sofle` at the same location, so the reference branch stays readable.

## Bugs Fixed

- `build.yaml`: `CMAKE_ARGS` → `cmake-args` (wrong key, breaks Studio builds)
- `macroknob.conf`: Remove misleading `# Uncomment to enable encoder` (lines are already uncommented)
- `macroknob-layouts.dtsi`: Rewrite the `=` vs `,` trap as a clear STEP comment before the MacroKnob lines
- `macroknob.dtsi`: Fix the `RC(0,2)` example comment (`// E.g. The '5' here` doesn't match the `0` in code)

## README.md

Add a short section pointing to `splitkb_aurora_sofle` as the worked example. Single mention.

## CLAUDE.md

An AI agent reading this file should:

1. Ask: "Which keyboard are you adding to the MacroKnob dongle?" (e.g. Corne, Kyria, Sofle)
2. Ask: "Do you have an existing ZMK config/repo for that keyboard, or should we use the default ZMK keymap?"
   - If they have one: ask them to provide the repo URL or paste the relevant files
   - If not: look up the default ZMK keymap for that keyboard
3. Work through STEP 1–5 in order, making edits using the keyboard's source config
4. Do not modify anything outside the STEP markers

## Out of Scope

- Changing the MacroKnob's own hardware config (encoder, buttons)
- Adding support for non-ZMK keyboards
- README beyond the single branch reference note
