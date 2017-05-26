/*
Developed by @Antique_Dev © 2017. All Rights Reserved.
*/



#import "Bits.h"

SBDashBoardPageControl *pages;
%hook SBDashBoardView
-(void) layoutSubviews {
     %orig;

// pages = MSHookIvar<SBDashBoardPageControl *>(self, "_pageControl");
}
%end

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

/* NSTimer to keep our view updated */
[NSTimer scheduledTimerWithTimeInterval:2.0
    target:self
    selector:@selector(disconnect:)
    userInfo:nil
    repeats:YES];

/* (!) is used to stop the view from recreating itself */
/* Add our pulse view, making sure it's hidden */
if(!view) {
view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
view.center = CGPointMake([[UIScreen mainScreen] bounds].size.width / 2, [[UIScreen mainScreen] bounds].size.height);
view.backgroundColor = [UIColor clearColor];
view.layer.cornerRadius = 10;
view.layer.borderWidth = 1.3;
view.layer.borderColor = [UIColor whiteColor].CGColor;

[view setHidden:YES];
[self addSubview:view];

/* Creating our nice pulsing animation */
/* REQUIRES QuartzCore */
CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulseAnimation.duration = 1.5;
    pulseAnimation.toValue = [NSNumber numberWithFloat:3.8];
    pulseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulseAnimation.autoreverses = YES;
    pulseAnimation.repeatCount = FLT_MAX;
   
    [view.layer addAnimation:pulseAnimation forKey:nil];


/* Our animation gets some pizazz, fade in/out */
/* Timing is everything here 🔽 */
    [view setAlpha:1.0f];

    [UIView animateKeyframesWithDuration:1.5f delay:0.95f options:UIViewAnimationOptionAutoreverse | UIViewAnimationCurveEaseOut | UIViewAnimationOptionRepeat animations:^{
    view.alpha = 0.0f;
} completion:^(BOOL finished) {
     }];
  }
}

/* %new to stop crashes */
/* Our timer is called, checking battery status */
/* Charging - Visible */
/* Unplugged - Hidden */
%new
-(void) disconnect:(NSTimer *)timer {
[[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];

if ([[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateCharging) {
view.hidden = NO;
[view setHidden:NO];
} else if ([[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateUnplugged) {
view.hidden = YES;
[view setHidden:YES];
timer = nil;
  }
}
%end