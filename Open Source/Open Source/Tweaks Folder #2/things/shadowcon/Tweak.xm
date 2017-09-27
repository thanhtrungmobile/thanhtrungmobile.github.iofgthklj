#import "libcolorpicker.h"
#import <SpringBoard/SpringBoard.h>

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.shadowcon.plist"

inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline int GetPrefInt(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];
}

NSDictionary *pref1 = [NSDictionary dictionaryWithContentsOfFile:PLIST_PATH];
NSString *coolColorHex = [pref1 objectForKey:@"iconColour"];


@interface SBIconView : UIView
@end



%hook SBIconView
-(void) layoutSubviews {
%orig;
NSDictionary *radius = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.shadowcon.plist"]];

NSDictionary *opaq = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.shadowcon.plist"]];

UIView *label = MSHookIvar<UIView *>(self, "_labelView");



if(GetPrefBool(@"Enable")) {

label.layer.shadowColor = LCPParseColorString(coolColorHex, @"#ffffff").CGColor;

label.layer.shadowOffset = CGSizeMake(0, 0);

label.layer.shadowRadius = [[radius objectForKey:@"shadowRad"] intValue];

label.layer.shadowOpacity = [[opaq objectForKey:@"shadowOpaq"] intValue];
}
}
%end