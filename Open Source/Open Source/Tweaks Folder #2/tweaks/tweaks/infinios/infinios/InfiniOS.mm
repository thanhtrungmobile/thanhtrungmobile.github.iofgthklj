#import <Preferences/PSSpecifier.h>
#import <Preferences/PSListController.h>





@interface InfiniOSListController: PSListController {
}

@end

@interface MessagesListController: PSListController {
}
@end

@interface WeatherListController: PSListController {
}
@end

@interface ControlCenterListController: PSListController {
}
@end

@interface NotificationCenterListController: PSListController {
}
@end

@interface LockScreenListController: PSListController {
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

@interface InfiniOSCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *label;
    UILabel *underLabel;
    UILabel *trevLabel;
}
@end

@interface MessagesCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *mlabel;
}
@end

@interface ControlCenterCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *cclabel;
}
@end

@interface WeatherCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *wlabel;
}
@end

@interface NotificationCenterCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *nclabel;
}
@end

@interface LockScreenCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *lslabel;
}
@end

@interface CreditsCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *label2;
    UILabel *underLabel2;
}
@end




@implementation InfiniOSCustomCell

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
	[label setText:@"InfiniOS"];
	[label setBackgroundColor:[UIColor clearColor]];
	label.textColor = [UIColor blackColor];
	label.textAlignment = NSTextAlignmentCenter;
	
	underLabel = [[UILabel alloc] initWithFrame:underLabelFrame];
	[underLabel setNumberOfLines:1];
	underLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
	[underLabel setText:@"by iOS users for iOS users"];
	[underLabel setBackgroundColor:[UIColor clearColor]];
	underLabel.textColor = [UIColor blackColor];
	underLabel.textAlignment = NSTextAlignmentCenter;

  trevLabel = [[UILabel alloc] initWithFrame:trevLabelFrame];
	[trevLabel setNumberOfLines:1];
	trevLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
	[trevLabel setText:@"Customisable iOS"];
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

@implementation MessagesCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect mlabelFrame = CGRectMake(0, -15, kWidth, 60);
       
	
	mlabel = [[UILabel alloc] initWithFrame:mlabelFrame];
	[mlabel setNumberOfLines:1];
	mlabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
	[mlabel setText:@"Messages"];
	[mlabel setBackgroundColor:[UIColor clearColor]];
	mlabel.textColor = [UIColor blackColor];
	mlabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:mlabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 90.0;
    return prefHeight;
}
@end

@implementation WeatherCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect wlabelFrame = CGRectMake(0, -15, kWidth, 60);
       
	
	wlabel = [[UILabel alloc] initWithFrame:wlabelFrame];
	[wlabel setNumberOfLines:1];
	wlabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
	[wlabel setText:@"Weather"];
	[wlabel setBackgroundColor:[UIColor clearColor]];
	wlabel.textColor = [UIColor blackColor];
	wlabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:wlabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 90.0;
    return prefHeight;
}
@end


@implementation ControlCenterCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect cclabelFrame = CGRectMake(0, -15, kWidth, 60);
       
	
	cclabel = [[UILabel alloc] initWithFrame:cclabelFrame];
	[cclabel setNumberOfLines:1];
	cclabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
	[cclabel setText:@"Control Center"];
	[cclabel setBackgroundColor:[UIColor clearColor]];
	cclabel.textColor = [UIColor blackColor];
	cclabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:cclabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 90.0;
    return prefHeight;
}
@end

@implementation NotificationCenterCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect nclabelFrame = CGRectMake(0, -15, kWidth, 60);
       
	
	nclabel = [[UILabel alloc] initWithFrame:nclabelFrame];
	[nclabel setNumberOfLines:1];
	nclabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
	[nclabel setText:@"Notification Center"];
	[nclabel setBackgroundColor:[UIColor clearColor]];
	nclabel.textColor = [UIColor blackColor];
	nclabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:nclabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 90.0;
    return prefHeight;
}
@end

@implementation LockScreenCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect lslabelFrame = CGRectMake(0, -15, kWidth, 60);
       
	
	lslabel = [[UILabel alloc] initWithFrame:lslabelFrame];
	[lslabel setNumberOfLines:1];
	lslabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
	[lslabel setText:@"Lock Screen"];
	[lslabel setBackgroundColor:[UIColor clearColor]];
	lslabel.textColor = [UIColor blackColor];
	lslabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:lslabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 90.0;
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
       
	
	label2 = [[UILabel alloc] initWithFrame:label2Frame];
	[label2 setNumberOfLines:1];
	label2.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
	[label2 setText:@"Credits"];
	[label2 setBackgroundColor:[UIColor clearColor]];
	label2.textColor = [UIColor blackColor];
	label2.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:label2];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 90.0;
    return prefHeight;
}
@end




@implementation InfiniOSListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"InfiniOS" target:self] retain];
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

@implementation MessagesListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Messages" target:self] retain];
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

@implementation WeatherListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Weather" target:self] retain];
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

@implementation ControlCenterListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"ControlCenter" target:self] retain];
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

@implementation NotificationCenterListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"NotificationCenter" target:self] retain];
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

@implementation LockScreenListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"LockScreen" target:self] retain];
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
