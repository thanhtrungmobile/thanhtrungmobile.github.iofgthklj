#define PLIST_PATH @"/var/mobile/Library/Preferences/com.thecomputerwhisperer.antennaremembers.plist"

inline bool GetPrefBool(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

	

%hook RCRecentsCollector
- (void)clearRecentsOlderThan5WithContext:(id)un {
    if(GetPrefBool(@"Recents")) {
    
  }
}
%end
