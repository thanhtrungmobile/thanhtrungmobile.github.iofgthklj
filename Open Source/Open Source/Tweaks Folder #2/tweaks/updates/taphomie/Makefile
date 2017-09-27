ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest
DEBUG = 0
GO_EASY_ON_ME = 1

include theos/makefiles/common.mk

TWEAK_NAME = CamEverywhere
CamEverywhere_FILES = $(wildcard *.xm)
CamEverywhere_FRAMEWORKS = UIKit CoreGraphics QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
