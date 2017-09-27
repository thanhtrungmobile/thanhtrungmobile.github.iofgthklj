#include "TTCCLRootListController.h"

@implementation TTCCLRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}


-(void)boot {
system("killall -9 backboardd");
}
@end
