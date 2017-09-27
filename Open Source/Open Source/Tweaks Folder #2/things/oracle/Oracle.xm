#import <substrate.h>
#import <UIKit/UIKit.h>
#import <SpringBoard/SpringBoard.h>
#import <CoreFoundation/CoreFoundation.h>
#import <AppList/AppList.h>

@interface SpringBoard (Oracle)
+(id)sharedInstance;
-(id)_accessibilityFrontMostApplication;
@end

@interface SBApplicationController
+(id) sharedInstance;
- (id)applicationWithBundleIdentifier:(id)arg1;
@end

@interface SBApplicationIcon : NSObject
-(id)initWithApplication:(id)arg1 ;
-(id)generateIconImage:(int)arg1 ;
@end

@interface SBSlideUpAppGrabberView : UIView
@end


%hook SBSlideUpAppGrabberView
-(void) setGrabberImageFromAppWithBundleIdentifier:(id)arg1 {
%orig;
}

-(CGSize) sizeThatFits:(CGSize)arg1 {
return CGSizeMake(29, 29);
}

-(void) layoutSubviews {
self.layer.cornerRadius = 13.5;
}
%end