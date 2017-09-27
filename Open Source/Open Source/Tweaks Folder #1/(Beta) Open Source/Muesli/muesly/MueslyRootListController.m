#include "MueslyRootListController.h"


@protocol PreferencesTableCustomView
- (id)initWithSpecifier:(id)arg1;

@optional
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1;
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 inTableView:(id)arg2;
@end

@interface MueslyCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *label;
    UILabel *label2;
}
@end



@implementation MueslyCustomCell

- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
	#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	CGRect labelFrame = CGRectMake(0, -15, kWidth, 60);
CGRect labelFrame2 = CGRectMake(0, -70, kWidth, 20);
       
	
	label = [[UILabel alloc] initWithFrame:labelFrame];
	[label setNumberOfLines:1];
	label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:45];
	[label setText:@"Muesly"];
	[label setBackgroundColor:[UIColor clearColor]];
	label.textColor = [UIColor blackColor];
	label.textAlignment = NSTextAlignmentCenter;

label2 = [[UILabel alloc] initWithFrame:labelFrame2];
	[label2 setNumberOfLines:1];
	label2.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16];
	[label2 setText:@"Made to work with music.ly"];
	[label2 setBackgroundColor:[UIColor clearColor]];
	label2.textColor = [UIColor grayColor];
	label2.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:label];
       [self addSubview:label2];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 75.0;
    return prefHeight;
}
@end

@implementation MueslyRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

-(void)apply {
                        UIAlertController * alert=   [UIAlertController
                                 alertControllerWithTitle:@"Credits"
                                 message:@"Muesly by Antique_Dev"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
   UIAlertAction* ok = [UIAlertAction
                        actionWithTitle:@"Close"
                        style:UIAlertActionStyleDefault
                        handler:^(UIAlertAction * action)
                        {
                            [alert dismissViewControllerAnimated:YES completion:nil];
                             
                        }];
    
   [alert addAction:ok];
    
   [self presentViewController:alert animated:YES completion:nil];

}

@end
