#import "Bits.h"



%hook SBLowPowerAlertItem
- (id) initWithLevel:(int)arg1 {
%orig;
}
%end