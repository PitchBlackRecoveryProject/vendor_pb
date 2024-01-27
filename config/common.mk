PRODUCT_BRAND ?= pb

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# general properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.build.selinux=1 \
    persist.sys.disable_rescue=true

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

CODE := $(PB_CODE)
MAINTAINER := $(shell python3 vendor/utils/pb_devices.py verify $(TARGET_VENDOR) $(CODE) true)
TW_THEME := portrait_hdpi

# PBRP specific build flags
PB_DISABLE_DEFAULT_DM_VERITY := true
PB_DISABLE_DEFAULT_TREBLE_COMP := true

PRODUCT_PACKAGES += \
    zip \
    keycheck

TW_OVERRIDE_SYSTEM_PROPS += "ro.bootimage.build.fingerprint;\
    ro.build.fingerprint;\
    ro.build.description;\
    ro.vendor.build.fingerprint;\
    ro.system.build.date;\
    ro.system.build.date.utc;\
    ro.system.build.version.incremental;\
    ro.system.build.fingerprint;\
    ro.build.ab_update;\
    ro.build.version.sdk;\
    ro.build.date;\
    ro.build.date.utc"

# Additional packages
-include vendor/pb/config/packages.mk

# Versioning
-include vendor/pb/config/version.mk
