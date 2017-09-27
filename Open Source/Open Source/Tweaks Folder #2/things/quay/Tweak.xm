#import "Bits.h"


%hook SBDockView
-(void) layoutSubviews {
%orig;


SBWallpaperEffectView *back = MSHookIvar<SBWallpaperEffectView *>(self, "_backgroundView");

UIImageView *backImage = MSHookIvar<UIImageView *>(self, "_backgroundImageView");

if(GetPrefBool(@"Enable")) {
[back setHidden:YES];
[backImage setHidden:YES];
}
}
%end

%hook SBRootFolderView
-(void) layoutSubviews {
%orig;
                            int height = GetPrefInt(@"dHeight");

SBDockView *dock = MSHookIvar<SBDockView *>(self, "_dockView");

if(GetPrefBool(@"Enable")) {
dock.center = CGPointMake(dock.center.x, dock.center.y - height);
}
}
%end

%hook SBIconListPageControl
-(void) layoutSubviews {
%orig;


if(GetPrefBool(@"Fix")) {
self.hidden = YES;
}
}
%end