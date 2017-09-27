#import "libcolorpicker.h"

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.infinios.plist"


inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline float GetPrefFloat(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] floatValue];
}

@interface SBRootIconListView
@property (nonatomic, assign, readwrite) CGFloat alpha;
@end

@interface SBDockIconListView
@property (nonatomic, assign, readwrite) CGFloat alpha;
@end




%hook SBRootIconListView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SpringIcon")) {
    float alpha = GetPrefFloat(@"springicon");
self.alpha = alpha;
} return %orig;
}
%end

%hook SBDockIconListView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SpringIcon")) {
    float alpha = GetPrefFloat(@"springicon");
self.alpha = alpha;
} return %orig;
}
%end