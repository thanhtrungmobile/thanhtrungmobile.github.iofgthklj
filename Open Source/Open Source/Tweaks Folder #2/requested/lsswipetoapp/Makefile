ARCHS = armv7 armv7s arm64
TARGET = iphone:clang:latest:latest
GO_EASY_ON_ME = 1
DEBUG = 0
export ADDITIONAL_LDFLAGS = -Wl,-segalign,4000

include theos/makefiles/common.mk

TWEAK_NAME = LSSwipeToApp
LSSwipeToApp_CFLAGS = -fobjc-arc
LSSwipeToApp_FILES = LSSwipeToApp.xm LSSwipeToAppHelper.m
LSSwipeToApp_FRAMEWORKS = Foundation UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
SUBPROJECTS += lsswipetoapp
include $(THEOS_MAKE_PATH)/aggregate.mk
