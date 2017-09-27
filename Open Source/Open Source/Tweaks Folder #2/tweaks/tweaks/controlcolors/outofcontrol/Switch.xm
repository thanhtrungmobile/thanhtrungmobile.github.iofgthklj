#import "FSSwitchDataSource.h"
#import "FSSwitchPanel.h"

@interface NSUserDefaults (Tweak_Category)
- (id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
- (void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

static NSString *nsDomainString = @"com.antique.outofcontrol";
static NSString *nsNotificationString = @"com.antique.outofcontrol/preferences.changed";

@interface OutOfControlSwitch : NSObject <FSSwitchDataSource>
@end

@implementation OutOfControlSwitch

- (NSString *)titleForSwitchIdentifier:(NSString *)switchIdentifier {
	return @"OutOfControl";
}

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier {
	NSNumber *n = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"enabled" inDomain:nsDomainString];
	BOOL enabled = (n)? [n boolValue]:YES;
	return (enabled) ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier {
	switch (newState) {
	case FSSwitchStateIndeterminate:
		break;
	case FSSwitchStateOn:
		[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"enabled" inDomain:nsDomainString];
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)nsNotificationString, NULL, NULL, YES);
		break;
	case FSSwitchStateOff:
		[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:NO] forKey:@"enabled" inDomain:nsDomainString];
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)nsNotificationString, NULL, NULL, YES);
		break;
	}
	return;
}

@end
