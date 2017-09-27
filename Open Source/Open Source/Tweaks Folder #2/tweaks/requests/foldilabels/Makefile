ARCHS = armv7 arm64
TARGET = iphone:clang:9.2:latest

include theos/makefiles/common.mk

TWEAK_NAME = MMGuesses
MMGuesses_FILES = Tweak.xm
MMGuesses_FRAMEWORK = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
