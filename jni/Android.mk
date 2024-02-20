LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

$(shell chmod 0777 $(LOCAL_PATH)/busybox)
$(shell $(LOCAL_PATH)/busybox xxd -i main.lua > main.h)

LOCAL_SRC_FILES := $(LOCAL_PATH)/ndk-lua.cpp  \
  $(wildcard $(LOCAL_PATH)/lua/*.c)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/lua

LOCAL_MODULE := NDK-Lua

LOCAL_MODULE_FILENAME := ndk-lua

COMMAND := -static -Wl,--strip-all -O3 -fPIC -pipe -g0 -flto=thin -Wl,--gc-sections -ffunction-sections -fdata-sections -falign-functions -falign-loops -Wl,--sort-section=alignment -fvisibility=hidden -ffast-math -fno-stack-protector -fno-builtin -fmerge-all-constants -fmerge-constants -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-strict-aliasing -fno-rtti -fno-exceptions -fomit-frame-pointer -fno-stack-check -fms-extensions -fdeclspec -fvisibility-inlines-hidden

LOCAL_CFLAGS := $(COMMAND)
LOCAL_CPPFLAGS := -std=c++17
LOCAL_LDFLAGS := $(COMMAND)

include $(BUILD_EXECUTABLE)