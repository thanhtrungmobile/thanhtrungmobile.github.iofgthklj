%hook SBLockScreenViewController
-(bool)_forcesPortraitOrientation
{
	return NO;
}
-(bool) shouldAutorotateToInterfaceOrientation:(long long)arg1
{
	return NO;
}
%end