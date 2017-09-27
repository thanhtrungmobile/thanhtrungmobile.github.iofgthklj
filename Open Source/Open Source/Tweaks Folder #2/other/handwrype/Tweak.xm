@interface SBRootFolderView : UIView <UIGestureRecognizerDelegate>
@end

UIView *musicView;
UIVisualEffect *blurEffect;
UIVisualEffectView *visualEffectView;

CGPoint lastLocation; 


%hook SBRootFolderView
-(void) layoutSubviews {
      %orig;

if(!musicView) {
musicView = [[UIView alloc] initWithFrame:CGRectMake(30, 30, 85, 85)];

[musicView setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.1]];
[musicView.layer setCornerRadius:13.5];
[musicView setClipsToBounds:YES];
[self addSubview:musicView];
}

if(!blurEffect) {
blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
}

if(!visualEffectView) {
visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

visualEffectView.frame = musicView.bounds;
[visualEffectView setAlpha:0.8];
[musicView addSubview:visualEffectView];
    }


    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
    [panRecognizer setMinimumNumberOfTouches:1];
    [panRecognizer setMaximumNumberOfTouches:1];
    [musicView addGestureRecognizer:panRecognizer];
    [panRecognizer release];
}

%new
-(void) move:(UIPanGestureRecognizer *)recognizer {
    
    CGPoint translation = [recognizer translationInView:self];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, 
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self];           
}
%end