ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)
GO_EASY_ON_ME = 1
THEOS_BUILD_DIR = /var/mobile/build

include theos/makefiles/common.mk

TWEAK_NAME = Buzz
Buzz_FILES = Tweak.xm
Buzz_FRAMEWORKS = UIKit
Buzz_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
