ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)
GO_EASY_ON_ME = 1
DEBUG = 0
THEOS_BUILD_DIR = /var/mobile/build

include theos/makefiles/common.mk

BUNDLE_NAME = InfiniOS
InfiniOS_FILES = InfiniOS.mm
InfiniOS_INSTALL_PATH = /Library/PreferenceBundles
InfiniOS_FRAMEWORKS = UIKit
InfiniOS_PRIVATE_FRAMEWORKS = Preferences
InfiniOS_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/InfiniOS.plist$(ECHO_END)
