#import "Bits.h"



%hook CCUIBrightnessSectionController

-(void)viewDidLoad {
  %orig;
  MSHookIvar<UIView*>(self,"_slider").tag = 123432;
}

%end

%hook CCUIControlCenterSlider

- (void)layoutSubviews {
	%orig;

	UIImageView * minImg = MSHookIvar<UIImageView*>(self,"_minValueImageView");
	UIImageView * maxImg = MSHookIvar<UIImageView*>(self,"_maxValueImageView");

	if(minImg && maxImg) {
		if(objc_getAssociatedObject(minObj, (__bridge void *) self) == nil) {

			UIButton * minBut = [UIButton buttonWithType:UIButtonTypeRoundedRect];
			minBut.frame = CGRectMake(0,0,50,50);
			minBut.center = CGPointMake(minImg.center.x + self.frame.origin.x - 10, minImg.center.y+ self.frame.origin.y);
			[minBut setTitle:@"" forState:UIControlStateNormal];
			[minBut addTarget:self action:@selector(decrementValue) forControlEvents:UIControlEventTouchUpInside];
			[self.superview insertSubview:minBut aboveSubview:self];

			objc_setAssociatedObject(minObj, (__bridge void *) self, minBut, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
		}
		else {
			UIButton * b = objc_getAssociatedObject(minObj, (__bridge void *) self);
			b.center = CGPointMake(minImg.center.x + self.frame.origin.x -10, minImg.center.y+ self.frame.origin.y);
		}

		if(objc_getAssociatedObject(maxObj, (__bridge void *) self) == nil) {
			UIButton * maxBut = [UIButton buttonWithType:UIButtonTypeRoundedRect];
			maxBut.frame = CGRectMake(0,0,50,50);
			maxBut.center = CGPointMake(maxImg.center.x + self.frame.origin.x + 10, maxImg.center.y+ self.frame.origin.y);
			[maxBut setTitle:@"" forState:UIControlStateNormal];
			[maxBut addTarget:self action:@selector(incrementValue) forControlEvents:UIControlEventTouchUpInside];
			[self.superview insertSubview:maxBut aboveSubview:self];

			objc_setAssociatedObject(maxObj, (__bridge void *) self, maxBut, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
		}
		else {
			UIButton * b = objc_getAssociatedObject(maxObj, (__bridge void *) self);
			b.center = CGPointMake(maxImg.center.x + self.frame.origin.x + 10, maxImg.center.y+ self.frame.origin.y);
		}
	}
}

%new

-(void) incrementValue {
	BOOL isBrightness = self.tag == 123432;
	CGFloat value = self.value + deltaUp;

if(GetPrefBool(@"hapticFeed")) {
    hapticPeekVibe();
}

	if(isBrightness) {
		[[%c(SBBrightnessController) sharedBrightnessController] setBrightnessLevel:value];
		[self setValue:value];
	}
	else {
		[[%c(VolumeControl) sharedVolumeControl] setMediaVolume:value];
	}
}

%new

-(void) decrementValue {
	BOOL isBrightness = self.tag == 123432;
	CGFloat value = self.value - deltaDown;

if(GetPrefBool(@"hapticFeed")) {
    hapticPeekVibe();
}

	if(isBrightness) {
		[[%c(SBBrightnessController) sharedBrightnessController] setBrightnessLevel:value];
		[self setValue:value];
	}
	else {
		[[%c(VolumeControl) sharedVolumeControl] setMediaVolume:value];
	}
}

%end

%ctor {
	updatePrefs();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, PreferencesChangedCallback, CFSTR(PreferencesChangedNotification), NULL, CFNotificationSuspensionBehaviorCoalesce);
}
