ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

include theos/makefiles/common.mk

TWEAK_NAME = OutOfControl
OutOfControl_FILES = Tweak.xm
OutOfControl_FRAMEWORKS = UIKit
OutOfControl_LIBRARIES = flip switch

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += outofcontrol
include $(THEOS_MAKE_PATH)/aggregate.mk
