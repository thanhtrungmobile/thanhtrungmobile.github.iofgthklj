#import <Preferences/PSSpecifier.h>
#import <Preferences/PSListController.h>





@interface InfiniOSListController: PSListController {
}

@end

@interface MessagesListController: PSListController {
}
@end

@interface ChattyColourListController: PSListController {
}
@end

@interface SysListController: PSListController {
}
@end

@interface SnappedListController: PSListController {
}
@end

@interface CamListController: PSListController {
}
@end

@interface AhoyListController: PSListController {
}
@end

@interface ApolloListController: PSListController {
}
@end

@interface ApolloColourListController: PSListController {
}
@end

@interface NotificationCenterListController: PSListController {
}
@end

@interface NotificationColourListController: PSListController {
}
@end

@interface LockScreenListController: PSListController {
}
@end

@interface CreditsListController: PSListController {
}
@end

@interface HelpListController: PSListController {
}
@end

@interface SpringifyListController: PSListController {
}
@end

@interface SafaronListController: PSListController {
}
@end

@interface TheatreListController: PSListController {
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

@interface SnappedCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *snaplabel;
}
@end

@interface HelpCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *helplabel;
}
@end

@interface ChattyColourCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *chattylabel;
}
@end

@interface ApolloCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *cclabel;
}
@end

@interface ApolloColourCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *ccclabel;
}
@end

@interface SysCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *slabel;
}
@end

@interface CamCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *clabel;
}
@end

@interface AhoyCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *alabel;
}
@end

@interface TheatreCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *tlabel;
}
@end

@interface NotificationCenterCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *nclabel;
}
@end

@interface NotificationColourCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *ncclabel;
}
@end

@interface LockScreenCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *lslabel;
}
@end

@interface SpringifyCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *sprlabel;
}
@end

@interface CreditsCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *label2;
    UILabel *underLabel2;
}
@end

@interface SafaronCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *saflabel;
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
	[mlabel setText:@"Chatty"];
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

@implementation ChattyColourCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect chattylabelFrame = CGRectMake(0, -15, kWidth, 60);
       
	
	chattylabel = [[UILabel alloc] initWithFrame:chattylabelFrame];
	[chattylabel setNumberOfLines:1];
	chattylabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
	[chattylabel setText:@"Chatty Colours"];
	[chattylabel setBackgroundColor:[UIColor clearColor]];
	chattylabel.textColor = [UIColor blackColor];
	chattylabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:chattylabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 90.0;
    return prefHeight;
}
@end

@implementation SysCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect slabelFrame = CGRectMake(0, -15, kWidth, 60);
       
	
	slabel = [[UILabel alloc] initWithFrame:slabelFrame];
	[slabel setNumberOfLines:1];
	slabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
	[slabel setText:@"Sys+"];
	[slabel setBackgroundColor:[UIColor clearColor]];
	slabel.textColor = [UIColor blackColor];
	slabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:slabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 90.0;
    return prefHeight;
}
@end

@implementation HelpCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect helplabelFrame = CGRectMake(0, -15, kWidth, 60);
       
	
	helplabel = [[UILabel alloc] initWithFrame:helplabelFrame];
	[helplabel setNumberOfLines:1];
	helplabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
	[helplabel setText:@"About & More"];
	[helplabel setBackgroundColor:[UIColor clearColor]];
	helplabel.textColor = [UIColor blackColor];
	helplabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:helplabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 90.0;
    return prefHeight;
}
@end

@implementation AhoyCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect alabelFrame = CGRectMake(0, -15, kWidth, 60);
       
	
	alabel = [[UILabel alloc] initWithFrame:alabelFrame];
	[alabel setNumberOfLines:1];
	alabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
	[alabel setText:@"Ahoyhoy"];
	[alabel setBackgroundColor:[UIColor clearColor]];
	alabel.textColor = [UIColor blackColor];
	alabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:alabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 90.0;
    return prefHeight;
}
@end

@implementation SpringifyCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect sprlabelFrame = CGRectMake(0, -15, kWidth, 60);
       
	
	sprlabel = [[UILabel alloc] initWithFrame:sprlabelFrame];
	[sprlabel setNumberOfLines:1];
	sprlabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
	[sprlabel setText:@"Springify"];
	[sprlabel setBackgroundColor:[UIColor clearColor]];
	sprlabel.textColor = [UIColor blackColor];
	sprlabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:sprlabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 90.0;
    return prefHeight;
}
@end

@implementation ApolloCustomCell
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
	[cclabel setText:@"Apollo"];
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

@implementation ApolloColourCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect ccclabelFrame = CGRectMake(0, -15, kWidth, 60);
       
	
	ccclabel = [[UILabel alloc] initWithFrame:ccclabelFrame];
	[ccclabel setNumberOfLines:1];
	ccclabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
	[ccclabel setText:@"Apollo Colours"];
	[ccclabel setBackgroundColor:[UIColor clearColor]];
	ccclabel.textColor = [UIColor blackColor];
	ccclabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:ccclabel];
	
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
	[nclabel setText:@"Buzzer"];
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

@implementation NotificationColourCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect ncclabelFrame = CGRectMake(0, -15, kWidth, 60);
       
	
	ncclabel = [[UILabel alloc] initWithFrame:ncclabelFrame];
	[ncclabel setNumberOfLines:1];
	ncclabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
	[ncclabel setText:@"Buzzer Colours"];
	[ncclabel setBackgroundColor:[UIColor clearColor]];
	ncclabel.textColor = [UIColor blackColor];
	ncclabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:ncclabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 90.0;
    return prefHeight;
}
@end

@implementation CamCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect clabelFrame = CGRectMake(0, -15, kWidth, 60);
       
	
	clabel = [[UILabel alloc] initWithFrame:clabelFrame];
	[clabel setNumberOfLines:1];
	clabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
	[clabel setText:@"ShutterBug"];
	[clabel setBackgroundColor:[UIColor clearColor]];
	clabel.textColor = [UIColor blackColor];
	clabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:clabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 90.0;
    return prefHeight;
}
@end

@implementation SafaronCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect saflabelFrame = CGRectMake(0, -15, kWidth, 60);
       
	
	saflabel = [[UILabel alloc] initWithFrame:saflabelFrame];
	[saflabel setNumberOfLines:1];
	saflabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
	[saflabel setText:@"Safaron"];
	[saflabel setBackgroundColor:[UIColor clearColor]];
	saflabel.textColor = [UIColor blackColor];
	saflabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:saflabel];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 90.0;
    return prefHeight;
}
@end

@implementation SnappedCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect snaplabelFrame = CGRectMake(0, -15, kWidth, 60);
       
	
	snaplabel = [[UILabel alloc] initWithFrame:snaplabelFrame];
	[snaplabel setNumberOfLines:1];
	snaplabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
	[snaplabel setText:@"Snapped"];
	[snaplabel setBackgroundColor:[UIColor clearColor]];
	snaplabel.textColor = [UIColor blackColor];
	snaplabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:snaplabel];
	
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

@implementation TheatreCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	
	CGRect tlabelFrame = CGRectMake(0, -15, kWidth, 60);
       
	
	tlabel = [[UILabel alloc] initWithFrame:tlabelFrame];
	[tlabel setNumberOfLines:1];
	tlabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
	[tlabel setText:@"Theatre"];
	[tlabel setBackgroundColor:[UIColor clearColor]];
	tlabel.textColor = [UIColor blackColor];
	tlabel.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:tlabel];
	
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

- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
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

- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
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

@implementation ChattyColourListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"ChattyColour" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
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

@implementation SysListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Sys" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
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

@implementation CamListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"ShutterBug" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
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

@implementation AhoyListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Ahoy" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
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

@implementation SpringifyListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Springify" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
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

@implementation ApolloListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Apollo" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
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

@implementation ApolloColourListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"ApolloColour" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
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

@implementation SnappedListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Snapped" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
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

- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
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

@implementation NotificationColourListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"NotificationColour" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
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

- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
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

@implementation SafaronListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Safaron" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
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


@implementation TheatreListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Theatre" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
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


@implementation HelpListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Help" target:self] retain];
	}
	return _specifiers;
}
@end


// vim:ft=objc
