#import "Bits.h"

%hook SBDashBoardMainPageView
-(id)initWithFrame:(CGRect)arg1 {
  id instance = %orig();
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUI) name:@"updateUI" object:nil];
  return instance;
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self name:@"updateProfile" object:nil];
    %orig();
}

-(void) layoutSubviews {
%orig;
SBCallToActionLabel *old = MSHookIvar<SBCallToActionLabel *>(self, "_callToActionLabel");
[old setHidden:YES];


if(!lbl1) {
lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 45, [[UIScreen mainScreen] bounds].size.width, 40)];
lbl1.backgroundColor = [UIColor clearColor];
lbl1.textColor = [UIColor whiteColor];
lbl1.font = [UIFont systemFontOfSize:12];
lbl1.textAlignment = NSTextAlignmentCenter;
lbl1.userInteractionEnabled = NO;
[self addSubview:lbl1];
}

if(!lbl2) {
lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 55, [[UIScreen mainScreen] bounds].size.width, 40)];
lbl2.backgroundColor = [UIColor clearColor];
lbl2.textColor = [UIColor whiteColor];
lbl2.font = [UIFont systemFontOfSize:12];
lbl2.textAlignment = NSTextAlignmentCenter;
lbl2.userInteractionEnabled = NO;
lbl2.hidden = YES;
[self addSubview:lbl2];
}

[self updateUI];
}

%new
-(void)updateUI {
[[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
float batteryLevel = [[UIDevice currentDevice] batteryLevel];

battery = [[%c(SBUIController) sharedInstance] batteryCapacityAsPercentage];

NSString *string = [NSString stringWithFormat:@"%.1f%%", batteryLevel * 100];

if ([[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateCharging) {
lbl1.text = [NSString stringWithFormat:@"Charging: %@", string];

} else if ([[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateUnplugged) {
lbl1.text = [NSString stringWithFormat:@"Charge: %@", string];

if(battery <= 5) {
lbl1.textColor = [UIColor redColor];
}
} else if ([[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateFull) {
lbl1.text = @"Fully Charged";
}
}
%end