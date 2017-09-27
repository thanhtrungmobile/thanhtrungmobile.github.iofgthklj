#import "libcolorpicker.h"

BOOL Enabled;
//
BOOL Export;
BOOL TextMessage;
BOOL Delete;
BOOL Forward;
BOOL DrawerLayout;
BOOL Display;
BOOL Tail;
BOOL Editable;
//
BOOL Green;
BOOL Blue;
//
BOOL TypingGroup;
//
%group EVERYTHING
//
//
#define PLIST_PATH @"/var/mobile/Library/Preferences/red.antique.chatkit.plist"


inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}
//
@interface CKConversationListCell : UITableViewCell
-(UILabel *)_summaryLabel;
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
-(UILabel *)_textLabel;
@end

%hook CKConversationListCell
-(void)layoutSubviews {
if(GetPrefBool(@"HideLabel")) {
UILabel *label = MSHookIvar<UILabel *>(self, "_summaryLabel");
[label setHidden:YES];
} 
if(GetPrefBool(@"NightMode")) {
self.backgroundColor = [UIColor blackColor];
UILabel *label = MSHookIvar<UILabel *>(self, "_summaryLabel");
label.textColor = [UIColor whiteColor];
} return %orig;
}

%end
//
@interface CKBalloonImageView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end
//

%hook CKBalloonImageView
-(void)layoutSubviews {
if(GetPrefBool(@"Custom")) {
NSDictionary *prefsDict = [NSDictionary dictionaryWithContentsOfFile: PLIST_PATH];// assuming this holds your prefs
NSString *coolColorHex = [prefsDict objectForKey:@"customcolor"]; // assuming that the key has a value saved like #FFFFFF:0.75423

 self.backgroundColor = LCPParseColorString(coolColorHex, @"#ff0000"); // fallback to red (#ff0000)
// do something with coolColor
%orig;
} return %orig;
}

%end
//
//
%hook CKConversation
-(BOOL)_chatSupportsTypingIndicators {
       return TypingGroup ? NO : %orig;
}

%end
//
//
%hook CKUIBehavior 

-(id)green_balloonColors {
      return Green ? NULL : %orig;
}
-(id)blue_balloonColors {
      return Blue ? NULL : %orig;
}

%end
//
//
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
//
//
static void loadPreferences() {

CFPreferencesAppSynchronize(CFSTR("red.antique.chatkit"));
    NSNumber *tempVal;

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Enabled"), CFSTR("red.antique.chatkit"));
    Enabled = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Export"), CFSTR("red.antique.chameleon"));
    Export = !tempVal ? NO : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("TextMessage"), CFSTR("red.antique.chameleon"));
    TextMessage = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Delete"), CFSTR("red.antique.chameleon"));
    Delete = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Forward"), CFSTR("red.antique.chameleon"));
    Forward = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("DrawerLayout"), CFSTR("red.antique.chameleon"));
    DrawerLayout = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Display"), CFSTR("red.antique.chameleon"));
    Display = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Editable"), CFSTR("red.antique.chameleon"));
    Editable = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Tail"), CFSTR("red.antique.chameleon"));
    Tail = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Blue"), CFSTR("red.antique.chameleon"));
    Blue = !tempVal ? NO : [tempVal boolValue];

tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Green"), CFSTR("red.antique.chameleon"));
    Green = !tempVal ? NO : [tempVal boolValue];
    
tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("TypingGroup"), CFSTR("red.antique.chameleon"));
    TypingGroup = !tempVal ? NO : [tempVal boolValue];

    [tempVal release];
}	
%end


%ctor {

CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
	NULL,
	(CFNotificationCallback)loadPreferences,
	CFSTR("red.antique.chatkit/settingschanged"),
	NULL,
	CFNotificationSuspensionBehaviorDeliverImmediately);
    loadPreferences();

    if (Enabled)
	%init(EVERYTHING);
    }

