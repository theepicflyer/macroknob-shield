#!/bin/bash
work_dir=$(pwd)
cd ../zmk
git pull

source .venv/bin/activate

cd app/

west config build.cmake-args   -- "-DZMK_CONFIG=$work_dir/config"

echo "No previous builds found, pristine building."
west build -p -d build/macroknob -b nice_nano_v2 -S studio-rpc-usb-uart -- -DSHIELD=macroknob -DZMK_EXTRA_MODULES=$work_dir -DCONFIG_ZMK_STUDIO=y
west build -p -d build/settings_reset -b nice_nano_v2 -- -DSHIELD=settings_reset -DZMK_EXTRA_MODULES=$work_dir

output_dir=$work_dir/uf2
mkdir -p $output_dir

cp -v build/macroknob/zephyr/zmk.uf2 $output_dir/macroknob.uf2
cp -v build/settings_reset/zephyr/zmk.uf2 $output_dir/macroknob-settings-reset.uf2