#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>


@interface SBFStaticWallpaperView : UIView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end




%hook SBDockView
-(void) layoutSubviews {
}
%end

%hook SBFWallpaperView

%end

%hook SBFStaticWallpaperView
-(void) layoutSubviews {
%orig;


UIView *cameraView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
[self addSubview:cameraView];



AVCaptureSession *captureSession = [[AVCaptureSession alloc] init];

AVCaptureDevice * videoDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
if(videoDevice == nil)
    assert(0);

NSError *error;
AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:videoDevice error:&error];
if(error)
    assert(0);

[captureSession addInput:input];

AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:captureSession];
previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;

[previewLayer setFrame:CGRectMake(0, 0,
                                   cameraView.frame.size.width,
                                   cameraView.frame.size.height)];


[cameraView.layer addSublayer:previewLayer];
[captureSession startRunning];
}
%end