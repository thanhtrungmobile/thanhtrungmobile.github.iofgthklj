#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.minicc.plist"

inline bool GetPrefBool(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline int GetPrefInt(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];
}

NSString *deviceType = [UIDevice currentDevice].model;

NSUserDefaults *prefs = [[NSUserDefaults alloc] initWithSuiteName:@"com.antique.minicc"];

NSInteger acstyle = [[prefs objectForKey:@"acstyle"] intValue];
NSInteger ccstyle = [[prefs objectForKey:@"ccstyle"] intValue];