TARGET = iphone:clang:latest:latest
ARCHS = armv7 arm64

include theos/makefiles/common.mk

TWEAK_NAME = Oracle
Oracle_FILES = Oracle.xm
Oracle_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
