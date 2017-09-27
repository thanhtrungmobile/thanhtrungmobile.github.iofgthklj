#import "Bits.h"

%hook NCNotificationNoContentView
-(void) layoutSubviews {
      %orig;
NSString* content = [NSString stringWithContentsOfFile:@"/var/mobile/Documents/save.txt" encoding:NSUTF8StringEncoding error:NULL];
textView.text = content;


UILabel *noNotes = MSHookIvar<UILabel *>(self, "_noNotificationsLabel");
[noNotes setHidden:YES];

if(!base) {
base = [[UIView alloc] initWithFrame:CGRectMake(8, 8, self.bounds.size.width - 16, 112)];

[base setBackgroundColor:[UIColor clearColor]];
base.layer.cornerRadius = 13.5;
base.layer.masksToBounds = YES;
[self addSubview:base];
}

if(!header) {
header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, base.bounds.size.width, 32)];

[header setBackgroundColor:[UIColor colorWithRed:188/255.0f green:188/255.0f blue:188/255.0f alpha:0.99]];
[base addSubview:header];
}

if(!iconView) {
iconView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:@"/Library/Application Support/Notes/Notes@2x.png"]];
iconView.frame = CGRectMake(8, 8, 16, 16);
iconView.layer.cornerRadius = 4.5;
iconView.layer.masksToBounds = YES;

[header addSubview:iconView];
}


if(!textView) {
textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 32, base.bounds.size.width, base.bounds.size.height - 32)];
[textView setDelegate:self];

[textView setFont:[UIFont fontWithName:@"HelveticaNeue-Regular" size:26]];
[textView setScrollEnabled:YES];

[textView setTextColor:[UIColor blackColor]];
[textView setBackgroundColor:[UIColor colorWithRed:172/255.0f green:172/255.0f blue:172/255.0f alpha:0.985]];

[textView setUserInteractionEnabled:YES];

textView.keyboardAppearance = UIKeyboardAppearanceDark;


NSString *string = textView.text; 
NSString *documentsDirectory = @"/var/mobile/Documents/";
NSString *path = [documentsDirectory stringByAppendingPathComponent:@"save.txt"];

NSError *error;
[string writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error];


[base addSubview:textView];
}

if(!button) {
button = [UIButton buttonWithType:UIButtonTypeCustom];
[button addTarget:self 
           action:@selector(more:)
 forControlEvents:UIControlEventTouchUpInside];
[button setTitle:@"Show More" forState:UIControlStateNormal];

 button.titleLabel.font = [UIFont systemFontOfSize:12];
[button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];

button.frame = CGRectMake(header.bounds.size.width - 80, 0, 78, 32);

[header addSubview:button];
}


if(!imageBase) {
imageBase = [[UIView alloc] initWithFrame:CGRectMake(8, base.bounds.size.height + 12, self.bounds.size.width - 16, 32)];

[imageBase setBackgroundColor:[UIColor colorWithRed:172/255.0f green:172/255.0f blue:172/255.0f alpha:0.985]];
imageBase.layer.cornerRadius = 13.5;
imageBase.layer.masksToBounds = NO;
[self addSubview:imageBase];
     }

if(!addButton) {
addButton = [UIButton buttonWithType:UIButtonTypeCustom];
[addButton addTarget:self 
           action:@selector(addImage:)
 forControlEvents:UIControlEventTouchUpInside];
[addButton setTitle:@"+" forState:UIControlStateNormal];

 addButton.titleLabel.font = [UIFont systemFontOfSize:14];
[addButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];

addButton.frame = imageBase.bounds;

[imageBase addSubview:addButton];
}

}

%new
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {

    if([text isEqualToString:@"."]) {
        [textView resignFirstResponder];


NSString *string = textView.text; 
NSString *documentsDirectory = @"/var/mobile/Documents/";
NSString *path = [documentsDirectory stringByAppendingPathComponent:@"save.txt"];

NSError *error;
[string writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error];
        return NO;
    }

    return YES;
}

%new
-(void) more:(UIButton *)sender {
NSString* content = [NSString stringWithContentsOfFile:@"/var/mobile/Documents/save.txt" encoding:NSUTF8StringEncoding error:NULL];
textView.text = content;

  // Selected
if(sender.selected) {

base.frame = CGRectMake(8, 8, self.bounds.size.width - 16, 182);

textView.frame = CGRectMake(0, 32, base.bounds.size.width, base.bounds.size.height - 32);

imageBase.frame = CGRectMake(8, base.bounds.size.height + 12, self.bounds.size.width - 16, 32);

[sender setTitle:@"Show Less" forState:UIControlStateNormal];


// Unselected
} else {

base.frame = CGRectMake(8, 8, self.bounds.size.width - 16, 112);

textView.frame = CGRectMake(0, 32, base.bounds.size.width, base.bounds.size.height - 32);

imageBase.frame = CGRectMake(8, base.bounds.size.height + 12, self.bounds.size.width - 16, 32);

[sender setTitle:@"Show More" forState:UIControlStateNormal];
} sender.selected = !sender.selected;
   }
%end