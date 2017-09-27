
@interface CAMIrisButton : UIButton
+(id)irisButton;
@end

@interface CAMTopBar : UIView
-(void)setIrisButton:(id)button;
@end

%hook CAMCaptureCapabilities

- (BOOL)isBackIrisSupported {
	return YES;
}

- (BOOL)isIrisSupportedForDevice:(int)arg1 {
	return YES;
}

- (BOOL)isFrontIrisSupported {
	return YES;
}

%end

%hook PURootSettings

-(BOOL)allowIrisUI {
	return YES;
}
%end

%hook CAMUserPreferences
- (BOOL)isIrisCaptureEnabled {
	return YES;
}
%end

%hook AVCaptureIrisStillImageOutput
- (BOOL)isIrisMovieCaptureSupported {
	return YES;
}
%end

%hook AVCaptureDeviceFormat
-(BOOL) isIrisSupported {
      return YES;
}
%end