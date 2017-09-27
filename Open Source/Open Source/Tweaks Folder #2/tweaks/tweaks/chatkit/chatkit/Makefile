ARCHS = arm64 armv7

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ChatKit
ChatKit_FILES = ChatKit.mm
ChatKit_INSTALL_PATH = /Library/PreferenceBundles
ChatKit_FRAMEWORKS = UIKit Twitter
ChatKit_PRIVATE_FRAMEWORKS = Preferences
ChatKit_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/ChatKit.plist$(ECHO_END)
