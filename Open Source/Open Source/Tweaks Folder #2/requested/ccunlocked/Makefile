GO_EASY_ON_ME = 1
DEBUG = 0
TARGET = iphone:clang:latest:latest

include theos/makefiles/common.mk

TWEAK_NAME = SBUnlocked
SBUnlocked_FILES = Tweak.xm
SBUnlocked_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += sbunlocked
include $(THEOS_MAKE_PATH)/aggregate.mk
