@interface NCShortLookView : UIView
@property (nonatomic, assign, readwrite) CGRect frame;
@property (nonatomic) double cornerRadius;
-(BOOL) isBanner;
@end


#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.bottombanners.plist"

inline bool GetPrefBool(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline int GetPrefInt(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];
}