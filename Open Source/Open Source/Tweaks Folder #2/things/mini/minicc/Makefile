TARGET = iphone:clang:latest:latest
ARCHS = armv7 armv7s arm64

include theos/makefiles/common.mk

TWEAK_NAME = MiniCC
MiniCC_FILES = $(wildcard *.xm)
MiniCC_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += minicc
include $(THEOS_MAKE_PATH)/aggregate.mk
