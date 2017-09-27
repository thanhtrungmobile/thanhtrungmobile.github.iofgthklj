@interface SBUIActionPlatterViewController
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface UITableViewCollectionCell
@property (nonatomic, assign, readwrite) NSInteger separatorStyle;
@end

%hook SBUIActionPlatterViewController
-(void) loadView {
%orig;

UIView *dividers = MSHookIvar<UIView *>(self,"_keylinesContainerView");
[dividers setHidden:YES];
}
%end

%hook UITableView
-(void) layoutSubviews {
%orig;
self.separatorStyle = 0;
}
%end

%hook UITableViewCollectionCell
-(void) layoutSubviews {
%orig;
self.separatorStyle = 0;
}
%end