ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

include theos/makefiles/common.mk

TWEAK_NAME = LSLockDown
LSLockDown_FILES = $(wildcard *.xm)
LSLockDown_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
