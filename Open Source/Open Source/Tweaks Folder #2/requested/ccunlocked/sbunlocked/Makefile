include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = SBUnlocked
SBUnlocked_FILES = UListController.m
SBUnlocked_INSTALL_PATH = /Library/PreferenceBundles
SBUnlocked_FRAMEWORKS = UIKit
SBUnlocked_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/SBUnlocked.plist$(ECHO_END)
