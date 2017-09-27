#import "CCAlegroPageViewController.h"

UIView *newView;
UITextView *textView;

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

UIView *view = MSHookIvar<UIView *>(self, "_view");

UIImageView *userImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
userImage.center = CGPointMake(self.view.bounds.size.width / 1.68, -80);

UIImage *user = [UIImage imageWithContentsOfFile:@"/var/mobile/Documents/Alegro/user.png"];
userImage.image = user;

userImage.layer.cornerRadius = 14.2;
userImage.layer.masksToBounds = YES;


[view addSubview:userImage];



newView = [[UIView alloc] initWithFrame:CGRectMake(0, -24, [[UIScreen mainScreen] bounds].size.width - 16, self.view.bounds.size.height / 3.25)];

newView.backgroundColor = [UIColor clearColor];

[view addSubview:newView];


textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, newView.bounds.size.width, newView.bounds.size.height)];
[textView setDelegate:self];
textView.backgroundColor = [UIColor clearColor];

[textView setFont:[UIFont fontWithName:@"Helvetica-Regular" size:20]];
[textView setScrollEnabled:YES];
[textView setTextColor:[UIColor blackColor]];
[textView setUserInteractionEnabled:YES];

[newView addSubview:textView];
}

%new
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {

    if([text isEqualToString:@"."]) {
        [textView resignFirstResponder];
        return NO;
    }

    return YES;
}
%end