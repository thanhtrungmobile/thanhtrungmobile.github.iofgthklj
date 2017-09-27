#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.infinios.plist"
 
inline bool GetPrefBool(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}




@interface WorldClockCellView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@property (nonatomic, strong, readwrite) UIColor *textColor;
@end

@interface UINavigationItemView
@property (nonatomic, strong, readwrite) UIColor *textColor;
@end

@interface MTDateLabel
@property (nonatomic, strong, readwrite) UIColor *textColor;
@end

@interface WorldClockTableViewCell
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface TimerControlsView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end