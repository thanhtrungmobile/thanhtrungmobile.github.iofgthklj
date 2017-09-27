include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = MiniCC
MiniCC_FILES = MiniCCRootListController.m
MiniCC_INSTALL_PATH = /Library/PreferenceBundles
MiniCC_FRAMEWORKS = UIKit
MiniCC_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/MiniCC.plist$(ECHO_END)
