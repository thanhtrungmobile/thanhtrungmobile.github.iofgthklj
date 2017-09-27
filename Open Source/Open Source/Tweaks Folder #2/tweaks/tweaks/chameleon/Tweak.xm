
BOOL Enabled;

BOOL VoiceControl;
BOOL Spotlight;
BOOL LSBlur;
BOOL LSTint;
BOOL Nested;
BOOL BetaDot;
BOOL SlowAnim;
BOOL HSRotate;
BOOL iPadDock;
BOOL StaticDock;
BOOL NoPageDots;
BOOL NotBlocked;
BOOL NewTweets;
BOOL OldBounce;
BOOL LSRotate;
BOOL PinchToClose;
BOOL NoLabels;
BOOL NewsFolder;
//
BOOL UninstallSupported;
BOOL Updated;
BOOL ShowTitle;
BOOL CC;
BOOL Badge;
BOOL IconTitle;
BOOL FolderLabel;
//
BOOL Green;
BOOL Blue;
//
BOOL Separate;
//
BOOL Status;


%group EVERYTHING


#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.chameleon.plist"
 
inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}


%hook UIStatusBarStyleAttributes 
-(double)foregroundAlpha {
if(GetPrefBool(@"Status")) {
	 return 0;
} return %orig;
}
%end

%hook UIApplication
-(bool)isStatusBarHidden {
if(GetPrefBool(@"Status")) {
	return YES;
} return %orig;
}
%end

%hook UITableViewCell 
-(bool)_shouldHideSeparator {
	return Separate ? YES : %orig;
}
%end

%hook UITableView 
-(void)setSeparatorStyle:(long long)arg1 {
if(GetPrefBool(@"Separate")) {
%orig(0);
} return %orig;
}
%end
	
%hook UITableViewCellSeparatorView

-(void)setSeparatorEffect:(id)arg1 {
if(GetPrefBool(@"Separate")) {
%orig(0);
} return %orig;
}
-(id)separatorEffect {
if(GetPrefBool(@"Separate")) {
return 0;
} return %orig;
}
%end



%hook UIAlertControllerVisualStyle

-(bool)hideActionSeparators {
       return Separate ? YES : %orig;
}
%end


%hook SBIconBadgeView
-(bool)displayingAccessory {
    return Badge ? NO : %orig;
}
%end

%hook SBApplicationShortcutMenuContentView
-(double)_rowHeight {
NSDictionary *height = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.chameleon.plist"]];
return [[height objectForKey:@"kHeight"] intValue];
}


- (double)_menuWidth {
NSDictionary *height = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.chameleon.plist"]];
return [[height objectForKey:@"kWidth"] intValue];
}
%end


%hook SBDockView
+ (double)defaultHeight {
	NSDictionary *vertical = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.chameleon.plist"]];
return [[vertical objectForKey:@"kVert"] intValue];
}
%end


%hook SBControlCenterController
- (bool)controlCenterViewController:(id)arg1 canHandleGestureRecognizer:(id)arg2
{
    return CC ? NO : %orig;
}

- (bool)gestureRecognizerShouldBegin:(id)arg1 
{
    return CC ? NO : %orig;
}
%end



%hook SBFolderView
-(bool)_showsTitle 
{
    return ShowTitle ? NO : %orig;
}

- (double)_titleFontSize {
	NSDictionary *size = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.chameleon.plist"]];
return [[size objectForKey:@"kSize"] intValue];
}
%end


%hook SBVoiceControlController
-(bool) handleHomeButtonHeld
{
    return VoiceControl ? NO : %orig;
}
%end

%hook SBSearchScrollView
-(bool) gestureRecognizerShouldBegin:(id)arg1
{
    return Spotlight ? NO : %orig;
}
%end

%hook SBLockOverlayStyleProperties
-(CGFloat) blurRadius
{
    return LSBlur ? 0 : %orig;
}
%end

%hook SBLockOverlayStyleProperties   
-(CGFloat) tintAlpha
{
    return LSTint ? 0 : %orig;
}
%end

%hook SBFolderSettings
-(bool) allowNestedFolders
{
    return Nested ? YES : %orig;
}
-(bool) pinchToClose
{
	return PinchToClose ? YES : %orig;
}
%end

%hook SBLeafIcon
-(bool) isBeta
{
    return BetaDot ? NO : %orig;
}  

-(bool) isUninstallSupported 
{
    return UninstallSupported ? NO : %orig;
}

-(bool) isRecentlyUpdated 
{
    return Updated ? NO : %orig;
}

%end

%hook SBFAnimationFactorySettings
-(void) setSlowAnimations:(bool)arg1
{
    return SlowAnim ? %orig(false) : %orig;
}
%end

%hook SpringBoard
-(bool) homeScreenRotationStyleWantsUIKitRotation
{
    return HSRotate ? YES : %orig;
}
-(bool) homeScreenSupportsRotation
{
	return HSRotate ? YES : %orig;
}
-(long long) homeScreenRotationStyle
{
if (iPadDock)
{
	return 1;
}
else
{
	if (StaticDock)
	{
		return 2;
	}
	else
	{
		return %orig;
	}
}
}
%end

%hook SBIconPageIndicatorImageSetResult
-(id) pageIndicatorSet
{
	return NoPageDots ? NULL : %orig;
}
-(id) enabledPageIndicatorSet
{
	return NoPageDots ? NULL : %orig;
}
%end

%hook TFNTwitterRelationship
-(BOOL) isBlockingCurrentAccount
{
	return NotBlocked ? NO : %orig;
}
%end

%hook TFNTwitterAccount
-(BOOL) isHomeTimelineNewTweetsBannerExperimentEnabledLogImpression:(BOOL)arg1
{
	return NewTweets ? YES : %orig;
}
%end

%hook SBControlCenterSettings
-(BOOL) useNewBounce
{
	return OldBounce ? NO : %orig;
}
%end

%hook SBLockScreenViewController
-(bool)_forcesPortraitOrientation
{
	return LSRotate ? NO : %orig;
}
-(bool) shouldAutorotateToInterfaceOrientation:(long long)arg1
{
	return LSRotate ? NO : %orig;
}
%end

%hook SBNewsstandIcon
-(id) displayName
{
	return NoLabels ? NULL : %orig;
}
%end

%hook SBNewsstandFolder 
-(void) setDisplayName:(id)arg1
{
	return NoLabels ? %orig(NULL) : %orig;
}
%end

%hook SBFolder 
-(id)defaultDisplayName {
	return NoLabels ? NULL : %orig;
}
%end

%hook SBApplication
-(id) iconDisplayName:(id)arg1
{
	return NoLabels ? NULL : %orig;
}

-(id)displayName {
	return IconTitle ? NULL : %orig;
}
%end

%hook SBFolder
-(bool) isNewsstandFolder
{
	return NewsFolder ? YES : %orig;
}
%end



static void loadPreferences() {

NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.antique.chameleon.plist"];
    if(prefs)
    {
    }
    [prefs release];


CFPreferencesAppSynchronize(CFSTR("com.antique.chameleon"));
    NSNumber *tempVal;

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Enabled"), CFSTR("com.antique.chameleon"));
    Enabled = !tempVal ? NO : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("VoiceControl"), CFSTR("com.antique.chameleon"));
    VoiceControl = !tempVal ? NO : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Spotlight"), CFSTR("com.antique.chameleon"));
    Spotlight = !tempVal ? NO : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("LSBlur"), CFSTR("com.antique.chameleon"));
    LSBlur = !tempVal ? NO : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("LSTint"), CFSTR("com.antique.chameleon"));
    LSTint = !tempVal ? NO : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Nested"), CFSTR("com.antique.chameleon"));
    Nested = !tempVal ? NO : [tempVal boolValue];
    
    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("BetaDot"), CFSTR("com.antique.chameleon"));
    BetaDot = !tempVal ? NO : [tempVal boolValue];
    
    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("SlowAnim"), CFSTR("com.antique.chameleon"));
    SlowAnim = !tempVal ? NO : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("HSRotate"), CFSTR("com.antique.chameleon"));
    HSRotate = !tempVal ? NO : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("iPadDock"), CFSTR("com.antique.chameleon"));
    iPadDock = !tempVal ? NO : [tempVal boolValue];  
    
    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("StaticDock"), CFSTR("com.antique.chameleon"));
    StaticDock = !tempVal ? NO : [tempVal boolValue]; 

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NoPageDots"), CFSTR("com.antique.chameleon"));
    NoPageDots = !tempVal ? NO : [tempVal boolValue]; 

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NotBlocked"), CFSTR("com.antique.chameleon"));
    NotBlocked = !tempVal ? NO : [tempVal boolValue]; 

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NewTweets"), CFSTR("com.antique.chameleon"));
    NewTweets = !tempVal ? NO : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("OldBounce"), CFSTR("com.antique.chameleon"));
    OldBounce = !tempVal ? NO : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("LSRotate"), CFSTR("com.antique.chameleon"));
    LSRotate = !tempVal ? NO : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("PinchToClose"), CFSTR("com.antique.chameleon"));
    PinchToClose = !tempVal ? NO : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NoLabels"), CFSTR("com.antique.chameleon"));
    NoLabels = !tempVal ? NO : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NewsFolder"), CFSTR("com.antique.chameleon"));
    NewsFolder = !tempVal ? NO : [tempVal boolValue];

//----------


tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("UninstallSupported"), CFSTR("com.antique.chameleon"));
    UninstallSupported = !tempVal ? NO : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Updated"), CFSTR("com.antique.chameleon"));
    Updated = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Status"), CFSTR("com.antique.chameleon"));
    Status = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("CC"), CFSTR("com.antique.chameleon"));
    CC = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Badge"), CFSTR("com.antique.chameleon"));
    Badge = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("IconTitle"), CFSTR("com.antique.chameleon"));
    IconTitle = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Separate"), CFSTR("com.antique.chameleon"));
    Separate = !tempVal ? NO : [tempVal boolValue];

    [tempVal release];
}	
%end


%ctor {

CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
	NULL,
	(CFNotificationCallback)loadPreferences,
	CFSTR("com.antique.chameleon/settingschanged"),
	NULL,
	CFNotificationSuspensionBehaviorDeliverImmediately);
    loadPreferences();

    if (Enabled)
	%init(EVERYTHING);
    }

