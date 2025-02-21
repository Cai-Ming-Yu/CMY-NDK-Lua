LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

$(shell chmod 0777 $(LOCAL_PATH)/busybox)
$(shell $(LOCAL_PATH)/busybox xxd -i main.lua > main.h)

LOCAL_SRC_FILES := $(LOCAL_PATH)/ndk-lua.cpp \
  $(wildcard $(LOCAL_PATH)/lua/*.c)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/lua

LOCAL_MODULE := NDK-Lua

LOCAL_MODULE_FILENAME := ndk-lua

CMD := -static -Oz

LOCAL_CFLAGS := $(CMD)
LOCAL_CPPFLAGS :=
LOCAL_LDFLAGS := $(CMD)

include $(BUILD_EXECUTABLE)