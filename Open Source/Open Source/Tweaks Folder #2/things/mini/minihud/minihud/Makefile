include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = MiniHUD
MiniHUD_FILES = MiniHUDRootListController.m
MiniHUD_INSTALL_PATH = /Library/PreferenceBundles
MiniHUD_FRAMEWORKS = UIKit
MiniHUD_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/MiniHUD.plist$(ECHO_END)
