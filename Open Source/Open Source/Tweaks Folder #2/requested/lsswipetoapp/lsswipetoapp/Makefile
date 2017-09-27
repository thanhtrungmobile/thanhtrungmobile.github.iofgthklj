ARCHS = armv7 armv7s arm64
TARGET = iphone:clang:latest:latest
GO_EASY_ON_ME = 1
DEBUG = 0
export ADDITIONAL_LDFLAGS = -Wl,-segalign,4000

include theos/makefiles/common.mk

BUNDLE_NAME = LSSwipeToApp
LSSwipeToApp_FILES = LSSwipeToApp.mm
LSSwipeToApp_INSTALL_PATH = /Library/PreferenceBundles
LSSwipeToApp_FRAMEWORKS = UIKit
LSSwipeToApp_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/LSSwipeToApp.plist$(ECHO_END)
