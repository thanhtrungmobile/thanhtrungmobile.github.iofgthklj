@interface _UITouchForceMessage : NSObject
@property (nonatomic) double timestamp;
@property (nonatomic) float unclampedTouchForce;
- (void)setUnclampedTouchForce:(float)touchForce;
- (float)unclampedTouchForce;
@end

@interface UITouch (Private)
- (void)_setPressure:(float)arg1 resetPrevious:(BOOL)arg2;
- (float)_pathMajorRadius;
- (float)majorRadius;
@end

@interface SBIconView : UIView <UIGestureRecognizerDelegate>
@end

@interface UIPreviewInteractionController : NSObject
- (BOOL)startInteractivePreviewAtLocation:(id)arg1 inView:(id)arg2;
- (BOOL)startInteractivePreviewWithGestureRecognizer:(id)arg1;
- (void)commitInteractivePreview;
@end




UILongPressGestureRecognizer *gesture1;

%hook SBIconController
- (void)iconHandleLongPress:(id)arg1 {
%orig;

        %orig(NULL);
}
%end

%hook UIScreen
- (long long)_forceTouchCapability {
		return 2;
}
%end

%hook UITraitCollection
- (int)forceTouchCapability {
	return 2;
}
+ (id)traitCollectionWithForceTouchCapability:(int)arg1 {
	return %orig(2);
}
%end

%hook UIDevice
- (BOOL)_supportsForceTouch {
		return TRUE;
}
%end

%hook SBIconView
-(void) layoutSubviews {
%orig;

   gesture1 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(force:)];
    [gesture1 setDelegate:self];
    [gesture1 setMinimumPressDuration:1];
    [self addGestureRecognizer:gesture1];
}
%end

%hook _UITouchForceMessage
- (void)setUnclampedTouchForce:(CGFloat)touchForce {
if(gesture1.state = UIGestureRecognizerStateBegan) {
%orig(200.0f);
}
}
%end