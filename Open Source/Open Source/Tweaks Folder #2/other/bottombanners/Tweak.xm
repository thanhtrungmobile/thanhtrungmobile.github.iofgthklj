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

CGRect newFrame;
CGRect originalFrame;

%hook NCShortLookView
-(void) layoutSubviews {
      %orig;

// Listen for keyboard appearances and disappearances
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];

[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];

if(GetPrefBool(@"Enable")) {
BOOL isBanner = [self isBanner];
// float width = self.bounds.size.width;
// int height (GetPrefInt(@"bannerHeight"));

if(isBanner == TRUE) {

self.frame = CGRectMake(5, [[UIScreen mainScreen] bounds].size.height - self.bounds.size.height - 21, self.bounds.size.width - 10, self.bounds.size.height);

} else {
%orig;
}
}
}

%new
-(void) keyboardDidShow:(NSNotification *)notif {
self.frame = CGRectMake(5, [[UIScreen mainScreen] bounds].size.height - self.bounds.size.height - 228, self.bounds.size.width - 10, self.bounds.size.height);
}

%new
-(void) keyboardDidHide:(NSNotification *)notif {
self.frame = CGRectMake(5, [[UIScreen mainScreen] bounds].size.height - self.bounds.size.height - 21, self.bounds.size.width - 10, self.bounds.size.height);
}
%end
