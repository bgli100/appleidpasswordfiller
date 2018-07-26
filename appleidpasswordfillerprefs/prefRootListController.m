#include "prefRootListController.h"

@implementation prefRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

- (void)_returnKeyPressed:(id)notification {
	[self.view endEditing:YES];
	//[super _returnKeyPressed:notification];
}

@end
