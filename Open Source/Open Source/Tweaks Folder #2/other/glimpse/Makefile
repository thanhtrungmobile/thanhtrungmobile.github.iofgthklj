TARGET = iphone:clang:latest:latest
ARCHS = armv7 armv7s arm64

THEOS_BUILD_DIR = debs
GO_EASY_ON_ME = 0
DEBUG = 0

include theos/makefiles/common.mk

TWEAK_NAME = Glimpse
Glimpse_FILES = Tweak.xm Pages/CCGlimpsePageViewController.m Pages/BatteryView.m Pages/MusicView.m Pages/Battery/BatteryChargeView.m Pages/Battery/BatteryOutlineLayer.m Pages/Battery/BatteryCharginSignLayer.m
Glimpse_FRAMEWORKS = UIKit CoreGraphics QuartzCore MediaPlayer CoreMotion

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += glimpse
include $(THEOS_MAKE_PATH)/aggregate.mk
