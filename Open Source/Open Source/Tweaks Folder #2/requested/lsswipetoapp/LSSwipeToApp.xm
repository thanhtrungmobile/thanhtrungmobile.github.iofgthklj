#import "LSSwipeToAppHelper.h"

%group main
@interface SBApplication : NSObject
- (id)launchInterfaceFileName;
- (id)defaultLaunchImageFile;

- (id)bundleVersion;
- (id)_parseCustomSpotlightIconPaths;
- (void)purgeAllCaches;
- (void)purgeBundleCaches;
- (id)bundle;
- (double)modificationDate;
- (id)bundleContainerPath;
- (id)dataContainerPath;
- (id)path;
- (id)iconIdentifier;
- (id)bundleIdentifier;
@end

@interface CCUICameraShortcut
@end

@interface SBAppView : UIView
@property(readonly, nonatomic) SBApplication *application;

- (id)_launchInterfaceView;
@end

@interface SBApplicationController : NSObject
+ (id)sharedInstanceIfExists;
+ (id)sharedInstance;
- (id)applicationWithBundleIdentifier:(id)arg1;
- (id)cameraApplication;
@end

BOOL isTweakEnabled;
NSString *LSSTA_AppId;
static void LSSwipeToApp_Prefs() {

	NSDictionary *LSSwipeToAppSettings = [NSDictionary dictionaryWithContentsOfFile:[LSSwipeToAppHelper preferencesPath]];
	NSNumber *isTweakEnabledNU = LSSwipeToAppSettings[@"isTweakEnabled"];
    isTweakEnabled = isTweakEnabledNU ? [isTweakEnabledNU boolValue] : 0;
    LSSTA_AppId = LSSwipeToAppSettings[@"LSSTA_AppId"];
}

static void lssta_HandleUpdate() {
	LSSwipeToApp_Prefs();

	[[%c(SBApplicationController) sharedInstance] cameraApplication];

}

static void lsstaInit()
{
	[[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *block) {
		CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)lssta_HandleUpdate, [LSSwipeToAppHelper preferencesChanged], NULL, 0);
		lssta_HandleUpdate();
 
     }];
}


%hook SBAppView
- (BOOL)_shouldLoadInterfaceFileBasedStaticContent {

	NSDictionary *LSSwipeToAppSettings = [NSDictionary dictionaryWithContentsOfFile:[LSSwipeToAppHelper preferencesPath]];
	NSNumber *isTweakEnabledNU = LSSwipeToAppSettings[@"isTweakEnabled"];
    isTweakEnabled = [isTweakEnabledNU boolValue];
    LSSTA_AppId = LSSwipeToAppSettings[@"LSSTA_AppId"];

    if (isTweakEnabled) {
    	if ([self.application.bundleIdentifier isEqualToString:LSSTA_AppId]) {
			return NO;
		}
		return %orig();
   	} else {
   		return %orig();
    }
}
%end

%hook SBApplicationController
- (id)cameraApplication {
	NSDictionary *LSSwipeToAppSettings = [NSDictionary dictionaryWithContentsOfFile:[LSSwipeToAppHelper preferencesPath]];
	NSNumber *isTweakEnabledNU = LSSwipeToAppSettings[@"isTweakEnabled"];
    isTweakEnabled = [isTweakEnabledNU boolValue];
    LSSTA_AppId = LSSwipeToAppSettings[@"LSSTA_AppId"];


	if (isTweakEnabled) {
		if ([LSSTA_AppId isEqualToString:@"com.apple.camera"]) {
    		return %orig();
    	} else {
    		return [self applicationWithBundleIdentifier:LSSTA_AppId];
    	}
	} else {
		return %orig();
	}
}
%end
%end


%ctor {
	@autoreleasepool {
		[[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *block) {
	        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)LSSwipeToApp_Prefs, [LSSwipeToAppHelper preferencesChanged], NULL, 0);
	        LSSwipeToApp_Prefs();
	 
	    }];
		%init(main);
	}
}
