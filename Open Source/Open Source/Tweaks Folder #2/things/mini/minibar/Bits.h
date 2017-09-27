#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.minibar.plist"

inline bool GetPrefBool(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline int GetPrefInt(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];
}


NSUserDefaults *prefs = [[NSUserDefaults alloc] initWithSuiteName:@"com.antique.minibar"];

NSInteger sbstyle = [[prefs objectForKey:@"sbstyle"] intValue];

NSString *deviceType = [UIDevice currentDevice].model;