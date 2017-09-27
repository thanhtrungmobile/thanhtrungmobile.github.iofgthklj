#import "libcolorpicker.h"

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.infinios.plist"

inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}


@interface CKNavigationBar
@property (nonatomic,retain) UIColor * barTintColor; 
@end

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

@interface CKBalloonImageView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@property (nonatomic,retain) UIImage * image;
@end

@interface CKConversationListCell
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end



%hook CKNavigationBar 
-(void)layoutSubviews {
%orig;
if(GetPrefBool(@"ChattyBar")) {
%orig;
NSDictionary *prefsDict1 = [NSDictionary dictionaryWithContentsOfFile: PLIST_PATH];
 
NSString *coolColorHex = [prefsDict1 objectForKey:@"chattynavbar"];
 
 self.barTintColor = LCPParseColorString(coolColorHex, @"#ff0000");

}
}
%end

%hook CKBalloonImageView
-(void)layoutSubviews {
%orig;
if(GetPrefBool(@"ChattyBalloon")) {
%orig;
NSDictionary *prefsDict2 = [NSDictionary dictionaryWithContentsOfFile: PLIST_PATH];

NSString *coolColorHex = [prefsDict2 objectForKey:@"chattyballoons"];

 self.backgroundColor = LCPParseColorString(coolColorHex, @"#ff0000");
}
}
%end

%hook CKConversationListCell
-(void)layoutSubviews {
%orig;
if(GetPrefBool(@"HideLabel")) {
%orig;
UILabel *summaryLabel = MSHookIvar<UILabel *>(self, "_summaryLabel");
[summaryLabel setHidden:YES];
} 

if(GetPrefBool(@"ChattyCells")) {
%orig;
NSDictionary *prefsDict5 = [NSDictionary dictionaryWithContentsOfFile: PLIST_PATH];

NSString *coolColorHex = [prefsDict5 objectForKey:@"chattyccells"];

 self.backgroundColor = LCPParseColorString(coolColorHex, @"#ffffff");
}
}
%end

%hook CKUIBehavior 
-(id)green_balloonColors {
if(GetPrefBool(@"Green")) {
      return NULL;
} return %orig;
}
-(id)blue_balloonColors {
if(GetPrefBool(@"Blue")) {
      return NULL;
} return %orig;
}
%end

%hook CKChatItem
-(BOOL)canExport {
if(GetPrefBool(@"Export")) {
	return FALSE;
} return %orig;
}
-(BOOL)canSendAsTextMessage {
if(GetPrefBool(@"TextMessage")) {
	return FALSE;
} return %orig;
}
-(BOOL)canDelete {
if(GetPrefBool(@"Delete")) {
	return FALSE;
} return %orig;
}
-(BOOL)canForward {
if(GetPrefBool(@"Forward")) {
	return FALSE;
} return %orig;
}
-(BOOL)wantsDrawerLayout {
if(GetPrefBool(@"DrawerLayout")) {
	return FALSE;
} return %orig;
}
-(BOOL)hasTail {
if(GetPrefBool(@"Tail")) {
	return FALSE;
} return %orig;
}
-(BOOL)isEditable {
if(GetPrefBool(@"Editable")) {
	return FALSE;
} return %orig;
}
%end

