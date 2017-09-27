@interface SBUIActionPlatterViewController
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

%hook SBUIActionPlatterViewController
-(void) loadView {
%orig;

UIView *keyLine = MSHookIvar<UIView *>(self,"_keylinesContainerView");
[keyLine setHidden:YES];
}
%end