#import "Metanoia.h"
#import "libcolorpicker.h"

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.metanoia.plist"

NSUserDefaults *prefs = [[NSUserDefaults alloc] initWithSuiteName:@"com.antique.metanoia"];
NSInteger updateSize = [[prefs objectForKey:@"updateSize"] intValue];

inline bool GetPrefBool(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline int GetPrefInt(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];
}



@interface SBDashBoardMainPageView : UIView
@end
Metanoia *clockView;
UIView *center;

@interface SBFLockScreenDateView : UIView
@property(nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface SBFLockScreenDateSubtitleView : UIView
@property(nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface SBUILegibilityLabel : UIView
@property(nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end



%hook SBFLockScreenDateSubtitleView
-(void) layoutSubviews {
self.hidden = YES;
}
%end

%hook SBFLockScreenDateView
-(void) layoutSubviews {
      %orig;
[self setHidden:YES];

SBUILegibilityLabel *dateView = MSHookIvar<SBUILegibilityLabel *>(self, "_timeLabel");
[dateView setHidden:YES];
}

- (void)setTextColor:(id)arg1 {
       %orig([UIColor clearColor]);
}
%end

%hook SBDashBoardView
-(void) layoutSubviews {
      %orig;

SBFLockScreenDateView *dateView = MSHookIvar<SBFLockScreenDateView *>(self, "_dateView");
[dateView setHidden:YES];
}
%end


%hook SBDashBoardMainPageView
-(void) layoutSubviews {
      %orig;

if(GetPrefBool(@"Enable")) {
if(!clockView) {
clockView = [[Metanoia alloc] initWithFrame:CGRectMake(100, 82.5, [[UIScreen mainScreen] bounds].size.width - 200, [[UIScreen mainScreen] bounds].size.width - 200)];

[self addSubview:clockView];
[clockView start];
  }
}

if(GetPrefBool(@"Background")) {
    [clockView setBackgroundImage:[UIImage imageWithContentsOfFile:@"/Library/Application Support/Metanoia/clockface@2x.png"].CGImage];
}

if(GetPrefBool(@"Size")) {
if(updateSize == 1) {
clockView.transform = CGAffineTransformMakeScale(0.5, 0.5); 
} else if(updateSize == 2) {
clockView.transform = CGAffineTransformMakeScale(1, 1); 
} else if(updateSize == 3) {
clockView.transform = CGAffineTransformMakeScale(1.5, 1.5); 
}
} return %orig;
}
%end