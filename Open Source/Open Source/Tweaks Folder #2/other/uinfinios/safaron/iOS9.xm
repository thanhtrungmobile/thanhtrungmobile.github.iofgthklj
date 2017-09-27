#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.infinios.plist"


inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

@interface BookmarkFavoritesCollectionView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface BrowserToolbar
@property (nonatomic, strong, readwrite) UIColor *tintColor;
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface BookmarksNavigationBar
@property (nonatomic, strong, readwrite) UIColor *barTintColor;
@end

@interface _UIToolbarNavigationButton
@property (nonatomic, strong, readwrite) UIColor *tintColor;
@end

@interface UINavigationItemView
@property (nonatomic, strong, readwrite) UIColor *textColor;
@end

@interface ReadingListTableViewCell
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface BookmarksTableView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface SocialLinksTableViewCell
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface _UITableViewHeaderFooterViewLabel
@property (nonatomic, strong, readwrite) UIColor *textColor;
@end

@interface UINavigationButton
@property (nonatomic, strong, readwrite) UIColor *tintColor;
@end




%hook BookmarkFavoritesCollectionView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
self.backgroundColor = [UIColor blackColor];
}
}
%end

%hook BookmarksNavigationBar
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
self.barTintColor = [UIColor blackColor];
}
}
%end

%hook UINavigationItemView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
UILabel *label = MSHookIvar<UILabel *>(self, "_label");
label.textColor = [UIColor whiteColor];
}
}
%end

%hook _UIToolbarNavigationButton
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
self.tintColor = [UIColor whiteColor];
}
}
%end

%hook ReadingListTableViewCell
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
self.backgroundColor = [UIColor blackColor];
}
}
%end

%hook SocialLinksTableViewCell
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
self.backgroundColor = [UIColor blackColor];
}
}
%end

%hook BookmarksTableView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
self.backgroundColor = [UIColor blackColor];
}
}
%end

%hook UITableViewCell
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
self.backgroundColor = [UIColor blackColor];
}
}
%end

%hook UISegmentedControl
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
self.tintColor = [UIColor whiteColor];
}
}
%end

%hook UIToolbar
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
self.barTintColor = [UIColor blackColor];
}
}
%end

%hook UINavigationButton
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
self.tintColor = [UIColor whiteColor];
}
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

%hook UITableViewHeaderFooterView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
UIView *header = MSHookIvar<UIView *>(self, "_backgroundView");
header.backgroundColor = [UIColor blackColor];
}
}
%end

%hook _UITableViewHeaderFooterViewLabel
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
self.textColor = [UIColor whiteColor];
}
}
%end