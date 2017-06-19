# ----------------- BEGIN MIX-IN DEFINITIONS -----------------
# Mix-In definitions are auto-generated by mixin-update
##############################################################
# Source: device/intel/mixins/groups/2ndstage/oemvars/BoardConfig.mk
##############################################################
TARGET_BOOTLOADER_IS_2ND := true
BOARD_OEM_VARS += $(TARGET_DEVICE_DIR)/oemvars.txt
##############################################################
# Source: device/intel/mixins/groups/android_ia/default/BoardConfig.mk
##############################################################
KERNEL_CROSS_COMPILE_WRAPPER := x86_64-linux-android-
##############################################################
# Source: device/intel/mixins/groups/sepolicy/enforcing/BoardConfig.mk
##############################################################
# SELinux Policy
BOARD_SEPOLICY_DIRS += device/intel/android_ia/sepolicy

# Pass device target to build
BOARD_SEPOLICY_M4DEFS += board_sepolicy_target_product=$(TARGET_PRODUCT)
##############################################################
# Source: device/intel/mixins/groups/graphics/android_ia/BoardConfig.mk
##############################################################
BOARD_KERNEL_CMDLINE += vga=current i915.modeset=1 drm.atomic=1 i915.nuclear_pageflip=1 drm.vblankoffdelay=1 i915.fastboot=1
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
USE_INTEL_UFO_DRIVER := false
INTEL_VA := true
BOARD_GRAPHIC_IS_GEN := true
BOARD_GPU_DRIVERS := i965
BOARD_USE_MESA := true

# System's VSYNC phase offsets in nanoseconds
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000

BOARD_GPU_DRIVERS ?= i965 swrast
ifneq ($(strip $(BOARD_GPU_DRIVERS)),)
TARGET_HARDWARE_3D := true
TARGET_USES_HWC2 := true
endif


BOARD_USES_DRM_HWCOMPOSER := false
BOARD_USES_IA_HWCOMPOSER := true

BOARD_USES_MINIGBM := true
BOARD_ENABLE_EXPLICIT_SYNC := true
INTEL_MINIGBM := external/minigbm


BOARD_USES_GRALLOC1 := true

##############################################################
# Source: device/intel/mixins/groups/media/android_ia/BoardConfig.mk
##############################################################
##############################################################
# Source: device/intel/mixins/groups/device-type/tablet/BoardConfig.mk
##############################################################
DEVICE_PACKAGE_OVERLAYS += device/intel/common/device-type/overlay-tablet
##############################################################
# Source: device/intel/mixins/groups/debugfs/default/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += device/intel/android_ia/sepolicy/debugfs
##############################################################
# Source: device/intel/mixins/groups/kernel/android_ia/BoardConfig.mk
##############################################################
TARGET_USES_64_BIT_BINDER := true
BOARD_USE_64BIT_USERSPACE := true
TARGET_SUPPORTS_64_BIT_APPS := true


TARGET_PRELINK_MODULE := false
TARGET_NO_KERNEL ?= false

KERNEL_LOGLEVEL ?= 3
SERIAL_PARAMETER := console=tty0 console=ttyS2,115200n8

BOARD_KERNEL_CMDLINE += root=/dev/ram0  androidboot.hardware=$(TARGET_PRODUCT) firmware_class.path=/vendor/firmware loglevel=$(KERNEL_LOGLEVEL)

ifneq ($(TARGET_BUILD_VARIANT),user)
ifeq ($(SPARSE_IMG),true)
BOARD_KERNEL_CMDLINE += $(SERIAL_PARAMETER)
endif
endif
##############################################################
# Source: device/intel/mixins/groups/bluetooth/btusb/BoardConfig.mk
##############################################################
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_LINUX := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/intel/common/bluetooth/bcm43241/
DEVICE_PACKAGE_OVERLAYS += device/intel/common/bluetooth/overlay-bt-pan
##############################################################
# Source: device/intel/mixins/groups/disk-bus/auto/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += device/intel/android_ia/sepolicy/set_storage
##############################################################
# Source: device/intel/mixins/groups/boot-arch/android_ia/BoardConfig.mk
##############################################################
#TARGET_NO_RECOVERY ?= false

TARGET_BOARD_PLATFORM := android_ia

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USERDATAIMAGE_PARTITION_SIZE := 576716800
BOARD_CACHEIMAGE_PARTITION_SIZE := 69206016
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 512

ifeq ($(SPARSE_IMG),true)
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
else
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := squashfs
endif

BOARD_SYSTEMIMAGE_PARTITION_SIZE = 3758096384

BOARD_BOOTLOADER_PARTITION_SIZE ?= 62914560
BOARD_BOOTLOADER_BLOCK_SIZE := 512
TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_DEVICE)

# Kernel Flinger
TARGET_UEFI_ARCH := x86_64
# Kernelflinger won't check the ACPI table oem_id, oem_table_id and
# revision fields
KERNELFLINGER_ALLOW_UNSUPPORTED_ACPI_TABLE := true
# Allow Kernelflinger to start watchdog prior to boot the kernel
KERNELFLINGER_USE_WATCHDOG := true
# Tell Kernelflinger to ignore ACPI RSCI table
KERNELFLINGER_IGNORE_RSCI := true
#KERNELFLINGER_SSL_LIBRARY := boringssl
KERNELFLINGER_SSL_LIBRARY := openssl
# Specify system verity partition
#PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/by-name/system

# Avoid Watchdog truggered reboot
BOARD_KERNEL_CMDLINE += iTCO_wdt.force_no_reboot=1

# Show the "OEM unlocking" option in Android "Developer options"
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.frp.pst=/dev/block/by-name/android_persistent

# Specify file for creating final flashfiles
BOARD_GPT_INI ?= $(TARGET_DEVICE_DIR)/gpt.ini
BOARD_GPT_BIN = $(PRODUCT_OUT)/gpt.bin
BOARD_FLASHFILES += $(PRODUCT_OUT)/system.img
BOARD_FLASHFILES += $(PRODUCT_OUT)/gpt.bin
BOARD_FLASHFILES += $(PRODUCT_OUT)/boot.img
BOARD_FLASHFILES += $(PRODUCT_OUT)/efi/installer.efi
BOARD_FLASHFILES += $(PRODUCT_OUT)/efi/kernelflinger.efi
BOARD_FLASHFILES += $(PRODUCT_OUT)/efi/startup.nsh
BOARD_FLASHFILES += $(PRODUCT_OUT)/efi/installer.cmd
BOARD_FLASHFILES += $(PRODUCT_OUT)/bootloader
BOARD_FLASHFILES += $(PRODUCT_OUT)/fastboot-usb.img
BOARD_FLASHFILES += $(PRODUCT_OUT)/recovery.img
BOARD_FLASHFILES += $(PRODUCT_OUT)/cache.img
BOARD_FLASHFILES += $(PRODUCT_OUT)/config.img
BOARD_FLASHFILES += $(PRODUCT_OUT)/vendor.img
BOARD_FLASHFILES += $(PRODUCT_OUT)/factory.img
BOARD_FLASHFILES += $(TARGET_DEVICE_DIR)/flash.json

# -- OTA RELATED DEFINES --
# tell build system where to get the recovery.fstab.
TARGET_RECOVERY_FSTAB ?= $(TARGET_DEVICE_DIR)/fstab 
# Used by ota_from_target_files to add platform-specific directives
# to the OTA updater scripts
TARGET_RELEASETOOLS_EXTENSIONS ?= device/intel/common/recovery
# Adds edify commands swap_entries and copy_partition for robust
# update of the EFI system partition
TARGET_RECOVERY_UPDATER_LIBS := libupdater_esp
# Extra libraries needed to be rolled into recovery updater
# libgpt_static and libefivar are needed by libupdater_esp
TARGET_RECOVERY_UPDATER_EXTRA_LIBS := libcommon_recovery libgpt_static libefivar
# By default recovery minui expects RGBA framebuffer
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"


ifneq (0x0,static)
BOOTLOADER_POLICY_OEMVARS = $(PRODUCT_OUT)/bootloader_policy-oemvars.txt
BOARD_FLASHFILES += $(BOOTLOADER_POLICY_OEMVARS)
BOARD_OEM_VARS += $(BOOTLOADER_POLICY_OEMVARS)
endif

# It activates the Bootloader policy and RMA refurbishing
# features. TARGET_BOOTLOADER_POLICY is the desired bitmask for this
# device.
# * bit 0:
#   - 0: GVB class B.
#   - 1: GVB class A.  Device unlock is not permitted.  The only way
#     to unlock is to use the secured force-unlock mechanism.
# * bit 1 and 2 defines the minimal boot state required to boot the
#   device:
#   - 0x0: BOOT_STATE_RED (GVB default behavior)
#   - 0x1: BOOT_STATE_ORANGE
#   - 0x2: BOOT_STATE_YELLOW
#   - 0x3: BOOT_STATE_GREEN
# If TARGET_BOOTLOADER_POLICY is equal to 'static' the bootloader
# policy is not built but is provided statically in the repository.
# If TARGET_BOOTLOADER_POLICY is equal to 'external' the bootloader
# policy OEMVARS should be installed manually in
# $(BOOTLOADER_POLICY_OEMVARS).
TARGET_BOOTLOADER_POLICY := 0x0
# If the following variable is set to false, the bootloader policy and
# RMA refurbishing features does not use time-based authenticated EFI
# variables to store the BPM and OAK values.  The BPM value is defined
# compilation time by the TARGET_BOOTLOADER_POLICY variable.
TARGET_BOOTLOADER_POLICY_USE_EFI_VAR := true
ifeq ($(TARGET_BOOTLOADER_POLICY),$(filter $(TARGET_BOOTLOADER_POLICY),0x0 0x2 0x4 0x6))
# OEM Unlock reporting 1
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.oem_unlock_supported=1
endif
ifeq ($(TARGET_BOOTLOADER_POLICY),$(filter $(TARGET_BOOTLOADER_POLICY),static external))
# The bootloader policy is not generated build time but is supplied
# statically in the repository or in $(PRODUCT_OUT)/.  If your
# bootloader policy allows the device to be unlocked, uncomment the
# following lines:
# ADDITIONAL_DEFAULT_PROPERTIES += \
# 	ro.oem_unlock_supported=1
endif



# Kernelfligner will assume the BIOS support secure boot. Not check the EFI variable SecureBoot
# It is useful when the BIOS does not support secure boot.
KERNELFLINGER_ASSUME_BIOS_SECURE_BOOT := true

##############################################################
# Source: device/intel/mixins/groups/audio/android_ia/BoardConfig.mk
##############################################################
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_TINY_ALSA_AUDIO := true
BOARD_USES_GENERIC_AUDIO ?= false
ifneq ($(BOARD_USES_GENERIC_AUDIO), true)
# Audio HAL selection Flag default setting.
#  INTEL_AUDIO_HAL:= audio     -> baseline HAL
#  INTEL_AUDIO_HAL:= audio_pfw -> PFW-based HAL
INTEL_AUDIO_HAL := audio
else
INTEL_AUDIO_HAL := stub
endif

# Use XML audio policy configuration file
USE_XML_AUDIO_POLICY_CONF ?= 1
# Use configurable audio policy
USE_CONFIGURABLE_AUDIO_POLICY ?= 1
##############################################################
# Source: device/intel/mixins/groups/wlan/iwlwifi/BoardConfig.mk
##############################################################
# wifi support
WPA_SUPPLICANT_VERSION := VER_0_8_X
##############################################################
# Source: device/intel/mixins/groups/cpu-arch/skl/BoardConfig.mk
##############################################################
ifeq ($(BOARD_USE_64BIT_USERSPACE),true)
# 64b-specific items:
TARGET_ARCH := x86_64
TARGET_CPU_ABI := x86_64
TARGET_2ND_CPU_ABI := x86
TARGET_2ND_ARCH := x86
TARGET_2ND_ARCH_VARIANT := x86
TARGET_2ND_CPU_VARIANT := x86
else
# 32b-specific items:
TARGET_ARCH := x86
TARGET_CPU_ABI := x86
endif
##############################################################
# Source: device/intel/mixins/groups/cpuset/4cores/BoardConfig.mk
##############################################################
ENABLE_CPUSETS := true
##############################################################
# Source: device/intel/mixins/groups/rfkill/true/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += device/intel/android_ia/sepolicy/rfkill
##############################################################
# Source: device/intel/mixins/groups/dexpreopt/enabled/BoardConfig.mk
##############################################################
# enable dex-preoptimization.
WITH_DEXPREOPT := true
WITH_DEXPREOPT_PIC := true
##############################################################
# Source: device/intel/mixins/groups/thermal/dptf/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += device/intel/android_ia/sepolicy/thermal
BOARD_SEPOLICY_DIRS += device/intel/android_ia/sepolicy/thermal/dptf
BOARD_KERNEL_CMDLINE += thermal.off=1
##############################################################
# Source: device/intel/mixins/groups/config-partition/enabled/BoardConfig.mk
##############################################################
BOARD_CONFIGIMAGE_PARTITION_SIZE := 8388608
##############################################################
# Source: device/intel/mixins/groups/vendor-partition/true/BoardConfig.mk
##############################################################
# Those 3 lines are required to enable vendor image generation.
# Remove them if vendor partition is not used.
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_PARTITION_SIZE := 1572864000
ifeq ($(SPARSE_IMG),true)
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
else
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := squashfs
endif
##############################################################
# Source: device/intel/mixins/groups/factory-partition/true/BoardConfig.mk
##############################################################
BOARD_FACTORYIMAGE_PARTITION_SIZE := 10485760
BOARD_SEPOLICY_DIRS += device/intel/android_ia/sepolicy/factory-partition
BOARD_SEPOLICY_M4DEFS += module_factory_partition=true
##############################################################
# Source: device/intel/mixins/groups/debug-phonedoctor/true/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_M4DEFS += module_debug_phonedoctor=true
BOARD_SEPOLICY_DIRS += device/intel/sepolicy/debug-phonedoctor
##############################################################
# Source: device/intel/mixins/groups/flashfiles/ini/BoardConfig.mk
##############################################################
FLASHFILES_CONFIG ?= $(TARGET_DEVICE_DIR)/flashfiles.ini
USE_INTEL_FLASHFILES := true
VARIANT_SPECIFIC_FLASHFILES ?= false
FAST_FLASHFILES := true

# ------------------ END MIX-IN DEFINITIONS ------------------

# Install Native Bridge
WITH_NATIVE_BRIDGE := true

# Enable ARM codegen for x86 with Native Bridge
BUILD_ARM_FOR_X86 := true

# Native Bridge ABI List
NB_ABI_LIST_32_BIT := armeabi-v7a armeabi
NB_ABI_LIST_64_BIT := arm64-v8a

# Support 64 Bit Apps
ifeq ($(ENABLE_NATIVEBRIDGE_64BIT),true)
  TARGET_CPU_ABI_LIST_64_BIT ?= $(TARGET_CPU_ABI) $(TARGET_CPU_ABI2)
  TARGET_CPU_ABI_LIST_32_BIT ?= $(TARGET_2ND_CPU_ABI) $(TARGET_2ND_CPU_ABI2)
  TARGET_CPU_ABI_LIST := \
      $(TARGET_CPU_ABI_LIST_64_BIT) \
      $(TARGET_CPU_ABI_LIST_32_BIT) \
      $(NB_ABI_LIST_32_BIT) \
      $(NB_ABI_LIST_64_BIT)
  TARGET_CPU_ABI_LIST_32_BIT += $(NB_ABI_LIST_32_BIT)
  TARGET_CPU_ABI_LIST_64_BIT += $(NB_ABI_LIST_64_BIT)
else
  TARGET_CPU_ABI_LIST_32_BIT ?= $(TARGET_CPU_ABI) $(TARGET_CPU_ABI2)
  TARGET_CPU_ABI_LIST_32_BIT += $(NB_ABI_LIST_32_BIT)
  TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI_LIST_32_BIT)
endif

BOARD_SEPOLICY_M4DEFS += module_houdini=true
BOARD_SEPOLICY_DIRS += device/intel/android_ia/sepolicy/houdini
