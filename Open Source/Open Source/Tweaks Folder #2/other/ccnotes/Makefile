TARGET = iphone:clang:latest:latest
ARCHS = armv7 armv7s arm64
GO_EASY_ON_ME = 0

include theos/makefiles/common.mk

TWEAK_NAME = CCNotes
CCNotes_FILES = Tweak.xm CCNotesPageViewController.m
CCNotes_FRAMEWORKS = UIKit CoreGraphics
CCNotes_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
SUBPROJECTS += ccnotes
include $(THEOS_MAKE_PATH)/aggregate.mk
