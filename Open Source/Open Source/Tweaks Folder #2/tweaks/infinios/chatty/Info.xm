#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.infinios.plist"

inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}




%hook CKDetailsContactsTableViewCell
-(BOOL)showPhoneButton {
if(GetPrefBool(@"ChattyPButton")) {
       return FALSE;
} return %orig;
}
-(BOOL)showMessageButton {
if(GetPrefBool(@"ChattyMButton")) {
       return FALSE;
} return %orig;
}
-(BOOL)showFaceTimeVideoButton {
if(GetPrefBool(@"ChattyFTButton")) {
       return FALSE;
} return %orig;
}
-(BOOL)showInfoButton {
if(GetPrefBool(@"ChattyIButton")) {
       return FALSE;
} return %orig;
}
%end