%hook SBBacklightController
- (void)resetLockScreenIdleTimerWithDuration:(double)arg1 {
NSDictionary *time = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.caffeine.plist"]];
%orig([[time objectForKey:@"kTime"] intValue]);
}
%end