ARCHS = armv7 arm64
TARGET = iphone:clang:9.2:latest

include theos/makefiles/common.mk

TWEAK_NAME = RotoLock
RotoLock_FILES = Tweak.xm
RotoLock_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
