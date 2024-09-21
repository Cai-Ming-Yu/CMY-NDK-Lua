LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

$(shell chmod 0777 $(LOCAL_PATH)/busybox)
$(shell $(LOCAL_PATH)/busybox xxd -i main.lua > main.h)

LOCAL_SRC_FILES := $(LOCAL_PATH)/ndk-lua.cpp  \
  $(wildcard $(LOCAL_PATH)/lua/*.c)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/lua

LOCAL_MODULE := NDK-Lua

LOCAL_MODULE_FILENAME := ndk-lua

OPT := -static -s -O3 -fPIC -pipe -g0 -fexceptions -flto -fsplit-lto-unit -funified-lto -fwhole-program-vtables -fcoroutines -fcoro-aligned-allocation -fchar8_t -fforce-enable-int128 -faligned-allocation -ffast-math -ffunction-sections -ffine-grained-bitfield-accesses -fdata-sections -fdirect-access-external-data -fdiscard-value-names -fmerge-all-constants -fno-rtti -fomit-frame-pointer -fregister-global-dtors-with-atexit -freroll-loops -funroll-loops -fslp-vectorize -fstack-protector-all -fsized-deallocation -fvectorize -fzvector -fvisibility=hidden -fvisibility-inlines-hidden -fapprox-func -falign-functions -falign-loops -ffinite-loops -fshort-enums -finline-functions -finline-hint-functions -fjump-tables -femit-compact-unwind-non-canonical

LOCAL_CFLAGS := $(OPT)
LOCAL_CPPFLAGS := -std=c++26
LOCAL_LDFLAGS := $(OPT)

include $(BUILD_EXECUTABLE)