ARCHS = armv7 armv7s arm64
TARGET = iphone:clang:latest:latest

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BassDrop
BassDrop_FILES = Tweak.xm
BassDrop_FRAMEWORKS = UIKit AudioToolbox AVFoundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += bassdrop
include $(THEOS_MAKE_PATH)/aggregate.mk
