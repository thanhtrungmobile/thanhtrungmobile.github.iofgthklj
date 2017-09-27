include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Surge
Surge_FILES = SurgeRootListController.m
Surge_INSTALL_PATH = /Library/PreferenceBundles
Surge_FRAMEWORKS = UIKit
Surge_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Surge.plist$(ECHO_END)
