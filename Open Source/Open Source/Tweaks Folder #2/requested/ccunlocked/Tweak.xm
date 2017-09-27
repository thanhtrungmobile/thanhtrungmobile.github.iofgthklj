#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.sbunlocked.plist"

inline bool GetPrefBool(NSString *key) {
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline float GetPrefFloat(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] floatValue];
}


@interface CCUIBackgroundDarkeningWithPlatterCutoutView : UIView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface CCUIButtonLikeSectionSplitView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface CCUINightShiftContentView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface CCUIControlCenterPagePlatterView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface _UIBackdropView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface SBIconLegibilityLabelView
@property (nonatomic, assign, readwrite) CGFloat alpha;
@end

////
// Control Center
////

%hook CCUIRecordScreenShortcut
+ (BOOL)isInternalButton {
if(GetPrefBool(@"CCRec")) {
	return NO;
} return %orig;
}
+ (BOOL)isSupported:(int)arg1 {
if(GetPrefBool(@"CCRec")) {
	return YES;
} return %orig;
}
- (UIImage *)glyphImageForState:(UIControlState)state {
if(GetPrefBool(@"CCRec")) {
	return [UIImage imageNamed:@"RecordVideo-OrbHW@2x.png" inBundle:[NSBundle bundleWithPath:@"/Applications/Camera.app/"]];
} return %orig;
}
%end

%hook CCUICellularDataSetting
+ (BOOL)isInternalButton {
if(GetPrefBool(@"CCData")) {
	return NO;
} return %orig;
}
+ (BOOL)isSupported:(int)arg1 {
if(GetPrefBool(@"CCData")) {
	return YES;
} return %orig;
}
+(id)statusOnString {
if(GetPrefBool(@"CCData")) {
      return @"Mobile Data: On";
} return %orig;
}
+(id)statusOffString {
if(GetPrefBool(@"CCData")) {
      return @"Mobile Data: Off";
} return %orig;
}
- (UIImage *)glyphImageForState:(UIControlState)state {
if(GetPrefBool(@"CCData")) {
		return [UIImage imageNamed:@"action-call-OrbHW@2x.png" inBundle:[NSBundle bundleWithPath:@"/Applications/Maps.app/"]];
} return %orig;
}
%end

%hook CCUILowPowerModeSetting
+ (bool)isInternalButton {
if(GetPrefBool(@"CCLow")) {
	return NO;
}return %orig;
}
+ (bool)isSupported:(int)arg1 {
if(GetPrefBool(@"CCLow")) {
	return YES;
} return %orig;
}
+ (NSString *)statusOffString {
if(GetPrefBool(@"CCLow")) {
	return @"Low Power Mode: Off";
} return %orig;
}
+ (NSString *)statusOnString {
if(GetPrefBool(@"CCLow")) {
	return @"Low Power Mode: On";
} return %orig;
}
- (UIImage *)glyphImageForState:(UIControlState)state {
if(GetPrefBool(@"CCLow")) {
		return [UIImage imageNamed:@"pinDot@2x.png" inBundle:[NSBundle bundleWithPath:@"/Applications/CoreAuthUI.app/"]];
} return %orig;
}
%end

%hook CCUIButtonLikeSectionSplitView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"CCAir")) {
self.hidden = YES;
} return %orig;
}
%end

%hook CCUIBackgroundDarkeningWithPlatterCutoutView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"CCDView")) {
UIView *above = MSHookIvar<UIView *>(self,"_above");
[above setHidden:YES];

UIView *below = MSHookIvar<UIView *>(self,"_below");
[below setHidden:YES];

UIView *left = MSHookIvar<UIView *>(self,"_left");
[left setHidden:YES];

UIView *right = MSHookIvar<UIView *>(self,"_right");
[right setHidden:YES];

UIImageView *corners = MSHookIvar<UIImageView *>(self,"_imageView");
[corners setHidden:YES];
} return %orig;
}
%end

%hook CCUINightShiftContentView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"CCNight")) {
self.hidden = YES;
} return %orig;
}
%end

%hook _UIBackdropView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"CCVisi")) {
self.hidden = YES;
} return %orig;
}
%end


////
// Home Screen
////

%hook SBNewsstandIcon
-(id) displayName {
%orig;
if(GetPrefBool(@"HSILabel")) {
	return NULL;
} return %orig;
}
%end

%hook SBNewsstandFolder 
-(void) setDisplayName:(id)arg1 {
%orig;
if(GetPrefBool(@"HSILabel")) {
	%orig(NULL);
} return %orig;
}
%end

%hook SBFolder 
-(id)defaultDisplayName {
%orig;
if(GetPrefBool(@"HSILabel")) {
	return NULL;
} return %orig;
}
%end

%hook SBApplication
-(id) iconDisplayName:(id)arg1 {
%orig;
if(GetPrefBool(@"HSILabel")) {
	return NULL;
} return %orig;
}

-(id)displayName {
%orig;
if(GetPrefBool(@"HSILabel")) {
	return NULL;
} return %orig;
}
%end

%hook SBIconLegibilityLabelView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"HSILabel")) {
self.alpha = 0;
} return %orig;
}
%end
