#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.quayshift.plist"


inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline int GetPrefInt(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];
}




@interface SBDockView : UIView
@property (nonatomic, assign, readwrite) CGPoint center;
@end

@interface SBIconListPageControl : UIView
@property (nonatomic, assign, readwrite) CGPoint center;
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface SBRootFolderView : UIView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface SBWallpaperEffectView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end