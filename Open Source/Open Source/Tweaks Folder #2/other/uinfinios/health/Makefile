ARCHS = arm64 armv7
TARGET = iphone:clang:latest:latest

include theos/makefiles/common.mk

TWEAK_NAME = Health
Health_FILES = Tweak.xm
Health_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 com.apple.Health"
