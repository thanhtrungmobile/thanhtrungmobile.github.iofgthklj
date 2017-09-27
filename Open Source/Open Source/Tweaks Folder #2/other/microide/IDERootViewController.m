#import "IDERootViewController.h"

@implementation IDERootViewController

- (void)viewDidLoad {
	[super viewDidLoad];
// [self.navigationController setNavigationBarHidden:NO animated:NO];
self.title = @"";
[self.view setBackgroundColor:[UIColor whiteColor]];


_mainImage = [[UIImageView alloc] initWithFrame:CGRectMake(130, 90, self.view.frame.size.width - 260, self.view.frame.size.width - 260)];
_mainImage.layer.cornerRadius = 13.5;
_mainImage.clipsToBounds = YES;

_mainImage.image = [UIImage imageNamed:@"iphoneos.png"];
[self.view addSubview:_mainImage];


_mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, self.view.frame.size.width - 170, self.view.frame.size.width - 240, 22)];
_mainLabel.text = @"microIDE";
_mainLabel.textAlignment = NSTextAlignmentCenter;
[self.view addSubview:_mainLabel];

_secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, self.view.frame.size.width - 155, self.view.frame.size.width - 240, 22)];
_secondLabel.text = @"Xcode inspired. Built for iOS.";
[_secondLabel setFont:[UIFont systemFontOfSize:10]];
_secondLabel.textAlignment = NSTextAlignmentCenter;
[self.view addSubview:_secondLabel];
}
@end
