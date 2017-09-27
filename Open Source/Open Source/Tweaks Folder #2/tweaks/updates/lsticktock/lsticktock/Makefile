include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = LSTickTock
LSTickTock_FILES = LSTTRootListController.m
LSTickTock_INSTALL_PATH = /Library/PreferenceBundles
LSTickTock_FRAMEWORKS = UIKit
LSTickTock_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/LSTickTock.plist$(ECHO_END)
