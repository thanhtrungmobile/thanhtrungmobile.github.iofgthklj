BOOL Enabled;
//
BOOL Icon;
BOOL Action;
BOOL Title;
BOOL Subtitle;
BOOL Date;
BOOL Grabber;
//
%group EVERYTHING
//
//

#define kPath @"/var/mobile/Library/Preferences/red.antique.macnotifier.plist"


@interface SBBannerContextView : UIView
- (id)_newGrabberView:(BOOL)view;
- (CGFloat)minimumHeight;
@end

%hook SBBannerContainerViewController
-(void)viewDidLoad:(BOOL)arg1 {
UIView *view = MSHookIvar<UIView *>(self, "_backgroundView");
view.setColorTint = [UIColor blueColor];
}
%end

%hook SBBulletinBannerItem

-(id)iconImage {
       return Icon ? NULL : %orig;
}

-(bool)_supportsSubActions {
       return Action ? NO : %orig;
}

-(id)title {
       return Title ? NULL : %orig;
}

-(id)subtitle {
       return Subtitle ? NULL : %orig;
}

-(id)sourceDate {
      return Date ? NULL : %orig;
}
%end

%hook SBBannerContextView
- (id)_newGrabberView:(BOOL)view {
	return Grabber ? NULL : %orig;
}

- (void)layoutSubviews {
  
}

- (CGFloat)minimumHeight {
	NSDictionary *prefs = [[NSDictionary alloc] initWithContentsOfFile:kPath];
%orig;
if ([[prefs objectForKey:@"kHeight"] boolValue]) {

NSDictionary *height = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/red.antique.macnotifier.plist"]];
return [[height objectForKey:@"kHeight"] intValue];

} 
[prefs release];
return %orig;
}
%end
//
//
static void loadPreferences() {

CFPreferencesAppSynchronize(CFSTR("red.antique.macnotifier"));
    NSNumber *tempVal;

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Enabled"), CFSTR("red.antique.macnotifier"));
    Enabled = !tempVal ? NO : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Icon"), CFSTR("red.antique.macnotifier"));
    Icon = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Action"), CFSTR("red.antique.macnotifier"));
    Action = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Title"), CFSTR("red.antique.macnotifier"));
    Title = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Subtitle"), CFSTR("red.antique.macnotifier"));
    Subtitle = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Date"), CFSTR("red.antique.macnotifier"));
    Date = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Grabber"), CFSTR("red.antique.macnotifier"));
    Grabber = !tempVal ? NO : [tempVal boolValue];

    [tempVal release];
}	
%end


%ctor {

CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
	NULL,
	(CFNotificationCallback)loadPreferences,
	CFSTR("red.antique.macnotifier/settingschanged"),
	NULL,
	CFNotificationSuspensionBehaviorDeliverImmediately);
    loadPreferences();

    if (Enabled)
	%init(EVERYTHING);
    }

