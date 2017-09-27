ARCHS = armv7 armv7s arm64
TARGET = iphone:clang:latest:latest
DEBUG = 0

include theos/makefiles/common.mk

TWEAK_NAME = Carousell
Carousell_FILES = Tweak.xm
Carousell_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
