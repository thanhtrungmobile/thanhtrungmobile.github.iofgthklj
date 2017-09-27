//#import <UIKit/UIKit2.h>

%config(generator=internal);

%hook UINavigationBar
- (CGSize)defaultSizeForOrientation:(UIInterfaceOrientation)orientation {
if([self promptView])
		return %orig;
	CGSize size;
	size.width = %orig.width;
	size.height = 34.0f;
	return size;
}
%end

%hook UIToolbar
- (CGSize)defaultSizeForOrientation:(UIInterfaceOrientation)orientation {
	CGSize size;
	size.width = %orig.width;
	size.height = 34.0f;
	return size;
}
%end





%ctor {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	NSString *bundleIdentifier = [NSBundle mainBundle].bundleIdentifier;
	if (bundleIdentifier) {
		NSString *key = [@"DBEnabled-" stringByAppendingString:bundleIdentifier];
		NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.rpetrich.dietbar.plist"];
		id temp = [settings objectForKey:key];
		if (!temp || [temp boolValue]) {
			%init;
		}
	}
	[pool drain];
}