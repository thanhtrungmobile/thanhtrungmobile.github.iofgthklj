#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.droidbars.plist"
 
inline bool GetPrefBool(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}


@interface CKAvatarNavigationBar : UIView
@end

@interface CKNavigationBarCanvasView : UIView
@property (nonatomic, assign, readwrite) CGRect frame;
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface CKAvatarContactNameCollectionReusableView : UIView
@property (nonatomic, assign, readwrite) CGRect frame;
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface CKCanvasBackButtonView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface CKAvatarCollectionViewCell : UIView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface CKAvatarView : UIView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

%hook CKAvatarViewCollectionViewCell
-(void) setAvatarView:(id)arg1 {
%orig;
if(GetPrefBool(@"Icon")) {
arg1 = NULL;
%orig(arg1);
   }
}

-(id) avatarView {
%orig;
if(GetPrefBool(@"Icon")) {
  return NULL;
   } return %orig;
}
%end

%hook CKCanvasBackButtonView 
-(void) layoutSubviews {
UIView *icon = MSHookIvar<UIView *>(self, "_titlePaddingView");
icon.hidden = YES;

UILabel *label = MSHookIvar<UILabel *>(self, "_titleLabel");
label.hidden = YES;
}
%end

%hook CKNavigationBarCanvasView
-(CGSize) sizeThatFits:(CGSize)height {
%orig;
return CGSizeMake(self.bounds.size.width, 30);
}

-(void) layoutSubviews {
%orig;

UIView *leftItemView = MSHookIvar<UIView *>(self, "_leftItemView");
leftItemView.center = CGPointMake(leftItemView.center.x, 24.5);

UIView *rightItemView = MSHookIvar<UIView *>(self, "_rightItemView");
rightItemView.center = CGPointMake(rightItemView.center.x, 13);


self.frame = CGRectMake(0, 0, self.bounds.size.width, 30);
}



-(void) setTitleView:(id)arg1 {
%orig;
if(GetPrefBool(@"Icon")) {
arg1 = NULL;

%orig(arg1);
   }
}

-(id) titleView {
%orig;
if(GetPrefBool(@"Icon")) {
 return NULL;
   } return %orig;
}
%end