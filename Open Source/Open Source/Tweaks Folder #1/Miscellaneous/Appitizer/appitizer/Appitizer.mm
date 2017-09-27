#import <Preferences/PSListController.h>

@interface AppitizerRootListController : PSListController
@end


@protocol PreferencesTableCustomView
- (id)initWithSpecifier:(id)arg1;

@optional
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1;
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 inTableView:(id)arg2;
@end

#define kTintColor [UIColor colorWithRed:0/255.0f green:178/255.0f blue:128/255.0f alpha:1.0]

@implementation AppitizerRootListController
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Appitizer" target:self] retain];
	}

	return _specifiers;
}

- (void)loadView {
    [super loadView];

    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;
}

-(void) respring {
system("killall -9 backboardd");
}

@end