# macroknob-shield
A simple 2-key, 1 rotary encoder shield for ZMK. Designed to complement any ZMK keyboard as a dongle.

This repo contains the firmware required to use the MacroKnob. The PCB and case files can be found here: https://github.com/theepicflyer/macroknob

# Standalone vs Dongle
The Macroknob can be used two ways.

1. To use it standalone, as just a macropad, the firmware in this repo can be built and used as-is.
2. To use it as a dongle for another ZMK keyboard, follow the guide below and the instructions in each file to integrate the configuration from your existing keyboard into this.

# Dongle mode
As a high level overview, you will build your existing keyboard's firmware as per usual, with a slight modification to the build options, while you will build the MacroKnob's firmware separately. The MacroKnob's firmware needs to be configured specifically for your keyboard before building, and this repo can be used as a base for your modifications.

The 'lily58' branch is an example for the SplitKB Lily58. It is the configuration I use for my own daily driver.
