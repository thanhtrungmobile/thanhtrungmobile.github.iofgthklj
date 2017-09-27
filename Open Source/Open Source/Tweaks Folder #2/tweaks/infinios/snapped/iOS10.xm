#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.infinios.plist"


inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}


@interface _UIContentUnavailableView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface PUCollectionView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface PUPhotosSectionHeaderContentView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface _PXUIScrollView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface UITextFieldLabel
@property (nonatomic, strong, readwrite) UIColor *textColor;
@end

@interface UIButtonLabel
@property (nonatomic, strong, readwrite) UIColor *textColor;
@end

@interface UITabBarButton
@property (getter=_unselectedTintColor, setter=_setUnselectedTintColor:, nonatomic, retain) UIColor *unselectedTintColor;
@end

@interface PUAlbumListCellContentView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end


%hook UITabBar
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SnappedCinemaMode")) {
self.barTintColor = [UIColor blackColor];
} return %orig;
}
%end

%hook UINavigationBar
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SnappedCinemaMode")) {
self.barTintColor = [UIColor blackColor];
} return %orig;
}
%end

%hook PUCollectionView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SnappedCinemaMode")) {
self.backgroundColor = [UIColor blackColor];
} return %orig;
}
%end

%hook UITextFieldLabel
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SnappedCinemaMode")) {
self.textColor = [UIColor whiteColor];
} return %orig;
}
%end

%hook UILabel
-(void) setTextColor:(id)arg1 {
%orig;
if(GetPrefBool(@"SnappedCinemaMode")) {
arg1 = [UIColor whiteColor];
%orig(arg1);
} return %orig;
}
%end

%hook _UIContentUnavailableView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SnappedCinemaMode")) {
self.backgroundColor = [UIColor blackColor];
} return %orig;
}
%end

%hook _PXUIScrollView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SnappedCinemaMode")) {
self.backgroundColor = [UIColor blackColor];
} return %orig;
}
%end

%hook PUPhotosSectionHeaderContentView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SnappedCinemaMode")) {
self.backgroundColor = [UIColor blackColor];
} return %orig;
}
%end

%hook UIButtonLabel
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SnappedCinemaMode")) {
self.textColor = [UIColor whiteColor];
} return %orig;
}
%end



/*
Snapped Album Options
*/

%hook PUAlbumListCellContentView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SnappedHighNumber")) {
UILabel *number = MSHookIvar<UILabel *>(self,"__subtitleLabel");
[number setHidden:YES];
} return %orig;

if(GetPrefBool(@"SnappedLowNumber")) {
UITextField *number = MSHookIvar<UITextField *>(self,"__titleTextField");
[number setHidden:YES];
} return %orig;
}
%end