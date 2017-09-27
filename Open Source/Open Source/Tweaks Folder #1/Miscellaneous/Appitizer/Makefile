ARCHS = armv7 armv7s arm64
DEBUG = 0
THEOS_BUILD_DIR = /var/mobile/updates

include theos/makefiles/common.mk

TWEAK_NAME = Appitizer
Appitizer_FILES = Tweak.xm
Appitizer_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
SUBPROJECTS += appitizer
include $(THEOS_MAKE_PATH)/aggregate.mk
