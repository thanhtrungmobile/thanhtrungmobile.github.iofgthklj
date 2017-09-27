include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = AntennaRemembers
AntennaRemembers_FILES = ARRootListController.m
AntennaRemembers_INSTALL_PATH = /Library/PreferenceBundles
AntennaRemembers_FRAMEWORKS = UIKit
AntennaRemembers_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/AntennaRemembers.plist$(ECHO_END)
