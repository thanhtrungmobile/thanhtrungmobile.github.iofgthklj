#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.infinios.plist"


inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}



@interface PSTableCell
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface UIStatusBar
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface UISearchBarTextField
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface _UITableViewHeaderFooterViewBackground
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface _UITableViewHeaderFooterContentView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface UITextFieldLabel
@property (nonatomic, strong, readwrite) UIColor *textColor;
@end

@interface UITableViewLabel
@property (nonatomic, strong, readwrite) UIColor *textColor;
@end