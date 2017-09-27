#import "headers.h"
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
