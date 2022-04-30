#!/usr/bin/env bash

# Usage: ci-build-firmware.sh

set -e

: "${TAG:="$(date "+%Y%m%d%H%M%S")"}"

subdir="keyboards/keychron/k6/keymaps/ansi-j4"

if [[ -d "qmk_firmware/$subdir" ]]; then
  rm -rf "qmk_firmware/$subdir"
fi

cp -rp "$subdir" qmk_firmware/keyboards/keychron/k6/keymaps

(cd qmk_firmware &&
  make -j4 keychron/k6/rgb/ansi:ansi-j4 COLOR=false &&
  mv keychron_k6_rgb_ansi_ansi-j4.bin ../build/"keychron-k6-ansi-j4-$TAG.bin")
