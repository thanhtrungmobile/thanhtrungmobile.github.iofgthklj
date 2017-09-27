#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.infinios.plist"

inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}



@interface CKEntryButtonView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface CKMessageEntryView
@property (nonatomic, assign, readwrite) UIEdgeInsets coverInsets;
@property (assign, getter=shouldDisablePluginButtons, nonatomic) BOOL disablePluginButtons;
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface CKAvatarCollectionViewCell
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface CKNavigationBarCanvasView
@property (nonatomic, strong, readwrite) UIColor *tintColor;
@end


%hook CKMessageEntryView
-(void) setShouldShowPluginButtons:(BOOL)arg1 {
if(GetPrefBool(@"ChattyPlugs")) {
%orig(FALSE);
} return %orig;
}

-(void) layoutSubviews {
if(GetPrefBool(@"ChattyPlugs")) {
self.coverInsets = (UIEdgeInsetsMake(5, 20, 5, 20));

UIImageView *arrow = MSHookIvar<UIImageView *>(self,"_arrowButton");
[arrow setHidden:YES];
} return %orig;
}
%end

%hook CKEntryButtonView
-(void) layoutSubviews {
if(GetPrefBool(@"ChattyPlugs")) {
self.hidden = YES;
} return %orig;
}
%end

%hook CKNavigationBarCanvasView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"ChattyCinemaMode")) {
UIView *left = MSHookIvar<UIView *>(self,"_leftItemView");
left.tintColor = [UIColor whiteColor];

UIView *right = MSHookIvar<UIView *>(self,"_rightItemView");
right.tintColor = [UIColor whiteColor];
} return %orig;
}
%end

%hook CKCanvasBackButtonView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"ChattyCinemaMode")) {
UILabel *title = MSHookIvar<UILabel *>(self,"_titleLabel");
title.textColor = [UIColor blackColor];
} return %orig;
}
%end