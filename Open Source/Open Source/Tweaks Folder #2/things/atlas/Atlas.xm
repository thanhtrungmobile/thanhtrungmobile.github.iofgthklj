%hook MPUControlCenterMediaControlsView
-(void) setLayoutStyle:(NSUInteger)arg1 {
%orig;
arg1 = 1;
%orig(arg1);
}
%end

%hook CCUIControlCenterViewController
-(NSInteger) layoutStyle {
%orig;
   if(UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation)) {
         return 1;   
} else if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
         return 1; 
    } return %orig;
}
%end