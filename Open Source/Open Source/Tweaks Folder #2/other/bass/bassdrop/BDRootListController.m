#include "BDRootListController.h"

@implementation BDRootListController
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}
	return _specifiers;
}


-(void) tutorial {
UIAlertController * alert=   [UIAlertController
                                 alertControllerWithTitle:@"Tutorial"
                                 message:@"Using a custom sound file(.caf)\n\nLocation:\n/Library/Application Support/BassDrop/Sounds/"
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