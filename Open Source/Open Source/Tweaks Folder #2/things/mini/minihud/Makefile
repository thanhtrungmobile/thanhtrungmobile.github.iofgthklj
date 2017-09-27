ARCHS = arm64 armv7 armv7s
TARGET = iphone:clang:latest:latest

include theos/makefiles/common.mk

TWEAK_NAME = MiniHUD
MiniHUD_FILES = Tweak.xm
MiniHUD_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"

SUBPROJECTS += minihud
include $(THEOS_MAKE_PATH)/aggregate.mk