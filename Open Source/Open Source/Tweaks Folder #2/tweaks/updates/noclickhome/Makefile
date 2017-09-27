ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)
GO_EASY_ON_ME = 1

include theos/makefiles/common.mk

TWEAK_NAME = NoClickHome
NoClickHome_FILES = Tweak.xm
NoClickHome_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
