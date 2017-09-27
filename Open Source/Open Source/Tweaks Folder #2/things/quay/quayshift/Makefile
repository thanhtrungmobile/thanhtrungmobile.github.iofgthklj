include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = QuayShift
QuayShift_FILES = QuayShiftRootListController.m
QuayShift_INSTALL_PATH = /Library/PreferenceBundles
QuayShift_FRAMEWORKS = UIKit
QuayShift_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/QuayShift.plist$(ECHO_END)
