ARCHS = armv7 arm64


include theos/makefiles/common.mk

TWEAK_NAME = Haptic10
Haptic10_FILES = Tweak.xm
Haptic10_FRAMEWORKS = UIKit AudioToolbox

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += haptic10
include $(THEOS_MAKE_PATH)/aggregate.mk
