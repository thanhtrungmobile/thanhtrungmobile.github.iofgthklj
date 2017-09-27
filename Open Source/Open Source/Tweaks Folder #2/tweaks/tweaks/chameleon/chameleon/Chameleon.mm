#import <Preferences/PSSpecifier.h>
#import <Preferences/PSListController.h>
#import <Twitter/TWTweetComposeViewController.h>





@interface ChameleonListController: PSListController {
}
@end

@interface InfoListController: PSListController {
}
@end

@interface ChangelogListController: PSListController {
}
@end

@interface TwitterListController: PSListController {
}
@end

@interface PageListController: PSListController {
}
@end

@interface RotationListController: PSListController {
}
@end

@interface AssistantListController: PSListController {
}
@end

@interface SpotlightListController: PSListController {
}
@end

@interface LockscreenListController: PSListController {
}
@end

@interface FolderListController: PSListController {
}
@end

@interface IconListController: PSListController {
}
@end

@interface AnimationListController: PSListController {
}
@end

@interface MiscellaneousListController: PSListController {
}
@end

@interface TouchListController: PSListController {
}
@end

@interface DockListController: PSListController {
}
@end

@interface ChatKitListController: PSListController {
}
@end

@interface GEOPlatformListController: PSListController {
}
@end

@interface PhotoLibraryListController: PSListController {
}
@end

@interface UIKitListController: PSListController {
}
@end

@interface SpringListController: PSListController {
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
	[label setText:@"Chameleon"];
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
	[trevLabel setText:@"Based off of Calypso by Trevor Schmitt"];
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





@implementation ChameleonListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Chameleon" target:self] retain];
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
	


- (void)followTwitter {

    //holy shit i can't type today
    NSString *user = @"Antique_Dev";
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]])
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetbot:///user_profile/" stringByAppendingString:user]]];
    
    else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]])
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitterrific:///profile?screen_name=" stringByAppendingString:user]]];
    
    else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]])
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetings:///user?screen_name=" stringByAppendingString:user]]];
    
    else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]])
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitter://user?screen_name=" stringByAppendingString:user]]];
    
    else
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"https://mobile.twitter.com/" stringByAppendingString:user]]];

    /*UIApplication *app = [UIApplication sharedApplication];
    NSURL *tweetbot = [NSURL URLWithString:@"tweetbot:///user_profile/Antique_Dev"];
    if ([app canOpenURL:tweetbot]) {
	[app openURL:tweetbot];
    }
    
    else {
	NSURL *twitterapp = [NSURL URLWithString:@"twitter:///user?screen_name=Antique_Dev"];
	if ([app canOpenURL:twitterapp]) {
	    [app openURL:twitterapp];
	}
	
	else {
	    NSURL *twitterweb = [NSURL URLWithString:@"http://twitter.com/Antique_Dev"];
	    [app openURL:twitterweb];
	}
    }*/
}

@end

@implementation InfoListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Information" target:self] retain];
	}
	return _specifiers;
}
@end

@implementation ChangelogListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Changelog" target:self] retain];
	}
	return _specifiers;
}
@end

@implementation TwitterListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Twitter" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)loadView {
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;
}
@end

@implementation PageListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Page" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)loadView {
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;
}
@end

@implementation RotationListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Rotation" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)loadView {
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;
}
@end

@implementation AssistantListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Assistant" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)loadView {
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;
}
@end

@implementation SpotlightListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Spotlight" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)loadView {
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;
}
@end

@implementation LockscreenListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Lockscreen" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)loadView {
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;
}
@end

@implementation FolderListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Folder" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)loadView {
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;
}
@end

@implementation IconListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Icon" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)loadView {
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;
}
@end

@implementation AnimationListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Animation" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)loadView {
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;
}
@end

@implementation MiscellaneousListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Miscellaneous" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)loadView {
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;
}
@end

@implementation TouchListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Touch" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)loadView {
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;
}
@end

@implementation DockListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Dock" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)loadView {
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;
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

- (void)loadView {
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;
}
@end

@implementation GEOPlatformListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"GEOPlatform" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)loadView {
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;
}
@end

@implementation PhotoLibraryListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"PhotoLibrary" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)loadView {
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;
}
@end

@implementation UIKitListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"UIKit" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)loadView {
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;
}
@end

@implementation SpringListController

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"SpringBoard" target:self] retain];
	}
	return _specifiers;
}

-(void)respring{
system("killall -9 backboardd");
}

- (void)loadView {
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;
}
@end



// vim:ft=objc
