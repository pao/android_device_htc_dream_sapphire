# Copyright (C) 2007 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)

# from device/htc/sapphire
file := $(TARGET_OUT_KEYLAYOUT)/sapphire-keypad.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/sapphire-keypad.kl | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/init.sapphire.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.sapphire.rc | $(ACP)
	$(transform-prebuilt-to-target)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := sapphire-keypad.kcm
include $(BUILD_KEY_CHAR_MAP)

# from device/htc/dream
file := $(TARGET_OUT_KEYLAYOUT)/trout-keypad.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/trout-keypad.kl | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/trout-keypad-v2.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/trout-keypad-v2.kl | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/trout-keypad-v3.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/trout-keypad-v3.kl | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/trout-keypad-qwertz.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/trout-keypad-qwertz.kl | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/init.trout.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.trout.rc | $(ACP)
	$(transform-prebuilt-to-target)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := trout-keypad.kcm
include $(BUILD_KEY_CHAR_MAP)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := trout-keypad-v2.kcm
include $(BUILD_KEY_CHAR_MAP)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := trout-keypad-v3.kcm
include $(BUILD_KEY_CHAR_MAP)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := trout-keypad-qwertz.kcm
include $(BUILD_KEY_CHAR_MAP)

ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
endif

# from AndroidBoardCommon.mk
file := $(INSTALLED_KERNEL_TARGET)
ALL_PREBUILT += $(file)
$(file): $(TARGET_PREBUILT_KERNEL) | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/h2w_headset.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/h2w_headset.kl | $(ACP)
	$(transform-prebuilt-to-target)

include $(CLEAR_VARS)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE := vold.fstab
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := wlan.ko
LOCAL_MODULE_TAGS := user
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT)/lib/modules
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

# the system properties for each device, loaded by init
file := $(TARGET_OUT)/build.sapphire.prop
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/build.sapphire.prop | $(ACP)
        $(transform-prebuilt-to-target)

file := $(TARGET_OUT)/build.trout.prop
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/build.trout.prop | $(ACP)
        $(transform-prebuilt-to-target)

-include vendor/htc/dream_sapphire/AndroidBoardVendor.mk

