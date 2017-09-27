#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.infinios.plist"


inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

@interface UITableViewIndex
@property (nonatomic, strong, readwrite) UIColor *indexColor;
@property (nonatomic, strong, readwrite) UIColor *indexBackgroundColor;
@end

@interface UITableViewCellContentView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface _UITableViewHeaderFooterViewLabel
@property (nonatomic, strong, readwrite) UIColor *textColor;
@end

@interface UITableViewLabel
@property (nonatomic, strong, readwrite) UIColor *textColor;
@end

@interface UISearchBarBackground
@property (nonatomic, strong, readwrite) UIColor *barTintColor;
@end

@interface _UINavigationBarBackground
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@property (nonatomic, strong, readwrite) UIColor *barTintColor;
@end

@interface _UISearchBarSearchFieldBackgroundView
@property (nonatomic, assign, readwrite) NSInteger *barStyle;
@end




%hook UITabBar
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"Cinemamode")) {
self.barTintColor = [UIColor blackColor];
self.backgroundColor = [UIColor blackColor]; 
} 
}
%end

%hook UITabBarButton
-(void)_setContentTintColor:(id)arg1 forState:(long long)arg2 {
%orig;
if(GetPrefBool(@"Cinemamode")) {
arg1 = [UIColor whiteColor];
%orig(arg1, arg2);
} 
} 
%end

%hook UITableViewIndex
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"Cinemamode")) {
self.indexBackgroundColor = [UIColor blackColor];
self.indexColor = [UIColor whiteColor];
} 
}
%end

%hook UITableViewHeaderFooterView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"Cinemamode")) {
UIView *header = MSHookIvar<UIView *>(self, "_backgroundView");
header.backgroundColor = [UIColor blackColor];
}
}
%end

%hook _UITableViewHeaderFooterViewLabel
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"Cinemamode")) {
self.textColor = [UIColor whiteColor];
}
}
%end

%hook UISearchBarBackground
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"Cinemamode")) {
self.barTintColor = [UIColor blackColor];
}
}

-(id)_createBackgroundImageForBarStyle:(long long)arg1 alpha:(double)arg2 {
%orig;
if(GetPrefBool(@"Cinemamode")) {
%orig;
arg2 = 0;
%orig(arg1, arg2);
} return %orig;
}
%end

%hook UITableViewLabel
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"Cinemamode")) {
self.textColor = [UIColor whiteColor];
}
}
%end

%hook UITableView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"Cinemamode")) {
self.separatorColor = [UIColor blackColor];
}
}
%end

%hook _UINavigationBarBackground
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"Cinemamode")) {
self.backgroundColor = [UIColor blackColor];
self.barTintColor = [UIColor blackColor];
}
}
%end

%hook UINavigationItemView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"Cinemamode")) {
UILabel *header = MSHookIvar<UILabel *>(self, "_label");
header.textColor = [UIColor whiteColor];
}
}
%end

%hook UIButtonContent
-(void) setImageColor:(id)arg1 {
%orig;
if(GetPrefBool(@"Cinemamode")) {
arg1 = [UIColor whiteColor];
%orig(arg1);
}
}
%end

%hook UITableViewCellContentView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"Cinemamode")) {
%orig;
self.backgroundColor = [UIColor blackColor];
}
}
%end

%hook UITableViewCellSelectedBackground
-(void) setSelectionTintColor:(id)arg1 {
%orig;
if(GetPrefBool(@"Cinemamode")) {
arg1 = [UIColor darkGrayColor];
%orig(arg1);
} return %orig;
}
%end

%hook UIView
-(void)_setBackgroundColor:(id)arg1 {
%orig;
if(GetPrefBool(@"Cinemamode")) {
arg1 = [UIColor blackColor];
%orig(arg1);
}
}
%end

%hook _UISearchBarSearchFieldBackgroundView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"Cinemamode")) {
NSInteger max = 1;
self.barStyle = &(max);
}
}
%end

%hook UISegmentedControl
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"Cinemamode")) {
self.tintColor = [UIColor whiteColor];
}
}
%end

%hook UILabel
-(void)_setTextColor:(id)arg1 {
%orig;
if(GetPrefBool(@"Cinemamode")) {
arg1 = [UIColor whiteColor];
} return %orig;
}

-(BOOL)_textColorFollowsTint {
%orig;
if(GetPrefBool(@"Cinemamode")) {
return FALSE;
} return %orig;
}
%end

%hook TPRevealingRingView
-(void) setColorOutsideRing:(id)arg1 {
%orig;
if(GetPrefBool(@"Cinemamode")) {
arg1 = [UIColor blackColor];
} return %orig;
}
%end

%hook TPBackgroundRoundedRectView
-(void) drawRect:(CGRect)arg1 {
%orig;
if(GetPrefBool(@"Cinemamode")) {
}
}
%end


%hook _UITextDocumentInterface
-(long long) keyboardAppearence {
%orig;
if(GetPrefBool(@"Cinemamode")) {
return 1;
} return %orig;
}
%end

%hook UITextInputTrails
-(long long) keyboardAppearence {
%orig;
if(GetPrefBool(@"Cinemamode")) {
return 1;
} return %orig;
}
%end

%hook UITextInputTrails
-(void) setKeyboardAppearence:(long long)arg1 {
%orig;
if(GetPrefBool(@"Cinemamode")) {
arg1 = 1;
%orig(arg1);
} return %orig;
}
%end

%hook UITextField
-(void) setKeyboardAppearence:(long long)arg1 {
%orig;
if(GetPrefBool(@"Cinemamode")) {
} return %orig;
}
%end

%hook UISearchBar
-(void) setKeyboardAppearence:(long long)arg1 {
%orig;
if(GetPrefBool(@"Cinemamode")) {
arg1 = 1;
%orig(arg1);
} return %orig;
}
%end

%hook UIKeyboardLayoutStar
-(void) setKeyboardAppearence:(long long)arg1 {
%orig;
if(GetPrefBool(@"Cinemamode")) {
arg1 = 1;
%orig(arg1);
} return %orig;
}
%end

%hook UIKeyboardLayoutCursor
-(void) setKeyboardAppearence:(long long)arg1 {
%orig;
if(GetPrefBool(@"Cinemamode")) {
} return %orig;
}
%end

%hook TPPathView
-(void) setFillColor:(id)arg1 {
%orig;
if(GetPrefBool(@"Cinemamode")) {
arg1 = [UIColor colorWithRed:64.0f/255.0f green:64.0f/255.0f blue:64.0f/255.0f alpha:1.0f];

%orig(arg1);
} return %orig;
}
%end