TARGET = iphone:clang:latest:latest
ARCHS = armv7 armv7s arm64

include theos/makefiles/common.mk

TWEAK_NAME = DarkSnap
DarkSnap_FILES = DarkSnap.xm
DarkSnap_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 com.toyopagroup.picaboo"