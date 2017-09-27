#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.surge.plist"

inline bool GetPrefBool(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline int GetPrefInt(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];
}

NSString *deviceType = [UIDevice currentDevice].model;

NSUserDefaults *prefs = [[NSUserDefaults alloc] initWithSuiteName:@"com.antique.surge"];

NSInteger blurstyle= [[prefs objectForKey:@"blurstyle"] intValue];
NSInteger dotstyle = [[prefs objectForKey:@"dotstyle"] intValue];
NSInteger dotborder = [[prefs objectForKey:@"dotborder"] intValue];
NSInteger vision = [[prefs objectForKey:@"vision"] intValue];

UIView *window;
UIVisualEffectView *visualEffectView;

UIView *base;
UIView *ten;
UIView *twenty;
UIView *thirty;
UIView *forty;
UIView *fifty;
UIView *sixty;
UIView *seventy;
UIView *eighty;
UIView *ninety;
UIView *hundred;


static int battery;

@interface SBDashBoardBackgroundView : UIView
@end

@interface SBDashBoardMainPageView : UIView
-(void) updateUI;
-(void) update:(NSNotification*)notification;
@end

@interface SBFLockScreenDateSubtitleView : UIView
@property(nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface SBUIController
-(id) sharedInstance;
-(int) batteryCapacityAsPercentage;
@end