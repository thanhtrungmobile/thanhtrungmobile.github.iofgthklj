static int battery;

@interface SBUIController
+ (id) sharedInstance;
-(int) batteryCapacityAsPercentage;
@end

@interface SBLowPowerAlertItem
/*
+ (void)setBatteryLevel:(unsigned int)arg1;
+ (_Bool)_shouldIgnoreChangeToBatteryLevel:(unsigned int)arg1;
+ (unsigned int)_thresholdForLevel:(unsigned int)arg1;
- (_Bool)shouldShowInLockScreen;
- (id)initWithLevel:(unsigned int)arg1;
*/
@end