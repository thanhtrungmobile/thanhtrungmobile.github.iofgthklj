#import "libcolorpicker.h"

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.homi.plist"


inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

@interface SBIconLabelView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface SBIconImageView
@property (nonatomic) _Bool showsSquareCorners;
@end

@interface SBFolderIconView
@property (nonatomic, assign, readwrite) CGFloat iconLabelAlpha;
@end

@interface SBApplicationShortcutMenuBackgroundView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@property (nonatomic) double cornerRadius;
@end

%hook SBRootIconListView
+ (unsigned long long)iconRowsForInterfaceOrientation:(long long)arg1 {
if(GetPrefBool(@"kRows")) {
%orig;
NSDictionary *rows = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.homi.plist"]];
return [[rows objectForKey:@"kRows"] intValue];
} return %orig;
}
%end


%hook SBDockView
+ (double)defaultHeight {
NSDictionary *height = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.homi.plist"]];
return [[height objectForKey:@"kDock"] intValue];
}
%end

%hook SBIconView
- (void)setIsEditing:(BOOL)arg1 animated:(BOOL)arg2 {
if(GetPrefBool(@"IconJiggle")) {
arg1 = TRUE;
arg2 = TRUE;
%orig(arg1, arg2);
} return %orig;
}
%end

%hook SBFolder 
-(id)defaultDisplayName {
if(GetPrefBool(@"HideLabel")) {
 return NULL;
} return %orig;
}
%end

%hook SBApplication
-(id) iconDisplayName:(id)arg1 {
if(GetPrefBool(@"HideLabel")) {
 return NULL;
} return %orig;
}

-(id)displayName {
if(GetPrefBool(@"HideLabel")) {
return NULL;
} return %orig;
}
%end

%hook SBFolderIconView
-(void)setLabelHidden:(BOOL)arg1 {
if(GetPrefBool(@"HideLabel")) {
%orig(TRUE);
} return %orig;
}
%end

%hook SBNewsstandIcon
-(id) displayName {
if(GetPrefBool(@"HideLabel")) {
return NULL;
} return %orig;
}
%end

%hook SBNewsstandFolder 
-(void) setDisplayName:(id)arg1 {
if(GetPrefBool(@"HideLabel")) {
return %orig(NULL);
} return %orig;
}
%end

%hook SBFolderIconView
-(void) layoutSubviews {
if(GetPrefBool(@"HideLabel")) {
self.iconLabelAlpha = 0;
} return %orig;
}
%end

%hook SBIconImageView
-(void) layoutSubviews {
if(GetPrefBool(@"Square")) {
self.showsSquareCorners = YES;
} return %orig;
}
%end

%hook SBApplicationShortcutMenu
-(void) layoutSubviews {
if(GetPrefBool(@"SCBackground")) {
UIView *blur = MSHookIvar<UIView *>(self, "_backgroundContainerView");
[blur setHidden:YES];
} return %orig;
}
%end

%hook SBApplicationShortcutMenuBackgroundView
-(void) layoutSubviews {
if(GetPrefBool(@"SCBackground2")) {
%orig;
NSDictionary *prefsDict = [NSDictionary dictionaryWithContentsOfFile: PLIST_PATH];
 
NSString *coolColorHex = [prefsDict objectForKey:@"scbackground2"];
 
 self.backgroundColor = LCPParseColorString(coolColorHex, @"#ffffff");
} return %orig;
}
%end

%hook SBApplicationShortcutMenuContentView
-(void) setCornerRadius:(CGFloat)arg1 {
if(GetPrefBool(@"SCCorner")) {
%orig;
NSDictionary *radius = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.homi.plist"]];
arg1 = [[radius objectForKey:@"kSCCorner"] intValue];
} return %orig;
}
%end