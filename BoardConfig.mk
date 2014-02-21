USE_CAMERA_STUB := true

# Inherit from the proprietary version
-include vendor/softwinner/sp1020/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_CPU_SMP := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := exDroid
TARGET_BOOTLOADER_BOARD_NAME := wing

BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048

# Include file path
TARGET_HARDWARE_INCLUDE := $(TOP)/device/softwinner/sp1020/hardware/include

# Audio Options
BOARD_USES_GENERIC_AUDIO := true
#BOARD_USES_ALSA_AUDIO := false
#BOARD_USES_TINY_AUDIO_HW := false
#BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true

# no hardware camera
USE_CAMERA_STUB := true

# wifi and bt configuration
BOARD_WIFI_VENDOR := realtek
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_rtl
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_rtl
SW_BOARD_USR_WIFI := rtl8188eu
BOARD_WLAN_DEVICE := rtl8188eu

# Fix this up by examining /proc/mtd on a running device
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x1000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 671088640
BOARD_FLASH_BLOCK_SIZE := 4096

# Kernel
TARGET_PREBUILT_KERNEL := device/softwinner/sp1020/kernel
#BOARD_KERNEL_CMDLINE := androidboot.selinux=enforce
#BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
#TARGET_KERNEL_SOURCE := kernel/softwinner/linux-3.4
#TARGET_KERNEL_CONFIG := sun7ismp_android_defconfig
#TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.8

# Video
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/softwinner/sp1020/prebuilt/lib/egl/egl.cfg

# Wireless
BOARD_WIFI_VENDOR := realtek
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_rtl
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_rtl
SW_BOARD_USR_WIFI := rtl8188eu
BOARD_WLAN_DEVICE := rtl8188eu

# Use our own init.rc
TARGET_PROVIDES_INIT_RC :=true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_UI_LIB := librecovery_ui_sp1020
SW_BOARD_TOUCH_RECOVERY :=true
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_FSTAB = device/softwinner/sp1020/fstab.sp1020
BOARD_RECOVERY_SWIPE := true

# If no selinux
SKIP_SET_METADATA := true
USE_SET_METADATA := false

# TWRP
DEVICE_RESOLUTION := 1024x600
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
TARGET_RECOVERY_INITRC := device/softwinner/sp1020/init.recovery.rc
TW_NO_REBOOT_BOOTLOADER := true
TW_INTERNAL_STORAGE_PATH := "/sdcard"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
