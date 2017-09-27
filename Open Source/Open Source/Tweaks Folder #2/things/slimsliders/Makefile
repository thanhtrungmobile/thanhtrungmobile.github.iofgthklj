ARCHS = arm64 armv7
TARGET = iphone:clang:latest:latest

include theos/makefiles/common.mk

TWEAK_NAME = SlimSliders
SlimSliders_FILES = Tweak.xm
SlimSliders_FRAMEWORKS = UIKit MediaPlayer

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
