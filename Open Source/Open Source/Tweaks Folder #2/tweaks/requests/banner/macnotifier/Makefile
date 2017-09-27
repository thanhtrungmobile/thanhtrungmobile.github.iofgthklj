ARCHS = arm64 armv7

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = MacNotifier
MacNotifier_FILES = MacNotifier.mm
MacNotifier_INSTALL_PATH = /Library/PreferenceBundles
MacNotifier_FRAMEWORKS = UIKit Twitter
MacNotifier_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/MacNotifier.plist$(ECHO_END)
