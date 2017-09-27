ARCHS = arm64 armv7 armv7s
TARGET = iphone:clang:latest:latest

include theos/makefiles/common.mk

TWEAK_NAME = QuayShift
QuayShift_FILES = Tweak.xm
QuayShift_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
SUBPROJECTS += quayshift
include $(THEOS_MAKE_PATH)/aggregate.mk
