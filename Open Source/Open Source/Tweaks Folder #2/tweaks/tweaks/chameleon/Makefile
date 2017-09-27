ARCHS = arm64 armv7
THEOS_BUILD_DIR = debs

include theos/makefiles/common.mk

TWEAK_NAME = Chameleon
Chameleon_FILES = Tweak.xm
Chameleon_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
SUBPROJECTS += chameleon
include $(THEOS_MAKE_PATH)/aggregate.mk