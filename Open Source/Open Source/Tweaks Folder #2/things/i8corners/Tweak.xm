#import "Bits.h"


%hook UIWindow
-(void) layoutSubviews {
%orig;
int radius = GetPrefInt(@"cRadius");


if(GetPrefBool(@"Enable")) {
self.layer.cornerRadius = radius;
}
}
%end