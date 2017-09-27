UIView *view;

@interface SBDashBoardPageControl
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface SBDashBoardView : UIView
-(void) updateUI;
-(void) update:(NSNotification*)notification;
@end

@interface SBDashBoardMainPageView : UIView
-(void) updateUI;
-(void) update:(NSNotification*)notification;
@end