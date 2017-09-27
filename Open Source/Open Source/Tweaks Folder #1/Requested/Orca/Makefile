TARGET = iphone:clang:latest:latest
ARCHS = armv7 armv7s arm64
GO_EASY_ON_ME = 0

include theos/makefiles/common.mk

TWEAK_NAME = Orca
Orca_FILES = Tweak.xm CCAlegroPageViewController.m
Orca_FRAMEWORKS = UIKit MediaPlayer CoreGraphics HealthKitUI
Orca_PRIVATE_FRAMEWORKS = SpotlightUI MediaPlayerUI BluetoothManager

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += orca
include $(THEOS_MAKE_PATH)/aggregate.mk
