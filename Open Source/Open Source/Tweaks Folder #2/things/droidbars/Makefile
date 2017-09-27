ARCHS = arm64 armv7
TARGET = iphone:clang:latest:latest

include theos/makefiles/common.mk

TWEAK_NAME = DroidBars
DroidBars_FILES = Tweak.xm
DroidBars_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 com.apple.MobileSMS"
SUBPROJECTS += droidbars
include $(THEOS_MAKE_PATH)/aggregate.mk
