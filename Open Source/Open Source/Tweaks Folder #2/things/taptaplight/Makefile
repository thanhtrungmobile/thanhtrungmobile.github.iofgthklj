ARCHS = armv7 armv7s arm64
TARGET = iphone:clang:latest:latest
DEBUG = 0

include theos/makefiles/common.mk

TWEAK_NAME = TapTapCCLight
TapTapCCLight_FILES = Tweak.xm
TapTapCCLight_FRAMEWORKS = UIKit AudioToolbox

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 com.apple.Preferences"
SUBPROJECTS += taptapcclight
include $(THEOS_MAKE_PATH)/aggregate.mk
