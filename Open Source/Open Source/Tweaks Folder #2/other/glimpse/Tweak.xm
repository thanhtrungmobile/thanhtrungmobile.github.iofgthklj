#import "Pages/Pages.h"

%hook CCUIControlCenterViewController
%property (nonatomic, retain) CCGlimpsePageViewController *glimpseViewController;
-(void) viewDidLoad {
      %orig;

if(!self.glimpseViewController) {
  self.glimpseViewController = [[CCGlimpsePageViewController alloc] init];

  [self _addContentViewController:self.glimpseViewController];

  [self _addOrRemovePagesBasedOnVisibility];
    }
}
%end


%hook CCGlimpsePageViewController
-(void) viewDidLoad {
      %orig;
}
%end