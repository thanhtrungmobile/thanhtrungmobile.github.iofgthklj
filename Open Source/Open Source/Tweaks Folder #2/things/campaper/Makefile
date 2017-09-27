ARCHS = arm64 armv7
TARGET = iphone:clang:latest:latest
DEBUG = 0

include theos/makefiles/common.mk

TWEAK_NAME = LivePapers
LivePapers_FILES = Tweak.xm
LivePapers_FRAMEWORKS = UIKit AVFoundation CoreGraphics

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
