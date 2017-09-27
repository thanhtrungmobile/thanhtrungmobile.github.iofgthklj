@interface MPUMediaControlsVolumeView : UIView
@end

UISlider *slider;
UILabel *label2;

%hook MPUMediaControlsVolumeView
-(void) layoutSubviews {
       %orig;
slider = MSHookIvar<UISlider *>(self, "_slider");

if(!label2) {
label2 = [[UILabel alloc] initWithFrame:CGRectMake(-20, 28, [[UIScreen mainScreen] bounds].size.width - 26, 20)];
label2.backgroundColor = [UIColor clearColor];
label2.textAlignment = NSTextAlignmentCenter;
label2.textColor = [UIColor blackColor];
label2.userInteractionEnabled = NO;
label2.text= @"Volume Buttons";
label2.font = [UIFont systemFontOfSize:8.5];
[slider addSubview:label2];
}
}
%end

int vAmount = 0;
%hook SpringBoard
- (BOOL)_volumeChanged:(struct __IOHIDEvent *)arg1 {
if(label2) {
vAmount++;
[label2 setText:[NSString stringWithFormat:@"Volume Button Taps: %d", vAmount / 2]];
} return %orig;
}
%end