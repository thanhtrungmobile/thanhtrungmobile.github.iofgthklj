#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.live.plist"
 
inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}



@interface LLLiveStageCommentTableView : UITableView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface LLEmitterViewController
@end

@interface LLWaveEmitterView : UIView
@end



%hook LLLiveStageCommentTableView
-(void)layoutSubviews {
if(GetPrefBool(@"Comment")) {
self.hidden = TRUE;
}
}
%end 

%hook LLLiveStageViewController
-(void)viewDidAppear:(BOOL)arg1 {
if(GetPrefBool(@"View")) {
%orig(TRUE);

UIView *bottom = MSHookIvar<UIView *>(self, "_bottomHUD");
[bottom setHidden:YES];
UIView *top = MSHookIvar<UIView *>(self, "_topHUD");
[top setHidden:YES];
}
}
%end

%hook LLWaveEmitterView 
-(void)layoutSubviews {
if(GetPrefBool(@"Emit")) {
self.hidden = TRUE;
}
}
%end