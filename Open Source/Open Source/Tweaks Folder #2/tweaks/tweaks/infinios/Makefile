ARCHS = arm64 armv7
THEOS_BUILD_DIR = debs

include theos/makefiles/common.mk

TWEAK_NAME = InfiniOS
InfiniOS_FILES = Tweak.xm
InfiniOS_FRAMEWORKS = UIKit
InfiniOS_LIBRARIES = colorpicker applist

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
SUBPROJECTS += infinios
include $(THEOS_MAKE_PATH)/aggregate.mk