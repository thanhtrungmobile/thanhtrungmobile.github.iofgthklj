#import "Interfaces.h"

%hook UITabBar
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"TheatreCinemaMode") {
self.barTintColor = [UIColor blackColor];
}
%end

%hook UINavigationBar
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"TheatreCinemaMode") {
self.barTintColor = [UIColor blackColor];
}
%end

%hook UINavigationItemView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"TheatreCinemaMode") {
UILabel *title = MSHookIvar<UILabel *>(self, "_label");
title.textColor = [UIColor whiteColor];
}
%end

%hook VideosCollectionView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"TheatreCinemaMode") {
self.backgroundColor = [UIColor blackColor];
}
%end

%hook VideosDetailsTableViewCell
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"TheatreCinemaMode") {
UILabel *title = MSHookIvar<UILabel *>(self, "_titleLabel");
UILabel *detail = MSHookIvar<UILabel *>(self, "_detailLabel");

title.textColor = [UIColor whiteColor];
detail.textColor = [UIColor whiteColor];
}
%end

%hook UITableView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"TheatreCinemaMode") {
self.backgroundColor = [UIColor blackColor];
}
%end

%hook VideosChaptersTableViewCell
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"TheatreCinemaMode") {
UILabel *title = MSHookIvar<UILabel *>(self, "_textLabel");
UILabel *detail = MSHookIvar<UILabel *>(self, "_detailTextLabel");

title.textColor = [UIColor whiteColor];
detail.textColor = [UIColor whiteColor];
}
%end

%hook MPUVignetteBackgroundView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"TheatreCinemaMode") {
self.hidden = YES;
}
%end

%hook VideosDetailHeaderView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"TheatreCinemaMode") {
UILabel *title = MSHookIvar<UILabel *>(self, "_titleLabel");
UILabel *detail = MSHookIvar<UILabel *>(self, "_subtitleLabel");

title.textColor = [UIColor whiteColor];
detail.textColor = [UIColor whiteColor];
}
%end

%hook UICollectionView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"TheatreCinemaMode") {
self.backgroundColor = [UIColor blackColor];
}
%end

%hook UIScrollView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"TheatreCinemaMode") {
self.backgroundColor = [UIColor blackColor];
}
%end

%hook VideosPosterCollectionViewCell
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"TheatreCinemaMode") {
UILabel *title = MSHookIvar<UILabel *>(self, "_titleLabel");
UILabel *detail = MSHookIvar<UILabel *>(self, "_subtitleLabel");

title.textColor = [UIColor whiteColor];
detail.textColor = [UIColor whiteColor];
}
%end


%hook VideosTVEpisodeTableViewCell
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"TheatreCinemaMode") {
UILabel *text = MSHookIvar<UILabel *>(self, "_textLabel");
UILabel *detail = MSHookIvar<UILabel *>(self, "_detailTextLabel");

text.textColor = [UIColor whiteColor];
detail.textColor = [UIColor whiteColor];
}
%end

%hook MPButton
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"TheatreCinemaMode") {
UIImageView *play = MSHookIvar<UIImageView *>(self, "_imageView");
play.tintColor = [UIColor whiteColor];
}
%end

%hook VideosCollapsingLabel
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"TheatreCinemaMode") {
self.textColor = [UIColor whiteColor];
}
%end

%hook UITextView
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"TheatreCinemaMode") {
self.textColor = [UIColor whiteColor];
}
%end