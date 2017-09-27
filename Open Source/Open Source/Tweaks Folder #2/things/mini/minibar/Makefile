ARCHS = arm64 armv7 armv7s
TARGET = iphone:clang:latest:latest

include theos/makefiles/common.mk

TWEAK_NAME = MiniBar
MiniBar_FILES = MiniBar.xm
MiniBar_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"

SUBPROJECTS += minibar
include $(THEOS_MAKE_PATH)/aggregate.mk