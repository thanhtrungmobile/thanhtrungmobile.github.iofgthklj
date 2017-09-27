ARCHS = arm64 armv7
THEOS_BUILD_DIR = debs

include theos/makefiles/common.mk

TWEAK_NAME = Muesly
Muesly_FILES = Tweak.xm
Muesly_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
SUBPROJECTS += muesly
include $(THEOS_MAKE_PATH)/aggregate.mk
