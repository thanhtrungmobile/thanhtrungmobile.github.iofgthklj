#import "Pages.h"
#import "BatteryView.h"
#import "MusicView.h"

@implementation CCGlimpsePageViewController
-(void) viewDidLoad {
    [super viewDidLoad];


UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, -24, self.view.bounds.size.width - 16, self.view.bounds.size.height - self.view.bounds.size.height / 2.55)]; 
   scrollView.pagingEnabled = YES; 
   [scrollView setAlwaysBounceVertical:NO]; 
     
   NSInteger numberOfViews = 2; 
   for (int i = 0; i < numberOfViews; i++) { 

BatteryView *batteryView = [[BatteryView alloc] initWithFrame:scrollView.bounds];

MusicView *musicView = [[MusicView alloc] init];
[musicView.view setFrame:CGRectMake(scrollView.bounds.size.width, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];

      [scrollView addSubview:batteryView]; 
      [scrollView addSubview:musicView.view];
    } 
 
   scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * numberOfViews, scrollView.frame.size.height); 
   [self.view addSubview:scrollView]; 
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
