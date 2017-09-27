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
}
%end