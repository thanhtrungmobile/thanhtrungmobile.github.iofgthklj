ARCHS = armv7 armv7s arm64
TARGET = iphone:clang:latest:latest
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)
DEBUG = 0

include theos/makefiles/common.mk

TWEAK_NAME = Sys
Sys_FILES = Tweak.xm
Sys_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 com.apple.Preferences"
