#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.infinios.plist"
 
inline bool GetPrefBool(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}


@interface VideosCollectionView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface MPUVignetteBackgroundView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface MPButton
@property (nonatomic, strong, readwrite) UIColor *tintColor;
@end

@interface VideosCollapsingLabel
@property (nonatomic, strong, readwrite) UIColor *textColor;
@end