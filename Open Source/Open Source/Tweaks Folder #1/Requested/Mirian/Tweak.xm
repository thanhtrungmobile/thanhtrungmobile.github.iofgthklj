#import <MediaPlayer/MediaPlayer.h>

@interface SBDeckSwitcherViewController : UIViewController
@end

@interface SBOrientationTransformWrapperView : UIView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface SBBrightnessController : NSObject
+ (id)sharedBrightnessController;
- (void)setBrightnessLevel:(float)arg1;
@end



/*

@interface CCUIControlCenterContainerView : UIView
@end

@interface CCUIButtonStackPagingView : CCUIControlCenterContainerView
@end

@interface CCUIControlCenterButton : CCUIButtonStackPagingView
- (void)setGlyphImage:(id)arg1;
+ (id)smallCircularButtonWithSelectedColor:(id)arg1;
@end

@interface CCUIControlCenterPushButton : CCUIControlCenterButton
-(void)setIdentifier:(NSString *)arg1 ;
-(void)setSortKey:(NSNumber *)arg1 ;

@end

*/


// Volume
UIView *volumeHolder;
MPVolumeView *volumeSlide;

// Brightness
UIView *brightnessHolder;

// Toggles
UIView *toggleView;
UIButton *button1;
UIButton *button2;
UIButton *button3;
UIButton *button4;
UIButton *button5;



%hook SBDeckSwitcherViewController
-(void) viewDidLoad {
      %orig;



/*
CCUIControlCenterContainerView *controlc = (CCUIControlCenterContainerView *)[[NSClassFromString(@"CCUIControlCenterContainerView") alloc] init];
controlc.frame = CGRectMake(0, 0, 414, 50);

[self.view addSubview:controlc];


CCUIButtonStackPagingView *controlt = (CCUIButtonStackPagingView *)[[NSClassFromString(@"CCUIButtonStackPagingView") alloc] init];
[controlt setFrame:controlc.bounds];

[controlc addSubview:controlt];
*/


/* -- Volume -- */
volumeHolder = [[UIView alloc] initWithFrame: CGRectMake(15, [[UIScreen mainScreen] bounds].size.height - 30, [[UIScreen mainScreen] bounds].size.width - 30, 30)];
    [volumeHolder setBackgroundColor: [UIColor clearColor]];
    [self.view addSubview:volumeHolder];

volumeSlide = [[MPVolumeView alloc] initWithFrame: volumeHolder.bounds];

    [volumeHolder addSubview:volumeSlide];
/* -- Volume End -- */




/* -- Brightness -- */
brightnessHolder = [[UIView alloc] initWithFrame: CGRectMake(15, [[UIScreen mainScreen] bounds].size.height - 68, [[UIScreen mainScreen] bounds].size.width - 30, 30)];
    [brightnessHolder setBackgroundColor: [UIColor clearColor]];
    [self.view addSubview:brightnessHolder];


    UISlider *slider = [[UISlider alloc] initWithFrame:brightnessHolder.bounds];
    [slider addTarget:self action:@selector(brightnessChanged:) forControlEvents:UIControlEventValueChanged];
    [slider setBackgroundColor:[UIColor clearColor]];
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.continuous = YES;
    slider.value = 0.0;
    [brightnessHolder addSubview:slider];
/* -- Brightness End -- */
}

%new
-(void) brightnessChanged:(UISlider *)sender { 
[[%c(SBBrightnessController) sharedBrightnessController] setBrightnessLevel:sender.value];
}

%new
-(void)airplane:(UIButton *)sender {
toggleView.hidden = YES;
}

%new
-(void)wifi:(UIButton *)sender {
toggleView.hidden = YES;
}

%new
-(void)bluetooth:(UIButton *)sender {
toggleView.hidden = YES;
}
%end