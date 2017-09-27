ARCHS = arm64 armv7 armv7s
TARGET = iphone:clang:latest:latest

include theos/makefiles/common.mk

TWEAK_NAME = LucidCamBars
LucidCamBars_FILES = Tweak.xm
LucidCamBars_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 com.apple.camera"
