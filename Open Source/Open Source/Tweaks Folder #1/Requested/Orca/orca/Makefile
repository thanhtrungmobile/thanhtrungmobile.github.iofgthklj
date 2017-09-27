include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Orca
Orca_FILES = OrcaRootListController.m
Orca_INSTALL_PATH = /Library/PreferenceBundles
Orca_FRAMEWORKS = UIKit
Orca_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Orca.plist$(ECHO_END)
