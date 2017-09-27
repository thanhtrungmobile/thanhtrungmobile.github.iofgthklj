#import <Twitter/Twitter.h>
#import <Preferences/PSSpecifier.h>
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#include <spawn.h>

#define kPreferencesPath @"/var/mobile/Library/Preferences/com.antique.lsswipetoapp.plist"
#define kPreferencesChanged "com.antique.lsswipetoapp.preferences-changed"

#define kUrl_FollowOnTwitter @"https://twitter.com/Antique_Dev"

#define iPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

@interface PSViewController : UIViewController
-(id)initForContentSize:(CGSize)contentSize;
-(void)setPreferenceValue:(id)value specifier:(id)specifier;
@end

@interface PSListController : PSViewController{
    NSArray *_specifiers;
}

- (void)viewDidAppear:(BOOL)arg1;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidUnload;
- (void)viewWillAppear:(BOOL)arg1;
- (void)viewWillDisappear:(BOOL)arg1;
-(void)loadView;
- (UITableView *)table;
-(void)reloadSpecifier:(PSSpecifier*)specifier animated:(BOOL)animated;
-(void)reloadSpecifier:(PSSpecifier*)specifier;
- (NSArray *)loadSpecifiersFromPlistName:(NSString *)name target:(id)target;
-(PSSpecifier*)specifierForID:(NSString*)specifierID;
@end

@interface LSSwipeToAppListController: PSListController {
}
@end

@implementation LSSwipeToAppListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"LSSwipeToApp" target:self] retain];
	}
	return _specifiers;
}

- (void)loadView
{
    [super loadView];
    UIBarButtonItem *tweet = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/LSSwipeToApp.bundle/Twitter.png"] style:UIBarButtonItemStylePlain target:self action:@selector(shareTapped:)];
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(20, 20), NO, 0.0);
    UIImage *blank = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [tweet setBackgroundImage:blank forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:tweet, nil]];
    
    CGFloat width = self.view.bounds.size.width;
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, 114)];
    headerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;


    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, width, 53)];
    titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    titleLabel.text = @"LSSwipeToApp";
    titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:45];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.shadowColor = [UIColor whiteColor];
    titleLabel.shadowOffset = CGSizeMake(0, 1);
    titleLabel.numberOfLines = 1;


    UILabel *creditLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10 + 45, width, 34)];
    creditLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    creditLabel.text = @"Changeable LS App";
    creditLabel.font = [UIFont systemFontOfSize:14];
    creditLabel.textColor = [UIColor grayColor];
    creditLabel.textAlignment = NSTextAlignmentCenter;
    creditLabel.numberOfLines = 2;
    [headerView addSubview:titleLabel];
    [headerView addSubview:creditLabel];
    self.table.tableHeaderView = headerView;
}

#pragma mark - Actions Tapped
- (void)shareTapped:(UIBarButtonItem *)sender {
        UIAlertController * alert=   [UIAlertController
                                 alertControllerWithTitle:@"Error"
                                 message:@"Currently not implemented"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
   UIAlertAction* ok = [UIAlertAction
                        actionWithTitle:@"Close"
                        style:UIAlertActionStyleDestructive
                        handler:^(UIAlertAction * action)
                        {
                            [alert dismissViewControllerAnimated:YES completion:nil];
                             
                        }];
   [alert addAction:ok];
    
   [self presentViewController:alert animated:YES completion:nil];
}

-(id) readPreferenceValue:(PSSpecifier*)specifier {
    NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:kPreferencesPath];
    if (!settings[specifier.properties[@"key"]]) {
        return specifier.properties[@"default"];
    }
    return settings[specifier.properties[@"key"]];
}

-(void) setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier {
    NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
    [defaults addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:kPreferencesPath]];
    [defaults setObject:value forKey:specifier.properties[@"key"]];
    [defaults writeToFile:kPreferencesPath atomically:YES];
    CFStringRef antiquePost = (CFStringRef)specifier.properties[@"PostNotification"];
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), antiquePost, NULL, NULL, YES);
}


- (void)followOnTwitter:(PSSpecifier*)specifier {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:kUrl_FollowOnTwitter]];
}

- (void)respringButton:(PSSpecifier *)specifier {
    pid_t pid;
    int status;
    const char *argv[] = {"killall", "backboardd", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)argv, NULL);
    waitpid(pid, &status, WEXITED);
}
@end

// vim:ft=objc
