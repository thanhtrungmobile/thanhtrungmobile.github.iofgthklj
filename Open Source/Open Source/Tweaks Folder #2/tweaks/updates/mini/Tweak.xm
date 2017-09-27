#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVAudioPlayer.h>

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.minichargeos.plist"

NSUserDefaults *prefs = [[NSUserDefaults alloc] initWithSuiteName:@"com.antique.minichargeos"];
NSInteger style = [[prefs objectForKey:@"style"] intValue];
NSInteger version = [[prefs objectForKey:@"version"] intValue];
NSInteger back = [[prefs objectForKey:@"back"] intValue];
NSInteger audio = [[prefs objectForKey:@"audio"] intValue];

inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

NSMutableDictionary *settings = [NSMutableDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"%@/Library/Preferences/%@",NSHomeDirectory(),@"com.antique.minichargeos.plist"]];


AVAudioPlayer *chimeAudio;
NSString *appleWatchChime = [[NSBundle bundleWithPath:@"/Library/Application Support/MiniChargeOS/"] pathForResource:@"Chime" ofType:@"caf"];
NSURL *url = [[NSURL alloc] initFileURLWithPath:appleWatchChime];

AVAudioPlayer *customAudio;
NSString *customChime = [[NSBundle bundleWithPath:@"/Library/Application Support/MiniChargeOS/"] pathForResource:@"Custom" ofType:@"caf"];
NSURL *custom = [[NSURL alloc] initFileURLWithPath:customChime];


UIView *window;

@interface SBDashboardChargingView : UIView
@end



%hook _SBLockScreenSingleBatteryChargingView
- (void) layoutSubviews {

NSNumber* shouldNotify = [settings objectForKey:@"Enabled"];
if ([shouldNotify boolValue] == YES) {

window = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
window.userInteractionEnabled = NO;
window.backgroundColor = [UIColor clearColor];
[self addSubview:window];

if(back == 5) {
UIImageView *background = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
background.image = [UIImage imageWithContentsOfFile:@"/var/mobile/Library/SpringBoard/LockBackgroundThumbnail.jpg"];
[window addSubview:background];
} else if(back == 6) {
UIImageView *background = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
background.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/MiniChargeOS.bundle/Background.png"];
[window addSubview:background];
}



		if(style == 1) {
			UIVisualEffect *blurEffect;
blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];

UIVisualEffectView *visualEffectView;
visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

visualEffectView.frame = window.bounds;
[window addSubview:visualEffectView];
		} else if(style == 2) {
    		UIVisualEffect *blurEffect;
blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];

UIVisualEffectView *visualEffectView;
visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

visualEffectView.frame = window.bounds;
[window addSubview:visualEffectView];
}

UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-75,[UIScreen mainScreen].bounds.size.height*0.40-45,150,150)];

if(version == 3) {
image.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/MiniChargeOS.bundle/old.png"];
[window addSubview:image];
}

 if(version == 4) {
image.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/MiniChargeOS.bundle/custom.png"];
[window addSubview:image];
}

[self performSelector:@selector(hide) withObject:nil afterDelay:1.25];
}
%orig;
}

%new
-(void) hide {
window.hidden = YES;
window = nil;
}
%end


%hook SBUIController
- (void)ACPowerChanged {
	if(audio == 7) {
	chimeAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
	chimeAudio.numberOfLoops = 0;
	chimeAudio.volume = 0.75;
	[chimeAudio play];
	} else if(audio == 8) {
     customAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:custom error:nil];
	customAudio.numberOfLoops = 0;
	customAudio.volume = 0.75;
	[customAudio play];
    } 
}
%end