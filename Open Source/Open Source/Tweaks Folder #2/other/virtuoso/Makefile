ARCHS = armv7 armv7s arm64
TARGET = iphone:clang:latest:latest
GO_EASY_ON_ME = 1
DEBUG = 0
THEOS_BUILD_DIR = debs

include theos/makefiles/common.mk

TWEAK_NAME = Virtuoso
Virtuoso_FILES = Tweak.xm
Virtuoso_FRAMEWORKS = UIKit CoreGraphics MediaPlayer QuartzCore 

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
