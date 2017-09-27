#import "Bits.h"
#import "libcolorpicker.h"

%hook UIKeyboardDicationBackground
-(void) layoutSubviews {
%orig;

NSDictionary *prefs2 = [NSDictionary dictionaryWithContentsOfFile:PLIST_PATH];
 
NSString *coolColorHex = [prefs2 objectForKey:@"dictColour"];

if(GetPrefBool(@"EnableDict")) {
self.backgroundColor = LCPParseColorString(coolColorHex, @"#000000");
}
}
%end

%hook UIKeyboardEmojiScrubBarView
-(void) layoutSubviews {
%orig;

NSDictionary *prefs3 = [NSDictionary dictionaryWithContentsOfFile:PLIST_PATH];
 
NSString *coolColorHex = [prefs3 objectForKey:@"mojiColour"];

if(GetPrefBool(@"EnableMoji")) {
self.backgroundColor = LCPParseColorString(coolColorHex, @"#000000");
}
}
%end

%hook UIKBSplitImageView
-(void) layoutSubviews {
%orig;

NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:PLIST_PATH];
 
NSString *coolColorHex = [prefs objectForKey:@"dictColour2"];

if(GetPrefBool(@"EnableMain")) {
self.backgroundColor = LCPParseColorString(coolColorHex, @"#000000");
}
}
%end

%hook SUICFlamesView
-(void) layoutSubviews {
%orig;

if(GetPrefBool(@"DictationMode")) {
if(dmode == 0) {
self.mode = 1;
     } else if(dmode == 1) {
self.mode = 0;
     } 
   } return %orig;
}
%end



@interface UIKBKeyplaneView : UIView
/*
    UIKBSplitImageView * _keyBackgrounds;
    UIKBSplitImageView * _keyBorders;
    UIKBSplitImageView * _keyCaps;
    bool  _shouldDrawRect;
*/
@end

%hook UIKeyplaneView
-(void) layoutSubviews {
%orig;

UIKBSplitImageView *back = MSHookIvar<UIKBSplitImageView *>(self, "_keyBackgrounds");
UIKBSplitImageView *border = MSHookIvar<UIKBSplitImageView *>(self, "_keyBackgrounds");
UIKBSplitImageView *cap = MSHookIvar<UIKBSplitImageView *>(self, "_keyBackgrounds");



[back setHidden:YES];
[border setHidden:YES];
[cap setHidden:YES];
}
%end