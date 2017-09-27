#import "CinemaMode.h"

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.infinios.plist"

inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

static CKUIThemeDark *darkTheme;



%group Phone
%hook CKUIBehaviorPhone
- (id)theme {
%orig;
if(GetPrefBool(@"ChattyCinemaMode")) {
	return darkTheme;
} return %orig;
}
%end
%end


%group Pad
%hook CKUIBehaviorPad
- (id)theme {
%orig;
if(GetPrefBool(@"ChattyCinemaMode")) {
	return darkTheme;
} return %orig;
}
%end
%end


%group Common
%hook CKAvatarNavigationBar
- (void)_setBarStyle:(int)style {
%orig;
if(GetPrefBool(@"ChattyCinemaMode")) {
	%orig(1);
} return %orig;
}

-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"ChattyCinemaMode")) {
self.barTintColor = [UIColor blackColor];
} return %orig;
}
%end

%hook CKAvatarContactNameCollectionReusableView
- (void)setStyle:(int)style {
%orig;
if(GetPrefBool(@"ChattyCinemaMode")) {
	%orig(3);
} return %orig;
}

-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"ChattyMName")) {
%orig;
self.hidden = YES;
} return %orig;
}
%end

%hook CKAvatarTitleCollectionReusableView
- (void)setStyle:(int)style {
%orig;
if(GetPrefBool(@"ChattyCinemaMode")) {
	%orig(3);
} return %orig;
}
%end

%hook CKNavigationBarCanvasView
- (void)setTitleView:(id)titleView {
%orig;
if(GetPrefBool(@"ChattyCinemaMode")) {
	if (titleView && [titleView respondsToSelector:@selector(setTextColor:)]) {
		[(UILabel *)titleView setTextColor:UIColor.whiteColor];
	}
	%orig(titleView);
} return %orig;
}
%end

%hook CKDetailsContactsTableViewCell
- (UILabel *)nameLabel {
%orig;
if(GetPrefBool(@"ChattyCinemaMode")) {
	UILabel *nl = %orig;
	nl.textColor = UIColor.whiteColor;
	return nl;
} return %orig;
}
%end

%hook UINavigationItem
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"ChattyCinemaMode")) {
UILabel *title = MSHookIvar<UILabel *>(self,"_label");
title.textColor = [UIColor whiteColor];
} return %orig;
}
%end

%hook UILabel
-(void)_setTextColor:(id)arg1 {
%orig;
if(GetPrefBool(@"ChattyCinemaMode")) {
arg1 = [UIColor whiteColor];
%orig(arg1);
} return %orig;
}

-(void) setTextColor:(id)arg1 {
%orig;
if(GetPrefBool(@"ChattyCinemaMode")) {
arg1 = [UIColor whiteColor];
%orig(arg1);
} return %orig;
}
%end

%hook UINavigationButton
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"ChattyCinemaMode")) {
self.tintColor = [UIColor whiteColor];
} return %orig;
}
%end
%end



%ctor {
	@autoreleasepool {
    darkTheme = [[%c(CKUIThemeDark) alloc] init];
		
                      if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
			%init(Pad);
		} else {
			%init(Phone);
		}
		%init(Common);
	}
}
