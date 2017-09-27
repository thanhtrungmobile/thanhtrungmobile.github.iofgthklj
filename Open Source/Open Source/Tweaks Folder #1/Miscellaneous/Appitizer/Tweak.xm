#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.appitizer.plist"
 
inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

@interface SBDeckSwitcherIconImageContainerView : UIView
@end

@interface SBDeckSwitcherItemContainer : UIView
@end



@interface SBDeckSwitcherViewController : UIViewController
@end

@interface SBWallpaperEffectView : UIView
@end

@interface SBAppSwitcherSnapshotView : UIView
@end
@interface SBSwitcherMetahostingHomePageContentView : UIView
@end



@interface SBAppSwitcherPageView : UIView
@property(nonatomic) double shadowAlpha;
@property(nonatomic) long long shadowStyle;
@end


UIView *night;
UIView *night2;
UIView *night3;



%hook SBSwitcherMetahostingHomePageContentView
-(void) layoutSubviews {
if(GetPrefBool(@"Night")) {

night = [[UIView alloc] initWithFrame:self.frame];
[night setBackgroundColor:[UIColor blackColor]];
night.alpha = 0.32;
[self addSubview:night];

} return %orig;

self.transform = CGAffineTransformMakeScale(1.2, 1.2);
}
%end

%hook SBAppSwitcherSnapshotView
-(void) layoutSubviews {
if(GetPrefBool(@"Night")) {

night2 = [[UIView alloc] initWithFrame:self.frame];
[night2 setBackgroundColor:[UIColor blackColor]];
night2.alpha = 0.32;
[self addSubview:night2];

} return %orig;
}
%end

%hook SBDeckSwitcherItemContainer
+ (double) iconSize {
if(GetPrefBool(@"kIcon")) {
        NSDictionary *icon = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.appitizer.plist"]];
return [[icon objectForKey:@"iconSize"] intValue];
} return %orig;
}
%end

%hook SBSwitcherMetahostingHomePageContentView
- (void)setCornerRadius:(double)arg1 {
        NSDictionary *corner = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.appitizer.plist"]];
return %orig([[corner objectForKey:@"cardCorner"] intValue]);
}
%end

%hook SBAppSwitcherHomePageCellView
-(void)setCornerRadius:(double)arg1 {
       NSDictionary *corner = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.appitizer.plist"]];
return %orig([[corner objectForKey:@"cardCorner"] intValue]);
}

-(double) cornerRadius {
        NSDictionary *corner = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.appitizer.plist"]];
return [[corner objectForKey:@"cardCorner"] intValue];
}
%end

%hook SBSwitcherAppViewWrapperPageContentView
-(void) setCornerRadius:(double)arg1 {
        NSDictionary *corner = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.appitizer.plist"]];
return %orig([[corner objectForKey:@"cardCorner"] intValue]);
}

-(double) cornerRadius {
        NSDictionary *corner = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.appitizer.plist"]];
return [[corner objectForKey:@"cardCorner"] intValue];
}
%end

%hook SBAppSwitcherSnapshotView
-(void) setCornerRadius:(double)arg1 {
        NSDictionary *corner = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.appitizer.plist"]];
return %orig([[corner objectForKey:@"cardCorner"] intValue]);
}

-(double) cornerRadius {
        NSDictionary *corner = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.antique.appitizer.plist"]];
return [[corner objectForKey:@"cardCorner"] intValue];
}
%end

%hook SBDeckSwitcherIconImageContainerView
-(void) layoutSubviews {
if(GetPrefBool(@"HideIcon")) {
        UIImageView *icon = MSHookIvar<UIImageView *>(self, "_imageView");
        [icon setHidden:YES];
}

if(GetPrefBool(@"Alter")) {
        self.center = CGPointMake([[UIScreen mainScreen] bounds].size.width / 2.68, [[UIScreen mainScreen] bounds].size.height - 90);
} return %orig;
}

-(id) displayName {
if(GetPrefBool(@"Alter")) {
       return @"";
} else if(GetPrefBool(@"HideLabel")) {
       return @"";
} return %orig;
}
%end

%hook SBAppSwitcherController
-(BOOL)switcherIconScroller:(id)arg1 shouldHideIconForDisplayItem:(id)arg {
if(GetPrefBool(@"HideIcon")) {
       return TRUE;
} return %orig;
}
%end

%hook SBAppSwitcherPageView
-(void) layoutSubviews {
if(GetPrefBool(@"HideShadow")) {
       self.shadowAlpha = 0.0;
} return %orig;
}
%end

%hook SBDeckSwitcherViewController
-(void) viewDidLoad {
if(GetPrefBool(@"Night")) {

night3 = [[UIView alloc] initWithFrame:self.view.frame];
[night3 setBackgroundColor:[UIColor blackColor]];
night3.alpha = 0.60;
[self.view addSubview:night3];

} return %orig;
}
%end
