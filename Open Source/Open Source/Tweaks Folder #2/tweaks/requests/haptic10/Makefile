ARCHS = armv7 arm64
TARGET = iphone:clang:9.2:latest
GO_EASY_ON_ME = 1


include theos/makefiles/common.mk

TWEAK_NAME = Haptic10
Haptic10_FILES = Tweak.xm
Haptic10_FRAMEWORKS = UIKit AudioToolbox

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += haptic10
include $(THEOS_MAKE_PATH)/aggregate.mk
