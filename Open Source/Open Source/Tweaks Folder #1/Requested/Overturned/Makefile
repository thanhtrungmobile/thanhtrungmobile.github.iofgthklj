TARGET = iphone:clang:latest:latest
ARCHS = armv7 armv7s arm64

include theos/makefiles/common.mk

TWEAK_NAME = Overturned
Overturned_FILES = Tweak.xm
Overturned_FRAMEWORKS = UIKit CoreGraphics AVFoundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
