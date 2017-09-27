include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = OutOfControl
OutOfControl_FILES = Switch.xm
OutOfControl_FRAMEWORKS = UIKit
OutOfControl_LIBRARIES = flipswitch
OutOfControl_INSTALL_PATH = /Library/Switches

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
    #PreferenceLoader plist
    $(ECHO_NOTHING)if [ -f Preferences.plist ]; then mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/OutOfControl; cp Preferences.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/OutOfControl/; fi$(ECHO_END)

after-install::
	install.exec "killall -9 SpringBoard"
