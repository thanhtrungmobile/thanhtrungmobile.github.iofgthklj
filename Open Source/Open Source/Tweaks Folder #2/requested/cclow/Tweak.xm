%hook CCUILowPowerModeSetting

+ (bool)isInternalButton
{
	return NO;
}

+ (bool)isSupported:(int)arg1
{
	return YES;
}


+ (NSString *)statusOffString
{
	return @"Low Power Mode: Off";
}


+ (NSString *)statusOnString
{
	return @"Low Power Mode: On";
}


- (UIImage *)glyphImageForState:(UIControlState)state
{
	return [UIImage imageNamed:@"LessBright@2x.png" inBundle:[NSBundle bundleWithPath:@"/Applications/Bridge.app/"]];
}
%end