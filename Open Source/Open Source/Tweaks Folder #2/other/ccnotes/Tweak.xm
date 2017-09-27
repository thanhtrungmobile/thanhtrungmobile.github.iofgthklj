#import "CCNotesPageViewController.h"
#import "Bits.h"
#import "libcolorpicker.h"

UIView *newView;
UITextView *textView;

%hook CCUIControlCenterViewController
%property (nonatomic, retain) CCNotesPageViewController *notesViewController;
-(void) viewDidLoad {
  %orig;
NSString* content = [NSString stringWithContentsOfFile:@"/var/mobile/Documents/ccnotes.txt" encoding:NSUTF8StringEncoding error:NULL];
textView.text = content;


  if(!self.notesViewController) {
  self.notesViewController = [[CCNotesPageViewController alloc] init];


  [self _addContentViewController:self.notesViewController];
  [self _addOrRemovePagesBasedOnVisibility];
  }
}
%end

%hook CCNotesPageViewController
-(void) viewDidLoad {
%orig;

UIView *view = MSHookIvar<UIView *>(self, "_view");

int x (GetPrefInt(@"xPos"));
int font (GetPrefInt(@"fontSize"));


NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile: PLIST_PATH];
 
NSString *coolColorHex = [prefs objectForKey:@"textcolour"];





if(GetPrefBool(@"Enable")) {
newView = [[UIView alloc] initWithFrame:CGRectMake(0 + x, -24, [[UIScreen mainScreen] bounds].size.width - 16 - x, self.view.bounds.size.height / 4)];

newView.backgroundColor = [UIColor clearColor];

[view addSubview:newView];


textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, newView.bounds.size.width, newView.bounds.size.height)];
[textView setDelegate:self];
textView.backgroundColor = [UIColor clearColor];

[textView setFont:[UIFont systemFontOfSize:font]];
[textView setScrollEnabled:YES];

[textView setUserInteractionEnabled:YES];

[newView addSubview:textView];


if(GetPrefBool(@"EnableColour")) {
 textView.textColor = LCPParseColorString(coolColorHex, @"#000000");
} else {
textView.textColor = [UIColor blackColor];
}
}

NSString *string = textView.text; 
NSString *documentsDirectory = @"/var/mobile/Documents/";
NSString *path = [documentsDirectory stringByAppendingPathComponent:@"ccnotes.txt"];

NSError *error;
[string writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error];
}




%new
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {

    if([text isEqualToString:@"."]) {
        [textView resignFirstResponder];
        return NO;

NSString *string = textView.text; 
NSString *documentsDirectory = @"/var/mobile/Documents/";
NSString *path = [documentsDirectory stringByAppendingPathComponent:@"ccnotes.txt"];

NSError *error;
[string writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error];
    }

    return YES;
}
%end