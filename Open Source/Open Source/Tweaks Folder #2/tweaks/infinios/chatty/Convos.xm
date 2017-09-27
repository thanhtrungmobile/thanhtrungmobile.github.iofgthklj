#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.infinios.plist"

inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline int GetPrefInt(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];
}


@interface CKConversationListCell
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end




%hook CKConversationListController
- (void)setConversationCellHeight:(double)arg1 {
%orig;
if(GetPrefBool(@"ChattyConvoHeight")) {
	int height = GetPrefInt(@"chattyconvoheight");
arg1 = height;
			%orig(arg1);
} return %orig;
}
%end


%hook CKConversationListCell
-(void) layoutSubviews {
%orig;
if(GetPrefBool(@"ChattyUnread")) {
UIImageView *unread = MSHookIvar<UIImageView *>(self,"_unreadIndicatorImageView");
[unread setHidden:YES];
}

if(GetPrefBool(@"ChattyChevron")) {
UIImageView *chevron = MSHookIvar<UIImageView *>(self,"_chevronImageView");
[chevron setHidden:YES];
}

if(GetPrefBool(@"ChattyPreview")) {
UILabel *summaryLabel = MSHookIvar<UILabel *>(self, "_summaryLabel");
[summaryLabel setHidden:YES];
} 

if(GetPrefBool(@"ChattySender")) {
UILabel *name = MSHookIvar<UILabel *>(self,"_fromLabel");
[name setHidden:YES];
} return %orig;
}
%end

