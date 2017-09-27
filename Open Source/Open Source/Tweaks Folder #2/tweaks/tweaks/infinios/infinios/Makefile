ARCHS = arm64 armv7

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = InfiniOS
InfiniOS_FILES = InfiniOS.mm
InfiniOS_INSTALL_PATH = /Library/PreferenceBundles
InfiniOS_FRAMEWORKS = UIKit
InfiniOS_PRIVATE_FRAMEWORKS = Preferences
InfiniOS_LIBRARIES = colorpicker applist

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/InfiniOS.plist$(ECHO_END)
