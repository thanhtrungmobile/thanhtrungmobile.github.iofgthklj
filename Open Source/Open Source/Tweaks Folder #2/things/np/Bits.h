UILabel *lbl1;
UILabel *lbl2;
NSTimer *timer;

static int battery;

@interface SBCallToActionLabel : UILabel
@end

@interface SBDashBoardMainPageView : UIView
-(void) updateUI;
-(void) update:(NSNotification*)notification;
@end

@interface SBUIController
-(id) sharedInstance;
-(int) batteryCapacityAsPercentage;
@end