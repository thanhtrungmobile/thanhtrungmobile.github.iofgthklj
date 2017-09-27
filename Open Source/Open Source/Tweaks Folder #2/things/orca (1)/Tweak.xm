#import "CCAlegroPageViewController.h"


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

UIImageView *userImage = [[UIImageView alloc] initWithFrame:CGRectMake(view.bounds.size.width / 3 + 12, -70, 100, 100)];

UIImage *user = [UIImage imageWithContentsOfFile:@"/var/mobile/Documents/Alegro/user.png"];
userImage.image = user;

userImage.layer.cornerRadius = 14.2;
userImage.layer.masksToBounds = YES;

[view addSubview:userImage];
}
%end