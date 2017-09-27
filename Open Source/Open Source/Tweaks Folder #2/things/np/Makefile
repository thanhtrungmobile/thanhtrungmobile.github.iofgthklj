ARCHS = armv7 armv7s arm64
TARGET = iphone:clang:latest:latest

include theos/makefiles/common.mk

TWEAK_NAME = Neutron
Neutron_FILES = Tweak.xm
Neutron_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
