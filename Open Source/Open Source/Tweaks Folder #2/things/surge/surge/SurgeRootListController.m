#include "SurgeRootListController.h"



@protocol PreferencesTableCustomView
- (id)initWithSpecifier:(id)arg1;

@optional
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1;
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 inTableView:(id)arg2;
@end

@interface SurgeCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *label;
}
@end


@implementation SurgeCustomCell

- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {

	#define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
	CGRect labelFrame = CGRectMake(0, -15, kWidth, 80);
	
label = [[UILabel alloc] initWithFrame:labelFrame];
	[label setNumberOfLines:1];
	label.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:72];
	[label setText:@"📦 Surge 📦"];
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


@implementation SurgeRootListController
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

-(void) credits {
UIAlertController * alert=   [UIAlertController
                                 alertControllerWithTitle:@"Developer Credits"
                                 message:@"\n Antique - @Antique_Dev \n sk8r - @sk8r_99 \n gilshahar7 - @gilshahar7 \n uroboro - @uroboro845"
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
@end
