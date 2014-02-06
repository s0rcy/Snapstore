#import <Preferences/Preferences.h>

@interface snapstoreprefsListController: PSListController {
}
@end

@implementation snapstoreprefsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"snapstoreprefs" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
