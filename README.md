# macroknob-shield
A simple 2-key, 1 rotary encoder shield for ZMK. Designed to complement any ZMK keyboard as a dongle.

This repo contains the firmware required to use the Macroknob. The PCB and case files can be found here: https://github.com/theepicflyer/macroknob

# Standalone vs Dongle
The Macroknob can be used two ways.

1. To use it standalone, as just a macropad, the firmware in this repo can be built and used as-is.
2. To use it as a dongle for another ZMK keyboard, follow the guide below and the instructions in each file to integrate the configuration from your existing keyboard into this.

# Dongle mode
As a high level overview, you will modify slightly our existing keyboard's firmware, then build it as per usual in your existing repo. You will then build the Macroknob's firmware using this repo as a template. The Macroknob's firmware needs to be configured specifically for your keyboard before building, and you can follow the instructions in this repo.

The 'splitkb_aurora_lily58' branch is an example for the SplitKB Lily58. It is the configuration I use for my own daily driver.
