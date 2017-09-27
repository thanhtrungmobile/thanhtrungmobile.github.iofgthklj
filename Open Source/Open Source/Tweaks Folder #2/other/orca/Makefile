TARGET = iphone:clang:8.1:latest
ARCHS = armv7 armv7s arm64
GO_EASY_ON_ME = 1

include theos/makefiles/common.mk

TWEAK_NAME = Orca
Orca_FILES = Tweak.xm CCAlegroPageViewController.m Files/GameScene.m Files/GameOverScene.m
Orca_FRAMEWORKS = UIKit CoreGraphics QuartzCore Foundation SpriteKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"