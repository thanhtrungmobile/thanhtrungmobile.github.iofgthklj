ARCHS = armv7 arm64
TARGET = iphone:clang:9.2:latest

include theos/makefiles/common.mk

TWEAK_NAME = NoSleepPls
NoSleepPls_FILES = Tweak.xm
NoSleepPls_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += nosleeppls
include $(THEOS_MAKE_PATH)/aggregate.mk
