include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Glimpse
Glimpse_FILES = GlimpseRootListController.m
Glimpse_INSTALL_PATH = /Library/PreferenceBundles
Glimpse_FRAMEWORKS = UIKit
Glimpse_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Glimpse.plist$(ECHO_END)
