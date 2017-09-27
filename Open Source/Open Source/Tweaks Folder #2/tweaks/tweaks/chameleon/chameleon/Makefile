ARCHS = arm64 armv7

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Chameleon
Chameleon_FILES = Chameleon.mm
Chameleon_INSTALL_PATH = /Library/PreferenceBundles
Chameleon_FRAMEWORKS = UIKit Twitter
Chameleon_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Chameleon.plist$(ECHO_END)
