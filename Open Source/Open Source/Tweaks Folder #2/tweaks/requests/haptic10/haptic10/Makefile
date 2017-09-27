GO_EASY_ON_ME = 1

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Haptic10
Haptic10_FILES = HapticRootListController.m
Haptic10_INSTALL_PATH = /Library/PreferenceBundles
Haptic10_FRAMEWORKS = UIKit
Haptic10_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Haptic10.plist$(ECHO_END)
