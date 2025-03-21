#!/usr/bin/env bash

set -eu

PWD=$(pwd)
TIMESTAMP="${TIMESTAMP:-$(date -u +"%Y%m%d%H%M")}"
COMMIT="${COMMIT:-$(echo xxxxxx)}"

ls -la ${PWD}
# West Build (left)
ls -la ${PWD}/config

west build -s zmk/app -p -d build/left -b adv360_left -S studio-rpc-usb-uart -- -DZMK_CONFIG="${PWD}/config" -DCONFIG_ZMK_STUDIO=y
# Adv360 Left Kconfig file
grep -vE '(^#|^$)' build/left/zephyr/.config
# Rename zmk.uf2
cp build/left/zephyr/zmk.uf2 "./firmware/${TIMESTAMP}-${COMMIT}-left-clique.uf2"

# Build right side if selected
if [ "${BUILD_RIGHT}" = true ]; then
    ls -la ${PWD}/config
    # West Build (right)
    west build -s zmk/app -p -d build/right -b adv360_right -- -DZMK_CONFIG="${PWD}/config"
    # Adv360 Right Kconfig file
    grep -vE '(^#|^$)' build/right/zephyr/.config
    # Rename zmk.uf2
    cp build/right/zephyr/zmk.uf2 "./firmware/${TIMESTAMP}-${COMMIT}-right-clique.uf2"
fi
