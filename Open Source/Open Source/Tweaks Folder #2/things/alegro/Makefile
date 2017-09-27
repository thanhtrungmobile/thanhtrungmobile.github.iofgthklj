ARCHS = arm64 armv7
TARGET = iphone:clang:latest:latest
GO_EASY_ON_ME = 1

include theos/makefiles/common.mk

TWEAK_NAME = Alegro
Alegro_FILES = Tweak.xm CCAlegroPageViewController.m
Alegro_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
