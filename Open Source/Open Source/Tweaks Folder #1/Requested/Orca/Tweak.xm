#import "CCAlegroPageViewController.h"

UIView *newView;
UITextView *textView;
UILabel *label;
UILabel *label2;
UILabel *label3;

int pAmount = 0;
int vAmount = 0;
int hAmount = 0;

%hook CCUIControlCenterViewController
%property (nonatomic, retain) CCAlegroPageViewController *alegroViewController;
-(void) viewDidLoad {
  %orig;


  if(!self.alegroViewController) {
  self.alegroViewController = [[CCAlegroPageViewController alloc] init];


  [self _addContentViewController:self.alegroViewController];
  [self _addOrRemovePagesBasedOnVisibility];
  }
}
%end

%hook CCAlegroPageViewController
-(void) viewDidLoad {
%orig;

label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, [[UIScreen mainScreen] bounds].size.width - 36, 50)];
label.backgroundColor = [UIColor clearColor];
label.textAlignment = NSTextAlignmentCenter;
label.textColor = [UIColor blackColor];
label.userInteractionEnabled = NO;
label.text= @"Power Button";
[self.view addSubview:label];

label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, [[UIScreen mainScreen] bounds].size.width - 36, 50)];
label2.backgroundColor = [UIColor clearColor];
label2.textAlignment = NSTextAlignmentCenter;
label2.textColor = [UIColor blackColor];
label2.userInteractionEnabled = NO;
label2.text= @"Volume Buttons";
[self.view addSubview:label2];

label3 = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, [[UIScreen mainScreen] bounds].size.width - 36, 50)];
label3.backgroundColor = [UIColor clearColor];
label3.textAlignment = NSTextAlignmentCenter;
label3.textColor = [UIColor blackColor];
label3.userInteractionEnabled = NO;
label3.text= @"Home Button";
[self.view addSubview:label3];
}
%end

%hook SpringBoard
- (BOOL)_volumeChanged:(struct __IOHIDEvent *)arg1 {
if(GetPrefBool(@"Volume")) {
vAmount++;
[label2 setText:[NSString stringWithFormat:@"Volume Buttons: %d", vAmount / 2]];
} return %orig;
}

- (BOOL)_menuButtonDown:(struct __IOHIDEvent *)arg1 {
if(GetPrefBool(@"Home")) {
hAmount++;
[label3 setText:[NSString stringWithFormat:@"Home Button: %d", hAmount]];
} return %orig;
}

-(void)_simulateLockButtonPress {
if(GetPrefBool(@"Power")) {
pAmount++;
[label setText:[NSString stringWithFormat:@"Power Button: %d", pAmount]];
} return %orig;
}
%end