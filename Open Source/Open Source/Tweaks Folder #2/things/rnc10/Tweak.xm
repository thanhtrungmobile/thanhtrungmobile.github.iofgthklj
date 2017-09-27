/*
    UIView *_clippingView;
    UIView *_containerView;
    UIView *_contentView;
    UIView *_backgroundView;
    UIView *_tintView;
*/

#import <SpringBoard/SBNotificationCenterViewController.h>

%hook SBNotificationCenterViewController
/*
-(void)_setContainerFrame:(CGRect)arg1 {
%orig;
	UIView *contentClip = [self valueForKey:@"_contentClippingView"];
	UIView *container = [self valueForKey:@"_containerView"];

	CGRect contentClipFrame = [contentClip frame];
	CGRect containerFrame = [container frame];

	contentClipFrame.origin.y = -containerFrame.origin.y;

	[contentClip setFrame:contentClipFrame];
}
*/
- (CGRect)revealRectForBulletin:(id)bulletin {
	return CGRectMake(0, 0, 0, 0);
}
%end