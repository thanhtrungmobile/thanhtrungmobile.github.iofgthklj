ARCHS = armv7 arm64
TARGET = iphone:clang:9.2:latest
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

include theos/makefiles/common.mk

TWEAK_NAME = NoMoreExpire
NoMoreExpire_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
