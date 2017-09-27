#include "BlurstListController.h"


@protocol PreferencesTableCustomView
- (id)initWithSpecifier:(id)arg1;

@optional
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1;
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 inTableView:(id)arg2;
@end

#define kTintColor [UIColor colorWithRed:133.0/256.0 green:20.0/256.0 blue:184.0/256.0 alpha:1.0]



@interface BlurstCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *blurstlabel;
}
@end

@interface BlurControlsCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *blurcontrolslabel;
}
@end

@interface NCBlurCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *ncblurlabel;
}
@end

@interface SLBlurCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *slblurlabel;
}
@end

@interface FTBlurCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *ftblurlabel;
}
@end

@interface FBlurCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *fblurlabel;
}
@end

@interface LSBlurCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *lsblurlabel;
}
@end

@interface GBlurCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *gblurlabel;
}
@end

@interface DBlurCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *dblurlabel;
}
@end





@implementation BlurstCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect blurstlabelFrame = CGRectMake(0, -15, kWidth, 60);
       
	
	blurstlabel = [[UILabel alloc] initWithFrame:blurstlabelFrame];
	[blurstlabel setNumberOfLines:1];
	blurstlabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:60];
	[blurstlabel setText:@"Blurst"];
	[blurstlabel setBackgroundColor:[UIColor clearColor]];
	blurstlabel.textColor = [UIColor blackColor];
	blurstlabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:blurstlabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 70.0;
    return prefHeight;
}
@end


@implementation BlurControlsCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect blurcontrolslabelFrame = CGRectMake(0, -15, kWidth, 60);
       
	
	blurcontrolslabel = [[UILabel alloc] initWithFrame:blurcontrolslabelFrame];
	[blurcontrolslabel setNumberOfLines:1];
	blurcontrolslabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:60];
	[blurcontrolslabel setText:@"Blur Controls"];
	[blurcontrolslabel setBackgroundColor:[UIColor clearColor]];
	blurcontrolslabel.textColor = [UIColor blackColor];
	blurcontrolslabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:blurcontrolslabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 70.0;
    return prefHeight;
}
@end


@implementation NCBlurCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect ncblurlabelFrame = CGRectMake(0, -15, kWidth, 50);
       
	
	ncblurlabel = [[UILabel alloc] initWithFrame:ncblurlabelFrame];
	[ncblurlabel setNumberOfLines:1];
	ncblurlabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:45];
	[ncblurlabel setText:@"Notification Center"];
	[ncblurlabel setBackgroundColor:[UIColor clearColor]];
	ncblurlabel.textColor = [UIColor blackColor];
	ncblurlabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:ncblurlabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 70.0;
    return prefHeight;
}
@end


@implementation SLBlurCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect slblurlabelFrame = CGRectMake(0, -15, kWidth, 50);
       
	
	slblurlabel = [[UILabel alloc] initWithFrame:slblurlabelFrame];
	[slblurlabel setNumberOfLines:1];
	slblurlabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:45];
	[slblurlabel setText:@"Spotlight"];
	[slblurlabel setBackgroundColor:[UIColor clearColor]];
	slblurlabel.textColor = [UIColor blackColor];
	slblurlabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:slblurlabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 70.0;
    return prefHeight;
}
@end


@implementation FTBlurCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect ftblurlabelFrame = CGRectMake(0, -15, kWidth, 50);
       
	
	ftblurlabel = [[UILabel alloc] initWithFrame:ftblurlabelFrame];
	[ftblurlabel setNumberOfLines:1];
	ftblurlabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:45];
	[ftblurlabel setText:@"3D Touch"];
	[ftblurlabel setBackgroundColor:[UIColor clearColor]];
	ftblurlabel.textColor = [UIColor blackColor];
	ftblurlabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:ftblurlabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 70.0;
    return prefHeight;
}
@end


@implementation FBlurCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect fblurlabelFrame = CGRectMake(0, -15, kWidth, 50);
       
	
	fblurlabel = [[UILabel alloc] initWithFrame:fblurlabelFrame];
	[fblurlabel setNumberOfLines:1];
	fblurlabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:45];
	[fblurlabel setText:@"Folders"];
	[fblurlabel setBackgroundColor:[UIColor clearColor]];
	fblurlabel.textColor = [UIColor blackColor];
	fblurlabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:fblurlabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 70.0;
    return prefHeight;
}
@end


@implementation LSBlurCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect lsblurlabelFrame = CGRectMake(0, -15, kWidth, 50);
       
	
	lsblurlabel = [[UILabel alloc] initWithFrame:lsblurlabelFrame];
	[lsblurlabel setNumberOfLines:1];
	lsblurlabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:45];
	[lsblurlabel setText:@"Lockscreen"];
	[lsblurlabel setBackgroundColor:[UIColor clearColor]];
	lsblurlabel.textColor = [UIColor blackColor];
	lsblurlabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:lsblurlabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 70.0;
    return prefHeight;
}
@end


@implementation GBlurCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect gblurlabelFrame = CGRectMake(0, -15, kWidth, 50);
       
	
	gblurlabel = [[UILabel alloc] initWithFrame:gblurlabelFrame];
	[gblurlabel setNumberOfLines:1];
	gblurlabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:45];
	[gblurlabel setText:@"General"];
	[gblurlabel setBackgroundColor:[UIColor clearColor]];
	gblurlabel.textColor = [UIColor blackColor];
	gblurlabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:gblurlabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 70.0;
    return prefHeight;
}
@end


@implementation DBlurCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect dblurlabelFrame = CGRectMake(0, -15, kWidth, 50);
       
	
	dblurlabel = [[UILabel alloc] initWithFrame:dblurlabelFrame];
	[dblurlabel setNumberOfLines:1];
	dblurlabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:45];
	[dblurlabel setText:@"Dock"];
	[dblurlabel setBackgroundColor:[UIColor clearColor]];
	dblurlabel.textColor = [UIColor blackColor];
	dblurlabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:dblurlabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 70.0;
    return prefHeight;
}
@end






@implementation BlurstListController
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Blurst" target:self] retain];
	}
	return _specifiers;
}

- (void)loadView {
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;
}
@end


@implementation BlurControlsListController
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"BlurControls" target:self] retain];
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


@implementation NCBlurListController
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"NCBlur" target:self] retain];
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


@implementation SLBlurListController
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"SLBlur" target:self] retain];
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


@implementation FTBlurListController
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"FTBlur" target:self] retain];
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


@implementation FBlurListController
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"FBlur" target:self] retain];
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


@implementation LSBlurListController
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"LSBlur" target:self] retain];
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


@implementation GBlurListController
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"GBlur" target:self] retain];
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


@implementation DBlurListController
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"DBlur" target:self] retain];
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