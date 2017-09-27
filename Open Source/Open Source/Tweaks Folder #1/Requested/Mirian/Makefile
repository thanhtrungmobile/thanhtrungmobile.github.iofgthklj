ARCHS = armv7 armv7s arm64
TARGET = iphone:clang:latest:latest
GO_EASY_ON_ME = 0

include theos/makefiles/common.mk

TWEAK_NAME = Mirian
Mirian_FILES = Tweak.xm
Mirian_FRAMEWORKS = UIKit CoreGraphics MediaPlayer

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
