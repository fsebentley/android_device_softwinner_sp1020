#
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PACKAGE_OVERLAYS += device/softwinner/sp1020/overlay

# Build Stuff
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Kernel
LOCAL_PATH := device/softwinner/sp1020
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# init.rc, kernel
PRODUCT_COPY_FILES += \
    device/softwinner/sp1020/init.rc:root/init.rc \
    device/softwinner/sp1020/init.sp1020.rc:root/init.sp1020.rc \
    device/softwinner/sp1020/init.sp1020.usb.rc:root/init.sp1020.usb.rc \
    device/softwinner/sp1020/recovery/init_parttion.sh:root/sbin/init_parttion.sh \
    device/softwinner/sp1020/prebuilt/bin/busybox:root/sbin/busybox \
    device/softwinner/sp1020/prebuilt/modules/nand.ko:root/nand.ko \
    device/softwinner/sp1020/fstab.sp1020:root/fstab.sp1020 \
    device/softwinner/sp1020/recovery/ueventd.sun7i.rc:root/ueventd.sun7i.rc \
    device/softwinner/sp1020/prebuilt/bin/setrecovery:root/sbin/setrecovery

# Modules for recovery
PRODUCT_COPY_FILES += \
    device/softwinner/sp1020/prebuilt/modules/disp.ko:recovery/root/disp.ko \
    device/softwinner/sp1020/prebuilt/modules/hdmi.ko:recovery/root/hdmi.ko \
    device/softwinner/sp1020/prebuilt/modules/lcd.ko:recovery/root/lcd.ko \
    device/softwinner/sp1020/prebuilt/modules/nand.ko:recovery/root/nand.ko \
    device/softwinner/sp1020/prebuilt/modules/gslX680.ko:recovery/root/gslX680.ko

# Modules for /system/vendor/modules
PRODUCT_COPY_FILES += \
    device/softwinner/sp1020/prebuilt/modules/disp.ko:system/vendor/modules/disp.ko \
    device/softwinner/sp1020/prebuilt/modules/hdmi.ko:system/vendor/modules/hdmi.ko \
    device/softwinner/sp1020/prebuilt/modules/lcd.ko:system/vendor/modules/lcd.ko \
    device/softwinner/sp1020/prebuilt/modules/nand.ko:system/vendor/modules/nand.ko \
    device/softwinner/sp1020/prebuilt/modules/gslX680.ko:system/vendor/modules/gslX680.ko \
    device/softwinner/sp1020/prebuilt/modules/ump.ko:system/vendor/modules/ump.ko \
    device/softwinner/sp1020/prebuilt/modules/mali.ko:system/vendor/modules/mali.ko \
    device/softwinner/sp1020/prebuilt/modules/sw_device.ko:system/vendor/modules/sw_device.ko \
    device/softwinner/sp1020/prebuilt/modules/gc0329.ko:system/vendor/modules/gc0329.ko \
    device/softwinner/sp1020/prebuilt/modules/gc03291.ko:system/vendor/modules/gc03291.ko \
    device/softwinner/sp1020/prebuilt/modules/sunxi_csi0.ko:system/vendor/modules/sunxi_csi0.ko \
    device/softwinner/sp1020/prebuilt/modules/sunxi_csi1.ko:system/vendor/modules/sunxi_csi1.ko \
    device/softwinner/sp1020/prebuilt/modules/usbnet.ko:system/vendor/modules/usbnet.ko \
    device/softwinner/sp1020/prebuilt/modules/asix.ko:system/vendor/modules/asix.ko \
    device/softwinner/sp1020/prebuilt/modules/qf9700.ko:system/vendor/modules/qf9700.ko \
    device/softwinner/sp1020/prebuilt/modules/mcs7830.ko:system/vendor/modules/mcs7830.ko \
    device/softwinner/sp1020/prebuilt/modules/rtl8150.ko:system/vendor/modules/rtl8150.ko \
    device/softwinner/sp1020/prebuilt/modules/cdc_ether.ko:system/vendor/modules/cdc_ether.ko \
    device/softwinner/sp1020/prebuilt/modules/usbnet.ko:system/vendor/modules/usbnet.ko

#    device/softwinner/sp1020/prebuilt/modules/camera_led_con.ko:system/vendor/modules/camera_led_con.ko \
#    device/softwinner/sp1020/prebuilt/modules/cedarx.ko:system/vendor/modules/cedarx.ko \

# twrp.fstab
PRODUCT_COPY_FILES += \
    device/softwinner/sp1020/twrp.fstab:recovery/root/etc/twrp.fstab

# More Recovery Files
PRODUCT_COPY_FILES += \
    device/softwinner/sp1020/recovery/init_parttion.sh:recovery/root/sbin/init_parttion.sh \
    device/softwinner/sp1020/recovery/ueventd.sun7i.rc:recovery/root/ueventd.sun7i.rc \
    device/softwinner/sp1020/prebuilt/bin/busybox:recovery/root/sbin/busybox

# We should have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Include Proprietary files if they exist
$(call inherit-product-if-exists, vendor/softwinner/sp1020/sp1020-vendor.mk)

# Copy idc,kl stuffs
PRODUCT_COPY_FILES += \
    device/softwinner/sp1020/prebuilt/usr/sw-keyboard.kl:system/usr/keylayout/sw-keyboard.kl \
    device/softwinner/sp1020/prebuilt/usr/tp.idc:system/usr/idc/tp.idc

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth.xml

# EGL
PRODUCT_COPY_FILES += \
    device/softwinner/sp1020/prebuilt/lib/egl/libEGL_mali.so:system/lib/egl/libEGL_mali.so \
    device/softwinner/sp1020/prebuilt/lib/egl/libGLESv1_CM_mali.so:system/lib/egl/libGLESv1_CM_mali.so \
    device/softwinner/sp1020/prebuilt/lib/egl/libGLESv2_mali.so:system/lib/egl/libGLESv2_mali.so

# Mali Libs
PRODUCT_COPY_FILES += \
    device/softwinner/sp1020/prebuilt/lib/libMali.so:system/lib/libMali.so \
    device/softwinner/sp1020/prebuilt/lib/libUMP.so:system/lib/libUMP.so \
    device/softwinner/sp1020/prebuilt/lib/hw/gralloc.sun7i.so:system/lib/hw/gralloc.sun7i.so

# ETC
PRODUCT_COPY_FILES += \
    device/softwinner/sp1020/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml \
    device/softwinner/sp1020/prebuilt/etc/sensors.sh:/system/bin/sensors.sh

# GPS
PRODUCT_PACKAGES += gps.exDroid
BOARD_USES_GPS_TYPE := simulator

# Audio
PRODUCT_COPY_FILES += \
    device/softwinner/sp1020/hardware/audio/audio_policy.conf:system/etc/audio_policy.conf

# PACKAGES
#PRODUCT_PACKAGES += \
#    libion \
#    hwcomposer.exDroid \
#    display.exdroid \
#    sensors.exDroid \
#    lights.sun7i \
#    display.sun7i \
##    camera.exDroid

#USE PREBUILTS INSTEAD
PRODUCT_COPY_FILES += \
    device/softwinner/sp1020/prebuilt/lib/libion.so:system/lib/libion.so \
    device/softwinner/sp1020/prebuilt/lib/libion_alloc.so:system/lib/libion_alloc.so \
    device/softwinner/sp1020/prebuilt/lib/hw/display.sun7i.so:system/lib/hw/display.sun7i.so \
    device/softwinner/sp1020/prebuilt/lib/hw/sensors.exDroid.so:system/lib/hw/sensors.exDroid.so \
    device/softwinner/sp1020/prebuilt/lib/hw/gps.exDroid.so:system/lib/hw/gps.exDroid.so \
    device/softwinner/sp1020/prebuilt/lib/hw/lights.sun7i.so:system/lib/hw/lights.sun7i.so

# Set custom values for dalvik
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=384m \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=96m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=2m \
    dalvik.vm.heapmaxfree=8m

# WiFi Overrides
PRODUCT_PROPERTY_OVERRIDES := \
    ro.carrier=wifi-only \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    keyguard.no_require_sim=true

# DRM
PRODUCT_PROPERTY_OVERRIDES += drm.service.enabled=true

PRODUCT_PACKAGES += \
    com.google.widevine.software.drm.xml \
    com.google.widevine.software.drm \
    libdrmwvmplugin \
    libwvm \
    libWVStreamControlAPI_L3 \
    libwvdrm_L3 \
    libdrmdecrypt

# Strictmode
PRODUCT_PROPERTY_OVERRIDES := \
    persist.sys.strictmode.visual=0 \
    persist.sys.strictmode.disable=1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0

# Sounds
$(call inherit-product, frameworks/base/data/sounds/AudioPackage10.mk)
