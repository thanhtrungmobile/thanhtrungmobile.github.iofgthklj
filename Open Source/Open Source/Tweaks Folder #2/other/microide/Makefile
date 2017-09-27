include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = microIDE
microIDE_FILES = main.m IDEAppDelegate.m IDERootViewController.m
microIDE_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/application.mk

after-install::
	install.exec "uicache"
