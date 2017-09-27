#import "Bits.h"

/*
    bool  _backgroundBlurred;
    UIView * _backgroundView;
    double  _cornerRadius;
    UIView * _customContentView;
    UIView * _headerContainerView;
    UIView * _headerOverlayView;
    UIView * _mainContainerView;
    UIView * _mainOverlayView;
    UIImageView * _shadowView;
*/

%hook NCShortLookView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"Enable")) {
BOOL isBanner = [self isBanner];
float width = self.bounds.size.width;
int height (GetPrefInt(@"bannerHeight"));


if(isBanner == TRUE) {
 if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {



CGSize screenHeight = [[UIScreen mainScreen] bounds].size;

    if(screenHeight.height == 736) {
// iPhone 6 Plus/6s Plus
self.frame = CGRectMake(0, 638 - height, width, 80);
} else if(screenHeight.height == 667) {
// iPhone 6/6s
self.frame = CGRectMake(0, 569 - height, width, 80);
} else if(screenHeight.height == 568) {
// iPhone 5s
self.frame = CGRectMake(0, 470 - height, width, 80);
} else {
      }
    }
  }
}
}
%end
