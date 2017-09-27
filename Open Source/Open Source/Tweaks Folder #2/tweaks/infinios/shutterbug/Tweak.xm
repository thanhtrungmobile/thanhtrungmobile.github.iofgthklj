BOOL Enabled;
//
BOOL Iris;
BOOL Flip;
BOOL Flash;
BOOL HDR;
BOOL Timer;
BOOL Preview;
//
%group EVERYTHING
//
//
#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.infinios.plist"


inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}
//



%hook CAMIrisButton
+(id) irisButton {
    return Iris ? NULL : %orig;
}
%end

%hook CAMFlipButton
+(id) flipButton {
    return Flip ? NULL : %orig;
}
%end

%hook CAMTopBar
-(id) flashButton {
    return Flash ? NULL : %orig;
}
-(void) setFlashButton:(id)arg1 {
if(GetPrefBool(@"Flash")) {
arg1 = NULL;
%orig(arg1);
} return %orig;
}

-(id) HDRButton {
    return HDR ? NULL : %orig;
}
-(void) setHDRButton:(id)arg1 {
if(GetPrefBool(@"HDR")) {
arg1 = NULL;
%orig(arg1);
} return %orig;
}

-(id) timerButton {
    return Timer ? NULL : %orig;
}
-(void) setTimerButton:(id)arg1 {
if(GetPrefBool(@"Timer")) {
arg1 = NULL;
%orig(arg1);
} return %orig;
}
%end

%hook CAMImageWell
-(id)initWithFrame:(CGRect)arg1 {
if(GetPrefBool(@"Preview")) {
%orig(CGRectMake(0, 0, 0, 0));
} return %orig;
}
%end

//
//
static void loadPreferences() {

CFPreferencesAppSynchronize(CFSTR("com.antique.infinios"));
    NSNumber *tempVal;

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Enabled"), CFSTR("com.antique.infinios"));
    Enabled = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Iris"), CFSTR("com.antique.infinios"));
    Iris = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Flip"), CFSTR("com.antique.infinios"));
    Flip = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Flash"), CFSTR("com.antique.infinios"));
    Flash = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("HDR"), CFSTR("com.antique.infinios"));
    HDR = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Timer"), CFSTR("com.antique.infinios"));
    Timer = !tempVal ? NO : [tempVal boolValue];


    [tempVal release];
}	
%end


%ctor {

CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
	NULL,
	(CFNotificationCallback)loadPreferences,
	CFSTR("com.antique.infinios/settingschanged"),
	NULL,
	CFNotificationSuspensionBehaviorDeliverImmediately);
    loadPreferences();

    if (Enabled)
	%init(EVERYTHING);
    }

