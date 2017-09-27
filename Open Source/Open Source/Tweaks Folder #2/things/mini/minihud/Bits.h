#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.minihud.plist"

inline bool GetPrefBool(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline int GetPrefInt(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];
}


NSUserDefaults *prefs = [[NSUserDefaults alloc] initWithSuiteName:@"com.antique.minihud"];

NSInteger hudstyle = [[prefs objectForKey:@"hudstyle"] intValue];