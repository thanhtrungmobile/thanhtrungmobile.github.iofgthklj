ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)
GO_EASY_ON_ME = 1
DEBUG = 0
THEOS_BUILD_DIR = /var/mobile/build

include theos/makefiles/common.mk

TWEAK_NAME = Snapped
Snapped_FILES = $(wildcard *.xm)
Snapped_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
