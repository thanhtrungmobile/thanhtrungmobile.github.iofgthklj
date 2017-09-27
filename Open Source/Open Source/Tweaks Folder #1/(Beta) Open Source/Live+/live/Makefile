include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Live
Live_FILES = LiveRootListController.m
Live_INSTALL_PATH = /Library/PreferenceBundles
Live_FRAMEWORKS = UIKit
Live_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Live.plist$(ECHO_END)
