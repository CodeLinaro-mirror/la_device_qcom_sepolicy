# Board specific SELinux policy variable definitions
ifeq ($(call is-vendor-board-platform,QCOM),true)
SEPOLICY_PATH:= device/qcom/sepolicy
BOARD_SEPOLICY_DIRS := \
       $(BOARD_SEPOLICY_DIRS) \
       $(SEPOLICY_PATH) \
       $(SEPOLICY_PATH)/vendor/common \
       $(SEPOLICY_PATH)/vendor/$(TARGET_BOARD_PLATFORM) \
       $(SEPOLICY_PATH)/vendor/common/sysmonapp

BOARD_PLAT_PUBLIC_SEPOLICY_DIR := \
    $(BOARD_PLAT_PUBLIC_SEPOLICY_DIR) \
    $(SEPOLICY_PATH)/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR := \
    $(BOARD_PLAT_PRIVATE_SEPOLICY_DIR) \
    $(SEPOLICY_PATH)/private

ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
BOARD_SEPOLICY_DIRS += $(SEPOLICY_PATH)/vendor/test
endif

endif
