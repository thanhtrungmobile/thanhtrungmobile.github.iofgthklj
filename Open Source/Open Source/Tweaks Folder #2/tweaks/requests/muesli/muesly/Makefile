include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Muesly
Muesly_FILES = MueslyRootListController.m
Muesly_INSTALL_PATH = /Library/PreferenceBundles
Muesly_FRAMEWORKS = UIKit
Muesly_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Muesly.plist$(ECHO_END)
