#import "Bits.h"

@interface SBHUDWindow : UIView
@end


%hook SBHUDWindow
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"VStyle")) {
if(hudstyle == 0) {
self.transform = CGAffineTransformMakeScale(1, 1);
} else if(hudstyle == 1) {
self.transform = CGAffineTransformMakeScale(0.5, 0.5);
} else if(hudstyle == 2) {
self.transform = CGAffineTransformMakeScale(1.55, 1.55);
}
}
}
%end