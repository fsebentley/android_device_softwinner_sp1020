# Release name
PRODUCT_RELEASE_NAME := wing_d9

# Boot animation
TARGET_SCREEN_HEIGHT := 1024
TARGET_SCREEN_WIDTH := 600

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/softwinner/sp1020/device_sp1020.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := sp1020
PRODUCT_NAME := cm_sp1020
PRODUCT_BRAND := Skytex
PRODUCT_MODEL := Skypad SP1020
PRODUCT_MANUFACTURER := Skytex

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=sp1020 BUILD_FINGERPRINT="Skytex/sp1020/sp1020:$(PLATFORM_VERSION)/$(BUILD_ID)/$(shell date +%Y%m%d%H%M%S):$(TARGET_BUILD_VARIANT)/test-keys" PRIVATE_BUILD_DESC="sp1020-$(TARGET_BUILD_VARIANT) $(PLATFORM_VERSION) $(BUILD_ID) $(shell date +%Y%m%d%H%M%S) test-keys"
