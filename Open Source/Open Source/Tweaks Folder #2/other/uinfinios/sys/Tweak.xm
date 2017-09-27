#import "Bits.h"






%hook PSTableCell
-(void) layoutSubviews {
%orig;

if(GetPrefBool(@"SysCinemaMode")) {
self.backgroundColor = [UIColor blackColor];
}
}
%end

%hook UITableView
-(void) layoutSubviews {
%orig;
UIView *background = MSHookIvar<UIView *>(self, "_tableHeaderView");

if(GetPrefBool(@"SysCinemaMode")) {
self.backgroundColor = [UIColor blackColor];
background.backgroundColor = [UIColor blackColor];
}
}
%end

%hook UINavigationBar
-(void) layoutSubviews {
%orig;

if(GetPrefBool(@"SysCinemaMode")) {
self.barTintColor = [UIColor blackColor];
}
}
%end

%hook UISearchBar
-(void) layoutSubviews {
%orig;

if(GetPrefBool(@"SysCinemaMode")) {
self.barTintColor = [UIColor blackColor];
self.barStyle = 1;
}
}
%end

%hook UISearchBarTextField
-(void) layoutSubviews {
%orig;

if(GetPrefBool(@"SysCinemaMode")) {
self.backgroundColor = [UIColor colorWithRed:26.0/255.0f green:26.0/255.0f blue:26.0/255.0f alpha:1.0];
}
}
%end

%hook UITableViewLabel
-(void) layoutSubviews {
%orig;

if(GetPrefBool(@"SysCinemaMode")) {
self.textColor = [UIColor whiteColor];
}
}
%end

%hook _UITableViewHeaderFooterViewBackground
-(void) layoutSubviews {
%orig;

if(GetPrefBool(@"SysCinemaMode")) {
self.backgroundColor = [UIColor blackColor];
}
}
%end

%hook _UITableViewHeaderFooterContentView
-(void) layoutSubviews {
%orig;

if(GetPrefBool(@"SysCinemaMode")) {
self.backgroundColor = [UIColor blackColor];
}
}
%end

%hook UINavigationItemView
-(void) layoutSubviews {
%orig;
UILabel *label = MSHookIvar<UILabel *>(self, "_label");

if(GetPrefBool(@"SysCinemaMode")) {
label.textColor = [UIColor whiteColor];
}
}
%end

%hook UILabel
-(void)_setTextColor:(id)arg1 {
%orig;

if(GetPrefBool(@"SysCinemaMode")) {
%orig([UIColor whiteColor]);
}
}
%end

%hook UITextFieldLabel
-(void) layoutSubviews {
%orig;

if(GetPrefBool(@"SysCinemaMode")) {
self.textColor = [UIColor whiteColor];
}
}
%end

%hook UIStatusBar
-(void) layoutSubviews {
%orig;

if(GetPrefBool(@"SysCinemaMode")) {
self.backgroundColor = [UIColor whiteColor];
}
}
%end