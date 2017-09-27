ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AntennaRemembers
AntennaRemembers_FILES = Tweak.xm
AntennaRemembers_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.

after-install::
	install.exec "killall -9 backboardd"
SUBPROJECTS += antennaremembers
include $(THEOS_MAKE_PATH)/aggregate.mk
