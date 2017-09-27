#include "HomiRootListController.h"

@implementation HomiRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

@end


@implementation BitsListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Bits" target:self] retain];
	}

	return _specifiers;
}

@end


@implementation IconListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Icons" target:self] retain];
	}

	return _specifiers;
}

@end


@implementation TouchListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Touch" target:self] retain];
	}

	return _specifiers;
}

@end