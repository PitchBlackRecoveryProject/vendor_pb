# Add variables that we wish to make available to soong here.
EXPORT_TO_SOONG := \
    KERNEL_ARCH \
    KERNEL_BUILD_OUT_PREFIX \
    KERNEL_CROSS_COMPILE \
    KERNEL_MAKE_CMD \
    KERNEL_MAKE_FLAGS \
    TARGET_KERNEL_CONFIG \
    TARGET_KERNEL_SOURCE

# Setup SOONG_CONFIG_* vars to export the vars listed above.
# Documentation here:
# https://github.com/LineageOS/android_build_soong/commit/8328367c44085b948c003116c0ed74a047237a69

SOONG_CONFIG_NAMESPACES += omniromVarsPlugin

SOONG_CONFIG_omniromVarsPlugin :=

define addVar
  SOONG_CONFIG_omniromVarsPlugin += $(1)
  SOONG_CONFIG_omniromVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

SOONG_CONFIG_NAMESPACES += pbrpGlobalVars
SOONG_CONFIG_pbrpGlobalVars += \
    target_enforce_ab_ota_partition_list \
    target_init_vendor_lib \
    legacy_hw_disk_encryption

# Soong bool variables
SOONG_CONFIG_pbrpGlobalVars_target_enforce_ab_ota_partition_list := $(TARGET_ENFORCE_AB_OTA_PARTITION_LIST)
SOONG_CONFIG_pbrpGlobalVars_legacy_hw_disk_encryption := $(TARGET_LEGACY_HW_DISK_ENCRYPTION)

# Set default values
TARGET_INIT_VENDOR_LIB ?= vendor_init

# Soong value variables
SOONG_CONFIG_pbrpGlobalVars_target_init_vendor_lib := $(TARGET_INIT_VENDOR_LIB)
