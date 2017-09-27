#import <Flipswitch/Flipswitch.h>

%hook CCUIAirplaneModeSetting
- (id)selectedStateColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );
CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;

return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
%end

%hook CCUIWiFiSetting
- (id)selectedStateColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );
CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;

return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
%end

%hook CCUIBluetoothSetting
- (id)selectedStateColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );
CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;

return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
%end

%hook CCUIDoNotDisturbSetting
- (id)selectedStateColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );
CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;

return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
%end

%hook CCUIOrientationLockSetting
- (id)selectedStateColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );
CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;

return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
%end

%hook SBDockView 
-(void) setBackgroundAlpha:(double)arg1 {
arg1 = 0;
%orig(arg1);
}
%end