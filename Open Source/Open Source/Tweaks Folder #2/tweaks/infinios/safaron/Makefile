ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)
THEOS_BUILD_DIR = /var/mobile/build

include theos/makefiles/common.mk

TWEAK_NAME = Safaron
Safaron_FILES = $(wildcard *.xm)
Safaron_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
