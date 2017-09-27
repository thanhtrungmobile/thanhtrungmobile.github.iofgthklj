#import "CCAlegroPageViewController.h"

@implementation CCAlegroPageViewController
-(void) dealloc {
      [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleApplicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleApplicationDidBecomeActive:)  name:UIApplicationDidBecomeActiveNotification  object:nil];

    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;

    SKScene * scene = [GameScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    [skView presentScene:scene];
}


-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)controlCenterWillPresent {
}

-(void)controlCenterDidDismiss {
}

-(void)controlCenterWillBeginTransition {
}

-(void)controlCenterDidFinishTransition {
}

-(long long)layoutStyle {
    return 0;
}


-(void)contentViewControllerWantsDismissal:(id)arg1 {
}

-(id)controlCenterSystemAgent {
    return nil;
}

-(void)visibilityPreferenceChangedForContentViewController:(id)arg1 {
}

-(void)beginSuppressingPunchOutMaskCachingForReason:(id)arg1 {
}

-(void)endSuppressingPunchOutMaskCachingForReason:(id)arg1 {
}

-(void)setDelegate:(id)arg1 {
}

-(id)delegate {
    return self;
}

-(BOOL)wantsVisible {
    return YES;
}

@end
