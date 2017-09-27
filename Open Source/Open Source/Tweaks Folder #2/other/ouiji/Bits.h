#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.ouija.plist"
#import "libcolorpicker.h"

inline bool GetPrefBool(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline int GetPrefInt(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];
}

/* Segments */
NSUserDefaults *prefs = [[NSUserDefaults alloc] initWithSuiteName:@"com.antique.ouija"];

NSInteger dmode = [[prefs objectForKey:@"dmode"] intValue];
/* Segments */







@interface UIKeyboardDicationBackgroundGradientView : UIView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface UIKeyboardDicationBackground : UIView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface UIKeyboardEmojiScrubBarView : UIView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface SUICFlamesView : UIView
@property (nonatomic) int mode;
@end

@interface UIKBSplitImageView : UIView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end