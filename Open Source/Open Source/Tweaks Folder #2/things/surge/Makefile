ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest
DEBUG = 0

include theos/makefiles/common.mk

TWEAK_NAME = Surge
Surge_FILES = $(wildcard *.xm)
Surge_FRAMEWORKS = UIKit CoreGraphics MediaPlayer

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
SUBPROJECTS += surge
include $(THEOS_MAKE_PATH)/aggregate.mk
