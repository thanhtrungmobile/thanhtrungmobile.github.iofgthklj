ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest
DEBUG = 0

include theos/makefiles/common.mk

TWEAK_NAME = LSTickTock
LSTickTock_FILES = Tweak.xm
LSTickTock_FRAMEWORKS = UIKit
LSTickTock_PRIVATE_FRAMEWORKS = SpringBoardFoundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += lsticktock
include $(THEOS_MAKE_PATH)/aggregate.mk
