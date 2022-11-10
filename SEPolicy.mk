# Board specific SELinux policy variable definitions
ifeq ($(call is-vendor-board-platform,QCOM),true)
BOARD_SEPOLICY_DIR ?= device/qcom/sepolicy
SEPOLICY_PATH:= $(BOARD_SEPOLICY_DIR)
LOCAL_PATH := $(call my-dir)
BOARD_SYSTEM_EXT_PREBUILT_DIR := $(SEPOLICY_PATH)/generic
BOARD_PRODUCT_PREBUILT_DIR := $(SEPOLICY_PATH)/generic/product
BOARD_PLAT_PUB_VERSIONED_POLICY := $(SEPOLICY_PATH)
$(shell $(SEPOLICY_PATH)/append.sh)

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS := \
    $(SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS) \
    $(SEPOLICY_PATH)/generic/public

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS := \
    $(SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS) \
    $(SEPOLICY_PATH)/generic/private

#once all the services are moved to Product /ODM above lines will be removed.
# sepolicy rules for product images
PRODUCT_PUBLIC_SEPOLICY_DIRS := \
    $(PRODUCT_PUBLIC_SEPOLICY_DIRS) \
    $(SEPOLICY_PATH)/generic/product/public

PRODUCT_PRIVATE_SEPOLICY_DIRS := \
    $(PRODUCT_PRIVATE_SEPOLICY_DIRS) \
    $(SEPOLICY_PATH)/generic/product/private

endif
