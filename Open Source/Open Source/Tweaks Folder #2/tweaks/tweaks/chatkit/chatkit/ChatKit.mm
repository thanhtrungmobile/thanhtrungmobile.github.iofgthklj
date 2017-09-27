#import <Preferences/PSSpecifier.h>
#import <Preferences/PSListController.h>
#import <Twitter/TWTweetComposeViewController.h>





@interface ChatKitListController: PSListController {
}
@end

@interface CreditsListController: PSListController {
}
@end


#define kTintColor [UIColor colorWithRed:179.0/256.0 green:255.0/256.0 blue:179.0/256.0 alpha:1.0]

@protocol PreferencesTableCustomView
- (id)initWithSpecifier:(id)arg1;

@optional
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1;
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 inTableView:(id)arg2;
@end

@interface ChatKitCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *label;
    UILabel *underLabel;
    UILabel *trevLabel;
}
@end

@interface CreditsCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *label2;
    UILabel *underLabel2;
}
@end




@implementation ChatKitCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
	#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	CGRect labelFrame = CGRectMake(0, -15, kWidth, 60);
	CGRect underLabelFrame = CGRectMake(0, 14, kWidth, 60);
	CGRect trevLabelFrame = CGRectMake(0, 30, kWidth, 60);
       
	
	label = [[UILabel alloc] initWithFrame:labelFrame];
	[label setNumberOfLines:1];
	label.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
	[label setText:@"ChatKit"];
	[label setBackgroundColor:[UIColor clearColor]];
	label.textColor = [UIColor blackColor];
	label.textAlignment = NSTextAlignmentCenter;
	
	underLabel = [[UILabel alloc] initWithFrame:underLabelFrame];
	[underLabel setNumberOfLines:1];
	underLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
	[underLabel setText:@"by Antique_Dev and sk8r"];
	[underLabel setBackgroundColor:[UIColor clearColor]];
	underLabel.textColor = [UIColor blackColor];
	underLabel.textAlignment = NSTextAlignmentCenter;

  trevLabel = [[UILabel alloc] initWithFrame:trevLabelFrame];
	[trevLabel setNumberOfLines:1];
	trevLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
	[trevLabel setText:@"With the use of ChatKit.framework"];
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

@implementation CreditsCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect label2Frame = CGRectMake(0, -15, kWidth, 60);
CGRect underLabel2Frame = CGRectMake(0, 20, kWidth, 60);
       
	
	label2 = [[UILabel alloc] initWithFrame:label2Frame];
	[label2 setNumberOfLines:1];
	label2.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
	[label2 setText:@"Credits"];
	[label2 setBackgroundColor:[UIColor clearColor]];
	label2.textColor = [UIColor blackColor];
	label2.textAlignment = NSTextAlignmentCenter;

underLabel2 = [[UILabel alloc] initWithFrame:underLabel2Frame];
	[underLabel2 setNumberOfLines:1];
	underLabel2.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
	[underLabel2 setText:@"Thank you to the devs who helped"];
	[underLabel2 setBackgroundColor:[UIColor clearColor]];
	underLabel2.textColor = [UIColor blackColor];
	underLabel2.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:label2];
      [self addSubview:underLabel2];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 90.0;
    return prefHeight;
}
@end




@implementation ChatKitListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"ChatKit" target:self] retain];
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

@implementation CreditsListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Credits" target:self] retain];
	}
	return _specifiers;
}
@end


// vim:ft=objc
