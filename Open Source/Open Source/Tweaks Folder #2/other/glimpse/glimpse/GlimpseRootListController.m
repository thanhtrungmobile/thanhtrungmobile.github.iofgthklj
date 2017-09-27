#include "GlimpseRootListController.h"

@implementation GlimpseRootListController
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Glimpse" target:self] retain];
	}
    return _specifiers;
}
@end
