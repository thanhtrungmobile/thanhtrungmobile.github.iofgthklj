include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Metanoia
Metanoia_FILES = MRootListController.m
Metanoia_INSTALL_PATH = /Library/PreferenceBundles
Metanoia_FRAMEWORKS = UIKit
Metanoia_PRIVATE_FRAMEWORKS = Preferences
Metanoia_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Metanoia.plist$(ECHO_END)
