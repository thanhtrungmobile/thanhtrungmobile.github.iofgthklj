#import "./Blur/NotificationCenter.h"
#import "./Blur/Spotlight.h"
#import "./Blur/ForceTouch.h"
#import "./Blur/Folders.h"
#import "./Blur/Lockscreen.h"
#import "./Blur/AppSwitcher.h"
#import "./Blur/General.h"
#import "./Blur/Dock.h"


#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.blurst.plist"
 
inline bool GetPrefBool(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline float GetPrefFloat(NSString *key) {
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] floatValue];
}



%hook SBNotificationCenterViewController
-(void) viewDidLoad {
%orig;
if(GetPrefBool(@"NCBlur")) {
UIView *background = MSHookIvar<UIView *>(self, "_backgroundView");

	float ncblur = GetPrefFloat(@"ncblur");
background.alpha = ncblur;
   }
}
%end


%hook SBSearchBackdropView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SLBlur")) {
SBSearchBackdropView *background = MSHookIvar<SBSearchBackdropView *>(self, "_backdropView");

       float slblur = GetPrefFloat(@"slblur");
background.alpha = slblur;
   }
}
%end


%hook SBUIIconForceTouchVisualEffectView
- (void)setEffectStrength:(double)arg1 {
%orig;
if(GetPrefBool(@"FTBlur")) {

       float ftblur = GetPrefFloat(@"ftblur");
arg1 = ftblur;
%orig(arg1);
   } return %orig;
}
%end


%hook SBFolderControllerBackgroundView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"FBBlur")) {
UIVisualEffectView *background = MSHookIvar<UIVisualEffectView *>(self, "_blurView");

       float fbblur = GetPrefFloat(@"fbblur");
background.alpha = fbblur;
   }
}
%end


%hook SBFolderBackgroundView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"FBlur")) {

       float fblur = GetPrefFloat(@"fblur");
self.alpha = fblur;
   }
}
%end


%hook SBDashBoardBackgroundView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"LSBlur")) {
SBBackdropView *background = MSHookIvar<SBBackdropView *>(self, "_backdropView");

       float lsblur = GetPrefFloat(@"lsblur");
background.alpha = lsblur;
   }
}
%end


%hook UIVisualEffectView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"GBlur")) {

       float gblur = GetPrefFloat(@"gblur");
self.alpha = gblur;
   }
}
%end

%hook SBDockView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"DBlur")) {
SBWallpaperEffectView *background = MSHookIvar<SBWallpaperEffectView *>(self, "_backgroundView");

       float dblur = GetPrefFloat(@"dblur");
background.alpha = dblur;
   }
}
%end