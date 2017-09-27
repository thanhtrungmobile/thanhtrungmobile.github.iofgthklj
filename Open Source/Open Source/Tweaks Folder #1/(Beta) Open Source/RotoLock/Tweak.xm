// Start our code by hooking the class we'll use
%hook SBLockScreenViewController

// Disable Portrait Orientation
-(BOOL)_forcesPortraitOrientation {
	return NO;
}

// Disable Autorotation
-(BOOL) shouldAutorotateToInterfaceOrientation:(long long)arg1 {
	return NO;
}

// Finish our code
%end


