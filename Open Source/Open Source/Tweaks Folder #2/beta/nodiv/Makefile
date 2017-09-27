ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)
GO_EASY_ON_ME = 1

include theos/makefiles/common.mk

TWEAK_NAME = 3DNoDiv10
3DNoDiv10_FILES = Tweak.xm
3DNoDiv10_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
include $(THEOS_MAKE_PATH)/aggregate.mk
