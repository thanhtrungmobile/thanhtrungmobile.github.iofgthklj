// Start our code by hooking the class we'll use
%hook SBBacklightController

// Set Custom Fading Timer
- (void)resetLockScreenIdleTimerWithDuration:(double)arg1 {

// Set The Timer To Use Our Preferences Value
NSDictionary *time = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.caffeine.plist"]];
%orig([[time objectForKey:@"kTime"] intValue]);
}

// Finish our code
%end