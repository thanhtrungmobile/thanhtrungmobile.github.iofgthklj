#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.infinios.plist"


inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}


@interface BookmarkFavoritesCollectionView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface UIActionSheetiOSDismissActionView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface ActionPanel
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface _UIBarBackground
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface _SFNavigationBarBackdrop
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface NavigationBar
@property (nonatomic, assign, readwrite) NSUInteger tintStyle;
@property (nonatomic, strong, readwrite) UIColor *preferredBarTintColor;
@end

@interface UITextFieldLabel
@property (nonatomic, strong, readwrite) UIColor *textColor;
@end




%hook UIActionSheetiOSDismissActionView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {

UIButton *button = MSHookIvar<UIButton *>(self, "_dismissButton");

button.backgroundColor = [UIColor blackColor];
} return %orig;
}
%end

%hook UITextField
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
self.textColor = [UIColor whiteColor];
}
}
%end

%hook UITextFieldLabel
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
self.textColor = [UIColor whiteColor];
}
}
%end

%hook ActionPanel
-(void) viewDidLayoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {

UIView *view = MSHookIvar<UIView *>(self, "_view");

view.backgroundColor = [UIColor blackColor];
} return %orig;
}
%end

%hook UIKBRenderConfig
- (BOOL) lightKeyboard {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
return NO;
} return %orig;
}
%end

%hook NavigationBar
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {

self.tintStyle = 1;
self.preferredBarTintColor = [UIColor blackColor];
} return %orig;
}
%end

%hook UINavigationBar
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
self.barTintColor = [UIColor blackColor];
}
}
%end

%hook BookmarkFavoritesCollectionView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"SafaronCinemaMode")) {
self.backgroundColor = [UIColor blackColor];
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