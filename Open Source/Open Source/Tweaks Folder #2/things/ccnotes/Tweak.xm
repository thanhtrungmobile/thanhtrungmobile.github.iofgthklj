@interface CCUINightShiftContentView : UIView <UIGestureRecognizerDelegate, UITextViewDelegate>
@end

@interface CCUIControlCenterContainerView : UIView <UITextViewDelegate>
@end

UIView *newView;
UITextView *textView;

UILongPressGestureRecognizer *Onotes;
UILongPressGestureRecognizer *Cnotes;

%hook CCUIControlCenterContainerView
-(void) layoutSubviews {
%orig;

if(!newView) {
newView = [[UIView alloc] initWithFrame:CGRectMake(10, 165, self.bounds.size.width - 20, 100)];

newView.backgroundColor = [UIColor whiteColor];
newView.hidden = YES;

newView.layer.cornerRadius = 13.5;
newView.layer.borderColor = [UIColor blackColor].CGColor;
newView.layer.borderWidth = 2.0;

[self addSubview:newView];
}


if(!textView) {
textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, newView.bounds.size.width, newView.bounds.size.height)];
[textView setDelegate:self];
textView.hidden = YES;

[textView setFont:[UIFont fontWithName:@"Helvetica-Regular" size:16]];
[textView setScrollEnabled:YES];
[textView setTextColor:[UIColor whiteColor]];
[textView setUserInteractionEnabled:YES];

[textView setBackgroundColor:[UIColor clearColor]];
textView.layer.cornerRadius = 13.5;

[newView addSubview:textView];
      }
}

%new
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {

    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }

    return YES;
}
%end

%hook CCUINightShiftContentView
-(void) layoutSubviews {
%orig;

Onotes = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(openNotes:)];
    Onotes.minimumPressDuration = 1.0;
[self addGestureRecognizer:Onotes];

Cnotes = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(closeNotes:)];
    Cnotes.minimumPressDuration = 1.0;
}

%new
- (void) openNotes:(UILongPressGestureRecognizer *)gesture {
newView.hidden = NO;
textView.hidden = NO;
[self removeGestureRecognizer:Onotes];
[self addGestureRecognizer:Cnotes];
}

%new
- (void) closeNotes:(UILongPressGestureRecognizer *)gesture {
newView.hidden = YES;
textView.hidden = YES;
[self removeGestureRecognizer:Cnotes];
[self addGestureRecognizer:Onotes];
}

%end

%hook CCUINightShiftSectionController
/*
-(BOOL)enabled {
return FALSE;
}
*/

-(void)buttonTapped:(id)arg1 {
%orig(NULL);
}
%end