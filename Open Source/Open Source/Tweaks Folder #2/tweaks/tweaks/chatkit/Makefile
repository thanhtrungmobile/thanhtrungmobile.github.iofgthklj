ARCHS = arm64 armv7
THEOS_BUILD_DIR = debs

include theos/makefiles/common.mk

TWEAK_NAME = ChatKit
ChatKit_FILES = Tweak.xm
ChatKit_FRAMEWORKS = UIKit
ChatKit_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
SUBPROJECTS += chatkit
include $(THEOS_MAKE_PATH)/aggregate.mk