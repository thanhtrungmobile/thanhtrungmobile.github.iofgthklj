@interface SBIconScrollView : UIScrollView
@end

%hook SBIconScrollView
-(void) setPagingEnabled:(BOOL)arg1 {
      %orig;

%orig(FALSE);
}

-(void)_setPagingFriction:(double)arg1 {
      %orig;

%orig(50);
}
%end