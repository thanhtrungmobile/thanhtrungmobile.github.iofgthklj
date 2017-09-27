#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.lsticktock.plist"

inline int GetPrefInt(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];
}

inline bool GetPrefBool(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}



@interface SBFLockScreenDateView : UIView
@property (nonatomic, strong, readwrite) UIFont *font;
@end

@interface SBFLockScreenDateSubtitleDateView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end


%hook SBFLockScreenDateView
-(void) layoutSubviews {
%orig;
int newSize = GetPrefInt(@"datesize");

UILabel *label = MSHookIvar<UILabel *>(self, "_timeLabel");
label.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:newSize];
}
%end

%hook SBFLockScreenDateSubtitleDateView
-(void) layoutSubviews {
self.hidden = YES;
}
%end