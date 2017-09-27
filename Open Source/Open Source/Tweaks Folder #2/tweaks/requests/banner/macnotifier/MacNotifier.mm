#import <Preferences/PSSpecifier.h>
#import <Preferences/PSListController.h>
#import <Twitter/TWTweetComposeViewController.h>





@interface MacNotifierListController: PSListController {
}
@end


#define kTintColor [UIColor colorWithRed:102.0/256.0 green:194.0/256.0 blue:255.0/256.0 alpha:1.0]

@protocol PreferencesTableCustomView
- (id)initWithSpecifier:(id)arg1;

@optional
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1;
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 inTableView:(id)arg2;
@end

@interface ChameleonCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *label;
    UILabel *underLabel;
    UILabel *trevLabel;
}
@end





@implementation ChameleonCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
	#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	CGRect labelFrame = CGRectMake(0, -15, kWidth, 60);
	CGRect underLabelFrame = CGRectMake(0, 16, kWidth, 60);
	CGRect trevLabelFrame = CGRectMake(0, 35, kWidth, 60);
       
	
	label = [[UILabel alloc] initWithFrame:labelFrame];
	[label setNumberOfLines:1];
	label.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
	[label setText:@"MacNotifier"];
	[label setBackgroundColor:[UIColor clearColor]];
	label.textColor = [UIColor blackColor];
	label.textAlignment = NSTextAlignmentCenter;
	
	underLabel = [[UILabel alloc] initWithFrame:underLabelFrame];
	[underLabel setNumberOfLines:1];
	underLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
	[underLabel setText:@"by Antique_Dev"];
	[underLabel setBackgroundColor:[UIColor clearColor]];
	underLabel.textColor = [UIColor blackColor];
	underLabel.textAlignment = NSTextAlignmentCenter;

  trevLabel = [[UILabel alloc] initWithFrame:trevLabelFrame];
	[trevLabel setNumberOfLines:1];
	trevLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
	[trevLabel setText:@"Requested by u/mrnathanrd (Reddit)"];
	[trevLabel setBackgroundColor:[UIColor clearColor]];
	trevLabel.textColor = [UIColor grayColor];
	trevLabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:label];
	[self addSubview:underLabel];
	[self addSubview:trevLabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 75.0;
    return prefHeight;
}
@end





@implementation MacNotifierListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"MacNotifier" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}
- (void)save
{
    [self.view endEditing:YES];
}

- (void)loadView {
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;
}

@end

// vim:ft=objc
