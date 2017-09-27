include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = MiniBar
MiniBar_FILES = MiniBarRootListController.m
MiniBar_INSTALL_PATH = /Library/PreferenceBundles
MiniBar_FRAMEWORKS = UIKit
MiniBar_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/MiniBar.plist$(ECHO_END)
