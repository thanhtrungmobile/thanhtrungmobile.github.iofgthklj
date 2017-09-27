#import <MediaPlayer/MediaPlayer.h>
#import "Whatchamecallits.h"


%hook SBDashBoardBackgroundView
- (void) layoutSubviews {
%orig;
window = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
window.userInteractionEnabled = NO;
window.backgroundColor = [UIColor clearColor];
[self addSubview:window];

if(GetPrefBool(@"kBlur")) {
if(blurstyle == 1) {
    		UIVisualEffect *blurEffect;
blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];

visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

visualEffectView.frame = window.bounds;
[window addSubview:visualEffectView];
}

if(blurstyle == 2) {
UIVisualEffect *blurEffect;
blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];

visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

visualEffectView.frame = window.bounds;
[window addSubview:visualEffectView];
}
}
}
%end

%hook SBFLockScreenDateSubtitleView
-(void) layoutSubviews {
self.hidden = YES;
}
%end

%hook SBDashBoardMainPageView
-(id)initWithFrame:(CGRect)arg1 {
  id instance = %orig();
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUI) name:@"updateUI" object:nil];
  return instance;
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self name:@"updateProfile" object:nil];
    %orig();
}

-(void) layoutSubviews {
%orig;
// float height = self.bounds.size.height;
int height = (GetPrefInt(@"dotsHeight"));


if ([[MPMusicPlayerController systemMusicPlayer] playbackState] == MPMusicPlaybackStatePlaying) {
base.hidden = YES;
} else {
base.hidden = NO;
}

 if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
    CGSize screenHeight = [[UIScreen mainScreen] bounds].size;


    if(screenHeight.height == 736) {
// iPhone 6 Plus/6s Plus
if(!base) {
base = [[UIView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/2 - 168, height, 315, 20)];
base.userInteractionEnabled = NO;
base.backgroundColor = [UIColor clearColor];

[self addSubview:base];
}


if(!ten) {
ten = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
ten.userInteractionEnabled = NO;

ten.layer.borderWidth = 2;
ten.layer.cornerRadius = 10;
ten.layer.borderColor = [UIColor clearColor].CGColor;

[base addSubview:ten];
}

if(!twenty) {
twenty = [[UIView alloc] initWithFrame:CGRectMake(35, 0, 20, 20)];
twenty.userInteractionEnabled = NO;

twenty.layer.borderWidth = 2;
twenty.layer.cornerRadius = 10;
twenty.layer.borderColor = [UIColor clearColor].CGColor;

[base addSubview:twenty];
}

if(!thirty) {
thirty = [[UIView alloc] initWithFrame:CGRectMake(70, 0, 20, 20)];
thirty.userInteractionEnabled = NO;

thirty.layer.borderWidth = 2;
thirty.layer.cornerRadius = 10;
thirty.layer.borderColor = [UIColor clearColor].CGColor;

[base addSubview:thirty];
}

if(!forty) {
forty = [[UIView alloc] initWithFrame:CGRectMake(105, 0, 20, 20)];
forty.userInteractionEnabled = NO;

forty.layer.borderWidth = 2;
forty.layer.cornerRadius = 10;
forty.layer.borderColor = [UIColor clearColor].CGColor;

[base addSubview:forty];
}

if(!fifty) {
fifty = [[UIView alloc] initWithFrame:CGRectMake(140, 0, 20, 20)];
fifty.userInteractionEnabled = NO;

fifty.layer.borderWidth = 2;
fifty.layer.cornerRadius = 10;
fifty.layer.borderColor = [UIColor clearColor].CGColor;

[base addSubview:fifty];
}

if(!sixty) {
sixty = [[UIView alloc] initWithFrame:CGRectMake(175, 0, 20, 20)];
sixty.userInteractionEnabled = NO;

sixty.layer.borderWidth = 2;
sixty.layer.cornerRadius = 10;
sixty.layer.borderColor = [UIColor clearColor].CGColor;

[base addSubview:sixty];
}

if(!seventy) {
seventy = [[UIView alloc] initWithFrame:CGRectMake(210, 0, 20, 20)];
seventy.userInteractionEnabled = NO;

seventy.layer.borderWidth = 2;
seventy.layer.cornerRadius = 10;
seventy.layer.borderColor = [UIColor clearColor].CGColor;

[base addSubview:seventy];
}

if(!eighty) {
eighty = [[UIView alloc] initWithFrame:CGRectMake(245, 0, 20, 20)];
eighty.userInteractionEnabled = NO;

eighty.layer.borderWidth = 2;
eighty.layer.cornerRadius = 10;
eighty.layer.borderColor = [UIColor clearColor].CGColor;

[base addSubview:eighty];
}

if(!ninety) {
ninety = [[UIView alloc] initWithFrame:CGRectMake(280, 0, 20, 20)];
ninety.userInteractionEnabled = NO;

ninety.layer.borderWidth = 2;
ninety.layer.cornerRadius = 10;
ninety.layer.borderColor = [UIColor clearColor].CGColor;

[base addSubview:ninety];
}

if(!hundred) {
hundred = [[UIView alloc] initWithFrame:CGRectMake(315, 0, 20, 20)];
hundred.userInteractionEnabled = NO;

hundred.layer.borderWidth = 2;
hundred.layer.cornerRadius = 10;
hundred.layer.borderColor = [UIColor clearColor].CGColor;

[base addSubview:hundred];
}
} else if(screenHeight.height == 667) {
// iPhone 6/6s
base.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.5, 1.5);
} else if(screenHeight.height == 568) {
// iPhone 5s
base.transform = CGAffineTransformScale(CGAffineTransformIdentity, 2, 2);
}
}

[self updateUI];


if(GetPrefBool(@"kBorder")) {
if(dotborder == 3) {
ten.layer.borderColor = [UIColor whiteColor].CGColor;
twenty.layer.borderColor = [UIColor whiteColor].CGColor;
thirty.layer.borderColor = [UIColor whiteColor].CGColor;
forty.layer.borderColor = [UIColor whiteColor].CGColor;
fifty.layer.borderColor = [UIColor whiteColor].CGColor;
sixty.layer.borderColor = [UIColor whiteColor].CGColor;
seventy.layer.borderColor = [UIColor whiteColor].CGColor;
eighty.layer.borderColor = [UIColor whiteColor].CGColor;
ninety.layer.borderColor = [UIColor whiteColor].CGColor;
hundred.layer.borderColor = [UIColor whiteColor].CGColor;
}
if(dotborder == 4) {
ten.layer.borderColor = [UIColor blackColor].CGColor;
twenty.layer.borderColor = [UIColor blackColor].CGColor;
thirty.layer.borderColor = [UIColor blackColor].CGColor;
forty.layer.borderColor = [UIColor blackColor].CGColor;
fifty.layer.borderColor = [UIColor blackColor].CGColor;
sixty.layer.borderColor = [UIColor blackColor].CGColor;
seventy.layer.borderColor = [UIColor blackColor].CGColor;
eighty.layer.borderColor = [UIColor blackColor].CGColor;
ninety.layer.borderColor = [UIColor blackColor].CGColor;
hundred.layer.borderColor = [UIColor blackColor].CGColor;
}
} 
}


%new
-(void)updateUI
{
battery = [[%c(SBUIController) sharedInstance] batteryCapacityAsPercentage];
NSLog(@"[Surge] NSLog update ui %i", battery);

ten.backgroundColor = [UIColor clearColor];
twenty.backgroundColor = [UIColor clearColor];
thirty.backgroundColor = [UIColor clearColor];
forty.backgroundColor = [UIColor clearColor];
fifty.backgroundColor = [UIColor clearColor];
sixty.backgroundColor = [UIColor clearColor];
seventy.backgroundColor = [UIColor clearColor];
eighty.backgroundColor = [UIColor clearColor];
ninety.backgroundColor = [UIColor clearColor];
hundred.backgroundColor = [UIColor clearColor];

if(GetPrefBool(@"kDot")) {
if(dotstyle == 5) {
if(battery >= 10) {
ten.backgroundColor = [UIColor greenColor];
    }
if(battery <= 10) {
ten.backgroundColor = [UIColor greenColor];
    }
if(battery >= 20) {
twenty.backgroundColor = [UIColor greenColor];
    }
if(battery >= 30) {
thirty.backgroundColor = [UIColor greenColor];
    }
if(battery >= 40) {
forty.backgroundColor = [UIColor greenColor];
    }
if(battery >= 50) {
fifty.backgroundColor = [UIColor greenColor];
    }
if(battery >= 60) {
sixty.backgroundColor = [UIColor greenColor];
    }
if(battery >= 70) {
seventy.backgroundColor = [UIColor greenColor];
    }
if(battery >= 80) {
eighty.backgroundColor = [UIColor greenColor];
    }
if(battery >= 90) {
ninety.backgroundColor = [UIColor greenColor];
    }
if(battery >= 100) {
hundred.backgroundColor = [UIColor greenColor];
    }
}

if(dotstyle == 6) {
if(battery >= 10) {
ten.backgroundColor = [UIColor redColor];
    }
if(battery <= 10) {
ten.backgroundColor = [UIColor redColor];
    }
if(battery >= 20) {
twenty.backgroundColor = [UIColor orangeColor];
    }
if(battery >= 30) {
thirty.backgroundColor = [UIColor orangeColor];
    }
if(battery >= 40) {
forty.backgroundColor = [UIColor orangeColor];
    }
if(battery >= 50) {
fifty.backgroundColor = [UIColor orangeColor];
    }
if(battery >= 60) {
sixty.backgroundColor = [UIColor orangeColor];
    }
if(battery >= 70) {
seventy.backgroundColor = [UIColor orangeColor];
    }
if(battery >= 80) {
eighty.backgroundColor = [UIColor orangeColor];
    }
if(battery >= 90) {
ninety.backgroundColor = [UIColor greenColor];
    }
if(battery >= 100) {
hundred.backgroundColor = [UIColor greenColor];
    }
   }
  }
}
%end


%hook UIDevice
- (void)_setBatteryLevel:(float)arg1 {
%orig;

[[NSNotificationCenter defaultCenter]postNotificationName:@"updateUI" object:nil userInfo:nil];

}
%end