ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest
DEBUG = 0

include theos/makefiles/common.mk

TWEAK_NAME = MiniChargeOS
MiniChargeOS_FILES = Tweak.xm
MiniChargeOS_FRAMEWORKS = UIKit AVFoundation AudioToolbox

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += minichargeos
include $(THEOS_MAKE_PATH)/aggregate.mk
