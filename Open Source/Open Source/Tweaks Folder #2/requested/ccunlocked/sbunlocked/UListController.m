#include "UListController.h"

@implementation UListController
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Unlocked" target:self] retain];
	}
	return _specifiers;
}
@end

@implementation CCListController
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"CC" target:self] retain];
	}
	return _specifiers;
}
@end

@implementation HSListController
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"HS" target:self] retain];
	}
	return _specifiers;
}
@end
