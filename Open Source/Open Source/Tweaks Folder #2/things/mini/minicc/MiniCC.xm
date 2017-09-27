#import "ControlCenterUI.h"
#import "Bits.h"

@interface ACAppPageView : UIView
@end





%hook CCUIControlCenterViewController
-(void) viewDidLoad {
%orig;

if(ccstyle == 0) {
%orig;
} else if(ccstyle == 1) {
self.view.transform = CGAffineTransformMake(0.70, 0, 0, 0.70, 0, 0);
}
}
%end

%hook HUHomeControlCenterViewController
-(void) viewDidLoad {
%orig;

if(ccstyle == 0) {
%orig;
} else if(ccstyle == 1) {
self.view.transform = CGAffineTransformMake(0.70, 0, 0, 0.70, 0, 0);
}
}
%end

%hook ACAppPageView
-(void) layoutSubviews {
%orig;

if(acstyle == 2) {
self.transform = CGAffineTransformMake(1.4, 0, 0, 1.4, 0, 0);
} else if(acstyle == 3) {
%orig;
}
}
%end