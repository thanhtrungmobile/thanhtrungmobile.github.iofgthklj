ARCHS = arm64 armv7 armv7s
TARGET = iphone:clang:latest:latest

include theos/makefiles/common.mk

TWEAK_NAME = i8Corners
i8Corners_FILES = Tweak.xm
i8Corners_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
SUBPROJECTS += i8corners
include $(THEOS_MAKE_PATH)/aggregate.mk