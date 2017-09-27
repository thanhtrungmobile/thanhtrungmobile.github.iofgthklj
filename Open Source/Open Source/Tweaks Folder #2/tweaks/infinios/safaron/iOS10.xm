#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.infinios.plist"


inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}


@interface BookmarkFavoritesCollectionView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface _UIBarBackground
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface _SFNavigationBarBackdrop
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

%hook BookmarkFavoritesCollectionView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
self.backgroundColor = [UIColor blackColor];
} return %orig;
}
%end

%hook _SFNavigationBarBackdrop
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
self.hidden = YES;
} return %orig;
}
%end

%hook UIToolbar
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
self.backgroundColor = [UIColor blackColor];
self.barStyle = 1;
} return %orig;
}
%end

%hook UITableView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
self.backgroundColor = [UIColor blackColor];
} return %orig;
}
%end

%hook UILabel 
-(void)_setTextColor:(id)arg1 {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
arg1 = [UIColor whiteColor];
%orig(arg1);
} return %orig;
}

-(void) setTextColor:(id)arg1 {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
arg1 = [UIColor whiteColor];
%orig(arg1);
} return %orig;
}
%end

%hook _UIBarBackground
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
UIView *ignorantView = MSHookIvar<UIView *>(self, "_customBackgroundView");

[ignorantView setHidden:YES];
} return %orig;
}
%end