ARCHS = arm64 armv7 armv7s
TARGET = iphone:clang:latest:latest

include theos/makefiles/common.mk

TWEAK_NAME = ShadowCon
ShadowCon_FILES = Tweak.xm
ShadowCon_FRAMEWORKS = UIKit CoreGraphics
ShadowCon_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
SUBPROJECTS += shadowcon
include $(THEOS_MAKE_PATH)/aggregate.mk
