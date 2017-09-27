#import "./Alpha/NotificationCenter.h"
#import "./Alpha/Spotlight.h"
#import "./Alpha/ForceTouch.h"
#import "./Alpha/Folders.h"
#import "./Alpha/Lockscreen.h"

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.blurst.plist"
 
inline bool GetPrefBool(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline float GetPrefFloat(NSString *key) {
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] floatValue];
}

