GO_EASY_ON_ME = 1

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = TapTapCCLight
TapTapCCLight_FILES = TTCCLRootListController.m
TapTapCCLight_INSTALL_PATH = /Library/PreferenceBundles
TapTapCCLight_FRAMEWORKS = UIKit
TapTapCCLight_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/TapTapCCLight.plist$(ECHO_END)
