#import <AVFoundation/AVFoundation.h>

@interface SBSlideUpAppGrabberView : UIView
@end
UIButton *button;

@interface SBDashBoardMainPageView : UIView
@end


%hook SBSlideUpAppGrabberView
-(void) layoutSubviews {
      %orig;

  UIImageView *dot = [[UIImageView alloc] initWithFrame:self.bounds];
  dot.image = [UIImage imageWithContentsOfFile:@"/var/mobile/Downloads/flashlight.png"];
  [self addSubview:dot];


button = [UIButton buttonWithType:UIButtonTypeCustom];
[button addTarget:self 
           action:@selector(flash:)
 forControlEvents:UIControlEventTouchUpInside];
[button setTitle:@"O" forState:UIControlStateNormal];
[button setFrame:self.bounds];
[dot addSubview:button];
}

- (CGSize)sizeThatFits:(CGSize)arg1 {
          return CGSizeMake(29, 29);
}

-(BOOL)_shouldUseVibrancy {
          return FALSE;
}


%new
- (void) flash:(UIButton *)sender {
AVCaptureDevice *flashLight = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
if ([flashLight isTorchAvailable] && [flashLight isTorchModeSupported:AVCaptureTorchModeOn])
{
BOOL success = [flashLight lockForConfiguration:nil];
if (success)
{
if ([flashLight isTorchActive])
{
[button setTitle:@"I" forState:UIControlStateNormal];
[flashLight setTorchMode:AVCaptureTorchModeOff];
}
else
{
[button setTitle:@"O" forState:UIControlStateNormal];
[flashLight setTorchMode:AVCaptureTorchModeOn];
}
[flashLight unlockForConfiguration];
}
}
}
%end