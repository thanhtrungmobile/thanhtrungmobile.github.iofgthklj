ARCHS = armv7 arm64

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Appitizer
Appitizer_FILES = Appitizer.mm
Appitizer_INSTALL_PATH = /Library/PreferenceBundles
Appitizer_FRAMEWORKS = UIKit
Appitizer_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Appitizer.plist$(ECHO_END)
