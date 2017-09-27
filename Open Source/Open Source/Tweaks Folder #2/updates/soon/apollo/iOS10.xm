#import "iOS10.h"

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.infinios.plist"

inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}



%hook CCUIControlCenterPagePlatterView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"ApolloSleeker")) {
UIImageView *whiten = MSHookIvar<UIImageView *>(self,"_whiteLayerView");
[whiten setHidden:YES];
}

if(GetPrefBool(@"ApolloColour")) {
NSDictionary *prefsDict = [NSDictionary dictionaryWithContentsOfFile: PLIST_PATH];
 
NSString *coolColorHex = [prefsDict objectForKey:@"apollocolour"];
 
 self.backgroundColor = LCPParseColorString(coolColorHex, @"#fff000");
} return %orig;
}
%end

%hook CCUIControlCenterPushButton
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"ApolloDarkBackgrounds")) {
UIView *colour = MSHookIvar<UIView *>(self,"_backgroundFlatColorView");
[colour setHidden:YES];
} return %orig;
}
%end

%hook MPUControlCenterMediaControlsView
-(void) setLayoutStyle:(NSUInteger)arg1 {
%orig;
if(GetPrefBool(@"ApolloMusicSplit")) {
arg1 = 1;
%orig(arg1);
} return %orig;
}
%end

%hook CCUIControlCenterViewController
-(NSInteger) layoutStyle {
%orig;
if(GetPrefBool(@"ApolloStyle")) {
   if(UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation)) {
         return 1;   
}

  else if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
         return 1; 
    } 
} return %orig;
}
%end




/* 
Apollo Top Options
*/

%hook CCUIAirplaneModeSetting
+(BOOL) isInternalButton {
%orig;
if(GetPrefBool(@"ApolloAir")) {
return YES;
} return %orig;
}
%end

%hook CCUIWiFiSetting
+(BOOL) isInternalButton {
%orig;
if(GetPrefBool(@"ApolloWiFi")) {
return YES;
} return %orig;
}
%end

%hook CCUIBluetoothSetting
+(BOOL) isInternalButton {
%orig;
if(GetPrefBool(@"ApolloBlue")) {
return YES;
} return %orig;
}
%end

%hook CCUIDoNotDisturbSetting
+(BOOL) isInternalButton {
%orig;
if(GetPrefBool(@"ApolloDND")) {
return YES;
} return %orig;
}
%end

%hook CCUIOrientationLockSetting
+(BOOL) isInternalButton {
%orig;
if(GetPrefBool(@"ApolloOrientation")) {
return YES;
} return %orig;
}
%end

%hook CCUICellularDataSetting
+(BOOL) isInternalButton {
%orig;
if(GetPrefBool(@"ApolloData")) {
return YES;
} return %orig;
}
%end

%hook CCUILowPowerModeSetting
+(BOOL) isInternalButton {
%orig;
if(GetPrefBool(@"ApolloPower")) {
return YES;
} return %orig;
}
%end