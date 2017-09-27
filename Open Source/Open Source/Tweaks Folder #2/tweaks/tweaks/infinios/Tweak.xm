#import "libcolorpicker.h"
#import <UIKit/UIKit.h>
#import <AppList/AppList.h>

BOOL Enabled;

//CHATKIT//

BOOL Export;
BOOL TextMessage;
BOOL Delete;
BOOL Forward;
BOOL DrawerLayout;
BOOL Display;
BOOL Tail;
BOOL Editable;
BOOL Green;
BOOL Blue;
BOOL TypingGroup;

//SETTINGS//

BOOL Separate;
BOOL Corners;



%group EVERYTHING
//
//
#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.infinios.plist"


inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}
//
//
//
//
////INTERFACES////

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

//////CHATKIT//////
////////////////////////

@interface CKBalloonImageView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end
@interface CKConversationListCell : UITableViewCell
-(UILabel *)_summaryLabel;
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end


%hook CKBalloonImageView
-(void)layoutSubviews {
if(GetPrefBool(@"Balloon")) {
NSDictionary *prefsDict1 = [NSDictionary dictionaryWithContentsOfFile: PLIST_PATH];

NSString *coolColorHex = [prefsDict1 objectForKey:@"customballoon"];

 self.backgroundColor = LCPParseColorString(coolColorHex, @"#ff0000");
%orig;
} return %orig;
}

%end

%hook CKConversation
-(BOOL)_chatSupportsTypingIndicators {
       return TypingGroup ? NO : %orig;
}

%end

%hook CKUIBehavior 

-(id)green_balloonColors {
      return Green ? NULL : %orig;
}
-(id)blue_balloonColors {
      return Blue ? NULL : %orig;
}

%end

%hook CKChatItem
-(BOOL)canExport {
	return Export ? NO : %orig;
}
-(BOOL)canSendAsTextMessage {
	return TextMessage ? NO : %orig;
}
-(BOOL)canDelete {
	return Delete ? NO : %orig;
}
-(BOOL)canForward {
	return Forward ? NO : %orig;
}
-(BOOL)wantsDrawerLayout {
	return DrawerLayout ? NO : %orig;
}
-(BOOL)displayDuringSend {
	return Display ? NO : %orig;
}
-(BOOL)hasTail {
	return Tail ? NO : %orig;
}
-(BOOL)isEditable {
	return Editable ? NO : %orig;
}

%end

%hook CKConversationListCell
-(void)layoutSubviews {
if(GetPrefBool(@"HideLabel")) {
UILabel *label = MSHookIvar<UILabel *>(self, "_summaryLabel");
[label setHidden:YES];
} return %orig;
}

%end



//////CONTROLCENTER//////
//////////////////////////

@interface  SBControlCenterContainerView : UIView
- (UIView *)dynamicsContainerView;
- (UIView *)contentContainerView;
@end

@interface SBControlCenterViewController : UIViewController
- (id)view;
@end


@interface SBControlCenterController : NSObject
+(id)sharedInstance;
@end

@interface SBControlCenterContentContainerView
@property (nonatomic,retain) _UIBackdropView * backdropView; 
@end

%hook SBControlCenterContainerView
- (void)layoutSubviews
 {
if(GetPrefBool(@"Corners")) {
%orig;


     UIView *view = MSHookIvar<UIView *>(self,"_darkeningView");
     view.hidden = YES;

     //sets the corner radius of the control center
	   self.dynamicsContainerView.layer.cornerRadius = 20.0;
	   self.dynamicsContainerView.clipsToBounds = YES;

	   view.layer.cornerRadius = 20.0;
	   view.clipsToBounds = YES;
	   view.userInteractionEnabled = YES;

} return %orig;
}
%end

%hook SBControlCenterContentContainerView
-(void)layoutSubviews {
 %orig;
 _UIBackdropViewSettings *settings2 = [[%c(_UIBackdropViewSettingsColored) alloc] initWithDefaultValues];
 [self.backdropView.outputSettings setUsesColorTintView:YES];
 [self.backdropView addColorTintViewIfNeededForSettings:settings2];
 [self.backdropView prepareForTransitionToSettings:settings2];
    [self.backdropView computeAndApplySettingsForTransition];
 [self.backdropView applySettings:settings2];

if(GetPrefBool(@"ControlCenter")) {
NSDictionary *prefsDict2 = [NSDictionary dictionaryWithContentsOfFile: PLIST_PATH];
 
NSString *coolColorHex = [prefsDict2 objectForKey:@"customcontrol"];
 
 settings2.colorTint = LCPParseColorString(coolColorHex, @"#f2f2f2");
}
}
%end



//////NOTIFICATIONCENTER//////
////////////////////////////////////////////

@interface SBNotificationCenterViewController
@property (nonatomic,readonly) _UIBackdropView * backdropView; 
@end

@interface SBTodayTableHeaderView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor; 
@end

@interface SBNotificationVibrantButton
@property (retain, nonatomic) UIButton *vibrantButton;
@end

@interface SBTodayTableFooterView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor; 
@end

@interface SBNotificationCenterHeaderView
@property (nonatomic,readonly) _UIBackdropView * backdropView; 
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

NSDictionary *prefsDict7 = [NSDictionary dictionaryWithContentsOfFile: PLIST_PATH];

NSString *coolColorHex = [prefsDict7 objectForKey:@"editcolour"];
if(GetPrefBool(@"NCEditColour")) {
 self.backgroundColor = LCPParseColorString(coolColorHex, @"#b3b3b3");
}
}
%end



//////LOCKSCREEN//////
///////////////////////////////


@interface SBLockScreenDeviceInformationTextView
@property (copy, nonatomic) NSString *supervisionText;
@end

%hook SBLockScreenDeviceInformationTextView
-(void)layoutSubviews {
%orig;
self.supervisionText = [NSString stringWithFormat:@"Antique_Dev"];
}
%end





static void loadPreferences() {

CFPreferencesAppSynchronize(CFSTR("com.antique.infinios"));
    NSNumber *tempVal;

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Enabled"), CFSTR("com.antique.infinios"));
    Enabled = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Export"), CFSTR("com.antique.infinios"));
    Export = !tempVal ? NO : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("TextMessage"), CFSTR("com.antique.infinios"));
    TextMessage = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Delete"), CFSTR("com.antique.infinios"));
    Delete = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Forward"), CFSTR("com.antique.infinios"));
    Forward = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("DrawerLayout"), CFSTR("com.antique.infinios"));
    DrawerLayout = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Display"), CFSTR("com.antique.infinios"));
    Display = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Editable"), CFSTR("com.antique.infinios"));
    Editable = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Tail"), CFSTR("com.antique.infinios"));
    Tail = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Blue"), CFSTR("com.antique.infinios"));
    Blue = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Green"), CFSTR("com.antique.infinios"));
    Green = !tempVal ? NO : [tempVal boolValue];
    
tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("TypingGroup"), CFSTR("com.antique.infinios"));
    TypingGroup = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Separate"), CFSTR("com.antique.infinios"));
    Separate = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Corners"), CFSTR("com.antique.infinios"));
    Corners = !tempVal ? NO : [tempVal boolValue];

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

