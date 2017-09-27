ARCHS = arm64 armv7
TARGET = iphone:clang:latest:latest

include theos/makefiles/common.mk

TWEAK_NAME = NoughatMenu
NoughatMenu_FILES = Tweak.xm
NoughatMenu_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 com.saurik.cydia"
