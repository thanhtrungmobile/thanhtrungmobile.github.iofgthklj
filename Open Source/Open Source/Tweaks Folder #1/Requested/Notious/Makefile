TARGET = iphone:clang:latest:latest
ARCHS = armv7 arm64

include theos/makefiles/common.mk

TWEAK_NAME = Notious
Notious_FILES = Tweak.xm
Notious_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
