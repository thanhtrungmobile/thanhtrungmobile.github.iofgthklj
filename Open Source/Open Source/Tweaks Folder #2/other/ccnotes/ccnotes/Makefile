include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CCNotes
CCNotes_FILES = CCNRootListController.m
CCNotes_INSTALL_PATH = /Library/PreferenceBundles
CCNotes_FRAMEWORKS = UIKit
CCNotes_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/CCNotes.plist$(ECHO_END)
