ARCHS = arm64 armv7
TARGET = iphone:clang:latest:latest

include theos/makefiles/common.mk

TWEAK_NAME = Ouija
Ouija_FILES = Tweak.xm
Ouija_FRAMEWORKS = UIKit
Ouija_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
SUBPROJECTS += ouija
include $(THEOS_MAKE_PATH)/aggregate.mk
