#import <Foundation/Foundation.h>
#import "substrate.h"
#import <UIKit/UIKit.h>

#define PREFS_FILE @"/var/mobile/Library/Preferences/com.s0rcy.snapstoreprefs.plist"

%hook SCMediaCache

// Save unencrypted image to disk before it's encrypted and cached
// Image does not need to be opened, and sender is not informed if image is viewed
-(void)setObject:(id)object forKey:(id)key persist:(BOOL)persist encrypt:(BOOL)encrypt dictionary:(id)dictionary {
	NSMutableDictionary *prefs = [NSMutableDictionary dictionaryWithContentsOfFile:PREFS_FILE];

	if([[prefs objectForKey:@"saveImage"] boolValue]) {
		NSData *obj = (NSData *)object;
		NSString* documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
		NSString *str = [NSString stringWithFormat:@"%@/%@.jpg", documentsPath, key];
		if(![[NSFileManager defaultManager] fileExistsAtPath:str]){
			NSLog(@"[Snapstore] Snap saved to %@", str);
			[obj writeToFile:str options:NSDataWritingAtomic error:nil];
		} else {
			NSLog(@"[Snapstore] Snap already cached, skipping %@.jpg", key);
		}
	}
	
	%orig;
}

%end


%hook Manager

// Disable the countdown tick to never expire images
// Note: Sender is not informed if image is viewed
-(void)tick:(id)tick {
	NSMutableDictionary *prefs = [NSMutableDictionary dictionaryWithContentsOfFile:PREFS_FILE];

	if([[prefs objectForKey:@"neverExpire"] boolValue]) {
		return;
	}

	%orig;
}

%end


%hook FeedViewController

// Override the callback for when a screenshot is take, and do nothing
-(void)userDidTakeScreenshot {
	NSMutableDictionary *prefs = [NSMutableDictionary dictionaryWithContentsOfFile:PREFS_FILE];

	if([[prefs objectForKey:@"disableScreenNotif"] boolValue]) {
		NSLog(@"[Snapstore] Blocking userDidTakeScreenshot");
		return;
	}

	%orig;
}

%end
