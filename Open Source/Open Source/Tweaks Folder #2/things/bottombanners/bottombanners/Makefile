include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = BottomBanners
BottomBanners_FILES = BBRootListController.m
BottomBanners_INSTALL_PATH = /Library/PreferenceBundles
BottomBanners_FRAMEWORKS = UIKit
BottomBanners_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/BottomBanners.plist$(ECHO_END)
