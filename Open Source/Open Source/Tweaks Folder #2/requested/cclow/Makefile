GO_EASY_ON_ME = 1
DEBUG = 0
TARGET = iphone:clang:latest:latest
ARCHS = armv7 arm64

include theos/makefiles/common.mk

TWEAK_NAME = CCLowPower
CCLowPower_FILES = Tweak.xm
CCLowPower_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk