ARCHS = arm64 armv7 armv7s
TARGET = iphone:clang:latest:latest

include theos/makefiles/common.mk

TWEAK_NAME = Inception
Inception_FILES = Tweak.xm
Inception_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
