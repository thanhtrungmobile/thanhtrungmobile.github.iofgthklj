@interface SpringBoard
- (id)_accessibilityFrontMostApplication;
@end

@interface SBApplicationController
+ (id)sharedInstance;
@end

@interface SBApplication
@end


%hook SBSlideUpAppGrabberView
-(void) layoutSubviews {
%orig;


Class $SBApplicationController = objc_getClass("SBApplicationController");

SBApplication *prefApp = [[$SBApplicationController sharedInstance] applicationWithDisplayIdentifier:@"com.apple.Preferences"];

SBApplicationIcon *prefAppIcon = [[objc_getClass("SBApplicationIcon") alloc] initWithApplication:mailApp];


UIImage *icon = [[UIImage initWithContentsOfFile:prefAppIcon]];
UIImage *image = MSHookIvar<UIImage *>(self, "_grabberImage");

image = icon;
}
%end