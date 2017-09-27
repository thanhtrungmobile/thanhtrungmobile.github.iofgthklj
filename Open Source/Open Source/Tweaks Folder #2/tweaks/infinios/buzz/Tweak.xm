#import "libcolorpicker.h"

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.infinios.plist"


inline bool GetPrefBool(NSString *key) {
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline int GetPrefInt(NSString *key) {
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];
}



@interface _UIBackdropViewSettings
- (void)setColorTint:(id)arg1;
- (void)setUsesColorTintView:(BOOL)arg1;
- (void)setStyle:(int)arg1;
- (id)initWithDefaultValues;
- (void)setBlurRadius:(CGFloat)arg1;
- (void)setBlurHardEdges:(int)arg1;
- (void)setBlurQuality:(id)arg1;
-(void)setTintColor:(id)arg1;
@end

@interface _UIBackdropView : UIView
- (_UIBackdropViewSettings *)outputSettings;
-(id)initWithFrame:(CGRect)frame autosizesToFitSuperview:(BOOL)size settings:(id)settings;
-(void)setBlurRadius:(CGFloat)arg1;
-(void)setRequiresColorStatistics:(BOOL)arg1;
-(void)setUsesColorTintView:(BOOL)arg1;
-(void)setColorTintAlpha:(float)arg1;
-(void)setColorTintMaskAlpha:(float)arg1;
-(void)setColorTint:(id)arg1;
-(void)applySettings:(id)arg1;
- (void)prepareForTransitionToSettings:(id)arg1;
-(void)computeAndApplySettingsForTransition;
- (void)addColorTintViewIfNeededForSettings:(id)arg1;
@end

@interface SBNotificationCenterViewController
@property (nonatomic,readonly) _UIBackdropView * backdropView; 
@end

@interface SBTodayTableHeaderView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor; 
@end

@interface SBNotificationsBulletinCell
@property (nonatomic, copy, readwrite) UIColor *backgroundColor; 
@end

@interface SBNotificationVibrantButton
@property (retain, nonatomic) UIButton *vibrantButton;
@end

@interface SBTodayTableFooterView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor; 
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface SBNotificationCenterHeaderView
@property (nonatomic,readonly) _UIBackdropView * backdropView; 
@end

@interface SBBulletinWindow
@property (nonatomic, assign, readwrite, setter=_setContinuousCornerRadius:) CGFloat _continuousCornerRadius;
@end

@interface SBModeViewController
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface SBChevronView
@property (nonatomic) double animationDuration;
@property (retain, nonatomic) UIColor *color;
@end


%hook SBNotificationCenterViewController 
-(void)viewWillAppear:(BOOL)arg1 {
	%orig;
_UIBackdropViewSettings *settings3 = [[%c(_UIBackdropViewSettingsColored) alloc] initWithDefaultValues];
	[self.backdropView.outputSettings setUsesColorTintView:YES];
	[self.backdropView addColorTintViewIfNeededForSettings:settings3];
	[self.backdropView prepareForTransitionToSettings:settings3];
	[self.backdropView computeAndApplySettingsForTransition];
	[self.backdropView applySettings:settings3];


if(GetPrefBool(@"NCBackground")) {
NSDictionary *prefsDict3 = [NSDictionary dictionaryWithContentsOfFile: PLIST_PATH];
 
NSString *coolColorHex = [prefsDict3 objectForKey:@"background"];
 
 settings3.colorTint = LCPParseColorString(coolColorHex, @"#b3b3b3");
}
}
%end

%hook SBTodayTableHeaderView
-(void)layoutSubviews {
%orig;

NSDictionary *prefsDict4 = [NSDictionary dictionaryWithContentsOfFile: PLIST_PATH];

NSString *coolColorHex = [prefsDict4 objectForKey:@"datebackground"];
if(GetPrefBool(@"NCDateBackground")) {
 self.backgroundColor = LCPParseColorString(coolColorHex, @"#b3b3b3");
}


if(GetPrefBool(@"NCDateLabel")) {
UILabel *label = MSHookIvar<UILabel *>(self,"_dateLabel");
[label setHidden:YES];
}

if(GetPrefBool(@"NCDateColour")) {
UILabel *label = MSHookIvar<UILabel *>(self,"_dateLabel");
label.textColor = [UIColor blackColor];
} %orig;
}
%end

%hook SBNotificationVibrantButton
-(void)layoutSubviews {
%orig;
if(GetPrefBool(@"NCEditButton")) {
UIButton *overlay = MSHookIvar<UIButton *>(self,"_overlayButton");
[overlay setHidden:YES];

UIButton *vibrant = MSHookIvar<UIButton *>(self,"_vibrantButton");
[vibrant setHidden:YES];
} %orig;
}
%end

%hook UISegmentedControl 
-(void)layoutSubviews {
%orig;

NSDictionary *prefsDict5 = [NSDictionary dictionaryWithContentsOfFile: PLIST_PATH];

NSString *coolColorHex = [prefsDict5 objectForKey:@"segment"];
if(GetPrefBool(@"NCSegment")) {
 self.tintColor = LCPParseColorString(coolColorHex, @"#808080");
}
}
%end

%hook SBNotificationCenterHeaderView
-(void)viewWillAppear:(BOOL)arg1 {
	%orig;
_UIBackdropViewSettings *settings4 = [[%c(_UIBackdropViewSettingsColored) alloc] initWithDefaultValues];
	[self.backdropView.outputSettings setUsesColorTintView:YES];
	[self.backdropView addColorTintViewIfNeededForSettings:settings4];
	[self.backdropView prepareForTransitionToSettings:settings4];
	[self.backdropView computeAndApplySettingsForTransition];
	[self.backdropView applySettings:settings4];


if(GetPrefBool(@"NCTimeColour")) {
NSDictionary *prefsDict6 = [NSDictionary dictionaryWithContentsOfFile: PLIST_PATH];
 
NSString *coolColorHex = [prefsDict6 objectForKey:@"ncctimehead"];
 
 settings4.colorTint = LCPParseColorString(coolColorHex, @"#b3b3b3");
}
}
%end

%hook SBTodayTableFooterView
-(void)layoutSubviews {
%orig;
if(GetPrefBool(@"NCEditColour")) {
NSDictionary *prefsDict7 = [NSDictionary dictionaryWithContentsOfFile: PLIST_PATH];

NSString *coolColorHex = [prefsDict7 objectForKey:@"editcolour"];
if(GetPrefBool(@"NCEditColour")) {
 self.backgroundColor = LCPParseColorString(coolColorHex, @"#b3b3b3");
}
}

if(GetPrefBool(@"NCBHidden")) {
self.hidden = YES;
} return %orig;
}
%end


%hook SBBulletinWindow
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"NCCorners")) {
NSDictionary *corner = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.infinios.plist"]];
self._continuousCornerRadius = [[corner objectForKey:@"kNCCorners"] floatValue];
}
}
%end

%hook SBModeViewController 
-(void) viewWillLayoutSubviews {
%orig;
if(GetPrefBool(@"NCHideSwitch")) {
UIView *segment = MSHookIvar<UIView *>(self,"_headerView");
[segment setHidden:YES];
}
}
%end

%hook SBChevronView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"NCChevTime")) {
NSDictionary *anim = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.infinios.plist"]];
self.animationDuration = [[anim objectForKey:@"kChevTime"] intValue];
}

if(GetPrefBool(@"NCChevColour")) {
NSDictionary *prefsDict4 = [NSDictionary dictionaryWithContentsOfFile: PLIST_PATH];
NSString *coolColorHex = [prefsDict4 objectForKey:@"ncchevcolour"];

if(GetPrefBool(@"NCChevColour")) {
 self.color = LCPParseColorString(coolColorHex, @"#000000");
}
}
}
%end