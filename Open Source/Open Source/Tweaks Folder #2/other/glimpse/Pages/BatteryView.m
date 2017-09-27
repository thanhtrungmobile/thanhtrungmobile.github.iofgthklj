#import "BatteryView.h"
#import "Battery/BatteryOutlineLayer.h"
#import "Battery/BatteryCharginSignLayer.h"
#import "Battery/BatteryChargeView.h"


@implementation BatteryView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
      self.backgroundColor = [UIColor clearColor];
      self.layer.cornerRadius = 13.5;


BatteryChargeView *battery = [[BatteryChargeView alloc] initWithFrame:CGRectMake(0, 0, 280, 93)];
battery.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
battery.backgroundColor = [UIColor clearColor];
[self addSubview:battery];



[[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
UIDevice *device = [UIDevice currentDevice];

[device setBatteryMonitoringEnabled:YES];
int batLeft = (float)[device batteryLevel] * 100;
[battery setBatteryLevel:batLeft];
  } return self;
}
@end