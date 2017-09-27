include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Homi
Homi_FILES = HomiRootListController.m
Homi_INSTALL_PATH = /Library/PreferenceBundles
Homi_FRAMEWORKS = UIKit
Homi_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Homi.plist$(ECHO_END)
