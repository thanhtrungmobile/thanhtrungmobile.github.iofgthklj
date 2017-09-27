TARGET = iphone:clang:latest:latest
ARCHS = armv7 armv7s arm64

include theos/makefiles/common.mk

TWEAK_NAME = Metanoia
Metanoia_FILES = Tweak.xm Metanoia.m
Metanoia_FRAMEWORKS = UIKit QuartzCore CoreGraphics
Metanoia_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += metanoia
include $(THEOS_MAKE_PATH)/aggregate.mk
