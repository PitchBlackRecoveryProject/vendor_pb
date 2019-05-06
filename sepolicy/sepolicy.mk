#
# This policy configuration will be used by all products that
# inherit from Omni
#

BOARD_SEPOLICY_DIRS += \
    vendor/pb/sepolicy/common

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += vendor/pb/sepolicy/private
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += vendor/pb/sepolicy/public
