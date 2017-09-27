#import "Bits.h"

@interface UIStatusBar : UIView
@end



%hook UIStatusBar
-(void) layoutSubviews {
%orig;


if(GetPrefBool(@"SBStyle")) {

if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
    CGSize screenHeight = [[UIScreen mainScreen] bounds].size;


if(sbstyle == 0) {
%orig;
} else if(sbstyle == 1) {
    if(screenHeight.height == 736) {
self.transform = CGAffineTransformMakeScale(0.8, 0.8);
self.frame = CGRectMake(0, 0, 414, 20);
} else if(screenHeight.height == 667) {
self.transform = CGAffineTransformMakeScale(0.8, 0.8);
self.frame = CGRectMake(0, 0, 375, 20);
} else if(screenHeight.height == 568) {
self.transform = CGAffineTransformMakeScale(0.8, 0.8);
self.frame = CGRectMake(0, 0, 320, 20);
}
}


}
}
}
%end