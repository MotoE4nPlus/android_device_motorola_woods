# inherit from the proprietary version
-include vendor/motorola/woods/BoardConfigVendor.mk

# inherit from common mt6737 repo
-include device/motorola/mt6737/BoardConfigCommon.mk

# Kernel
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_SOURCE := kernel/motorola/woods
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x04000000
BOARD_TAGS_OFFSET := 0xE000000
ifeq ($(FORCE_32_BIT),true)
ARCH := arm
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_CONFIG := woods_defconfig
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,32N2 androidboot.selinux=permissive androidboot.selinux=d$
BOARD_KERNEL_OFFSET := 0x00008000
else
TARGET_KERNEL_ARCH := arm64
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive androidboot.selinux=d$
BOARD_KERNEL_OFFSET = 0x00080000
TARGET_USES_64_BIT_BINDER := true
endif
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFF$

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2432696320
BOARD_USERDATAIMAGE_PARTITION_SIZE := 4698144768
BOARD_CACHEIMAGE_PARTITION_SIZE := 419430400
BOARD_FLASH_BLOCK_SIZE := 131072

# Assert
TARGET_OTA_ASSERT_DEVICE := Moto E4,"woods",woods

# CWM
TARGET_RECOVERY_FSTAB := device/motorola/woods/rootdir/recovery.fstab
BOARD_HAS_NO_SELECT_BUTTON := true

# TWRP stuff
TW_THEME := portrait_hdpi
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_REBOOT_BOOTLOADER := true
TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
TW_MAX_BRIGHTNESS := 255
TW_EXCLUDE_SUPERSU := true
TW_INCLUDE_FB2PNG := true
TW_NO_CPU_TEMP := true
TW_REBOOT_BOOTLOADER := true
TW_REBOOT_RECOVERY := true
TW_HAS_DOWNLOAD_MODE := true
TW_EXCLUDE_SUPERSU := true
TW_USE_TOOLBOX := true

TARGET_SYSTEM_PROP := device/motorola/woods/system.prop

# Selinux Policy
BOARD_SEPOLICY_DIRS := \
       device/motorola/woods/sepolicy

# CMHW
TARGET_TAP_TO_WAKE_NODE := "/sys/android_touch/doubletap2wake"
