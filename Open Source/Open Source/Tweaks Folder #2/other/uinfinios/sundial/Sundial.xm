#import "Bits.h"




%hook WorldClockCellView
-(void) layoutSubviews {
%orig;

UILabel *combined = MSHookIvar<UILabel *>(self, "_combinedLabel");
combined.hidden = YES;

UILabel *name = MSHookIvar<UILabel *>(self, "_nameLabel");
name.textColor = [UIColor blackColor];
}
%end



%hook MTDateLabel
-(void) layoutSubviews {
%orig;

UILabel *clock = MSHookIvar<UILabel *>(self, "_dateLabel");
clock.textColor = [UIColor blackColor];
}
%end



%hook AnalogClockView
-(void) setNighttime:(BOOL)night {
%orig(FALSE);
}

-(BOOL) isNighttime {
return FALSE;
}
%end

%hook UITableView
-(void) layoutSubviews {
%orig;

self.backgroundColor = [UIColor whiteColor];
}
%end



%hook WorldClockTableViewCell
-(void) layoutSubviews {
%orig;

self.backgroundColor = [UIColor whiteColor];
}
%end



%hook UINavigationBar
-(void) layoutSubviews {
%orig;

self.barTintColor = [UIColor whiteColor];
}
%end

%hook UITabBar
-(void) layoutSubviews {
%orig;

self.barTintColor = [UIColor whiteColor];
}
%end

%hook UINavigationItemView
-(void) layoutSubviews {
%orig;

UILabel *title = MSHookIvar<UILabel *>(self, "_label");
title.textColor = [UIColor blackColor];
}
%end



%hook StopWatchViewController
-(void) viewDidLayoutSubviews {
%orig;

UIView *analog = MSHookIvar<UIView *>(self, "_analogStopwatchContainer");
analog.backgroundColor = [UIColor blackColor];

UIView *digital = MSHookIvar<UIView *>(self, "_digitalStopwatchContainer");
digital.backgroundColor = [UIColor blackColor];

UIView *view = MSHookIvar<UIView *>(self, "_view");
view.backgroundColor = [UIColor blackColor];
}
%end



%hook TimerControlsView
-(void) layoutSubviews {
%orig;

self.backgroundColor = [UIColor whiteColor];
}
%end



%hook UIView
-(void)_setBackgroundColor:(id)arg1 {
%orig([UIColor whiteColor]);
}
%end