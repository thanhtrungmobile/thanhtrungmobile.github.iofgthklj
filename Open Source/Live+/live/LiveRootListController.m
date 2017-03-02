#include "LiveRootListController.h"


@protocol PreferencesTableCustomView
- (id)initWithSpecifier:(id)arg1;

@optional
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1;
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 inTableView:(id)arg2;
@end

@interface LiveCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *label;
}
@end



@implementation LiveCustomCell

- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
	//bad idea to use UIScreen and Bounds, iPads don't like that
	//int width = [[UIScreen mainScreen] bounds].size.width;
	//so instead, let's use this
	#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	CGRect labelFrame = CGRectMake(0, -15, kWidth, 50);
       
	
	label = [[UILabel alloc] initWithFrame:labelFrame];
	[label setNumberOfLines:1];
	label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:60];
	[label setText:@"Live+"];
	[label setBackgroundColor:[UIColor clearColor]];
	label.textColor = [UIColor blackColor];
	label.textAlignment = NSTextAlignmentCenter;
	
	[self addSubview:label];
	
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 75.0;
    return prefHeight;
}
@end

@implementation LiveRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

-(void)apply {
                        UIAlertController * alert=   [UIAlertController
                                 alertControllerWithTitle:@"Credits"
                                 message:@"Live+ by Antique_Dev"
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
