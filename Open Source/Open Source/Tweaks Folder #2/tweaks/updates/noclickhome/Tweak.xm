#include <notify.h>


#define TouchIDFingerUp   0
#define TouchIDFingerDown   1
#define TouchIDFingerHeld   2
#define TouchIDMatched   3
#define TouchIDUnlocked   4
#define TouchIDNotMatched   10


@interface UIApplication (Z)
- (void)_simulateHomeButtonPress;
@end

@interface SBMainSwitcherViewController
+ (SBMainSwitcherViewController *)sharedInstance;
- (_Bool)toggleSwitcherNoninteractively;
@end


%hook SBReachabilityManager
+ (_Bool)reachabilitySupported {
	return YES;
}

- (void)_handleReachabilityActivated {
	[[%c(SBMainSwitcherViewController) sharedInstance] toggleSwitcherNoninteractively];
}
%end

%hook SBDashBoardViewController
- (void)handleBiometricEvent:(unsigned long long)arg1 {
	%orig;

	if (arg1 == TouchIDFingerDown) {	notify_post("com.antique.noclickhome.touchIdDown");
	}
}
%end


static void TouchHome_TouchIdDown(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo)
{
	@try {
		[[UIApplication sharedApplication] _simulateHomeButtonPress];
	}
	@catch (NSException *exception) {
		NSLog(@">>>> Exception:%@",exception);
	}
}

%hook SpringBoard
// Register listener
- (void)applicationDidFinishLaunching: (id) application {
    %orig;

	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, TouchHome_TouchIdDown, CFSTR("com.antique.noclickhome.touchIdDown"), NULL, CFNotificationSuspensionBehaviorCoalesce);
}
%end