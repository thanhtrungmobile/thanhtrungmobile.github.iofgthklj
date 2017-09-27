TARGET = iphone:clang:latest:latest
ARCHS = armv7 arm64

include theos/makefiles/common.mk

TWEAK_NAME = Atlas
Atlas_FILES = Atlas.xm
Atlas_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
