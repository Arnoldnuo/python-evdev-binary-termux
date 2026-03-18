#!/usr/bin/env bash
# ============================================================
# build_evdev_wheel.sh

## 下载源码
pip download evdev --no-binary :all: -d ./src

## 编译，CFLAGS和C_INCLUDE_PATH是必需的，否则在termux下编译会报错
CFLAGS="-I$PREFIX/include" C_INCLUDE_PATH="$PREFIX/include" pip wheel ./src/evdev-1.9.3.tar.gz -w ./wheels

## 修改tag为android_24_arm64_v8a，否则在termux下安装会报错
python -m wheel tags --platform-tag android_24_arm64_v8a \
  ./wheels/evdev-1.9.3-cp312-cp312-linux_aarch64.whl