#!/bin/bash
work_dir=$(pwd)
cd ../zmk
git pull

source .venv/bin/activate

cd app/

west config build.cmake-args   -- "-DZMK_CONFIG=$work_dir/config"

if [ -d "build/macroknob_dongle" ] && [ -d "build/macroknob_lily58_left" ] && [ -d "build/macroknob_lily58_right" ] && [ -d "build/settings_reset" ]; then
    echo "Build directories exist"
    west build -d build/macroknob_dongle
    west build -d build/macroknob_lily58_left
    west build -d build/macroknob_lily58_right
    west build -d build/settings_reset
else
    echo "No previous builds found, pristine building."
    west build -p -d build/macroknob_dongle -b nice_nano_v2 -S studio-rpc-usb-uart -S zmk-usb-logging -- -DSHIELD=macroknob_dongle -DZMK_EXTRA_MODULES=$work_dir -DCONFIG_ZMK_STUDIO=y
    west build -p -d build/macroknob_lily58_left -b nice_nano_v2 -- -DSHIELD=macroknob_lily58_left -DZMK_EXTRA_MODULES=$work_dir -DCONFIG_ZMK_STUDIO=y
    west build -p -d build/macroknob_lily58_right -b nice_nano_v2 -- -DSHIELD=macroknob_lily58_right -DZMK_EXTRA_MODULES=$work_dir -DCONFIG_ZMK_STUDIO=y
    west build -p -d build/settings_reset -b nice_nano_v2 -- -DSHIELD=settings_reset -DZMK_EXTRA_MODULES=$work_dir
fi

output_dir=$work_dir/uf2
mkdir -p $output_dir

cp -v build/macroknob_dongle/zephyr/zmk.uf2 $output_dir/macroknob_dongle.uf2
cp -v build/macroknob_lily58_left/zephyr/zmk.uf2 $output_dir/macroknob_lily58_left.uf2
cp -v build/macroknob_lily58_right/zephyr/zmk.uf2 $output_dir/macroknob_lily58_right.uf2
cp -v build/settings_reset/zephyr/zmk.uf2 $output_dir/macroknob_settings_reset.uf2