#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.muesly.plist"
 
inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}



@interface MLClickDetectedView : UIView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

%hook MLClickDetectedView
-(void)layoutSubviews {
if(GetPrefBool(@"Stream")) {
self.hidden = YES;
}
}
%end