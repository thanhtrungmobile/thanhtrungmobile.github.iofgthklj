#include <spawn.h>

@interface SBRootFolderView : UIView <UIGestureRecognizerDelegate>
@end


UIView *view;

float dragOffsetX, dragOffsetY;

%hook SBRootFolderView
- (void)_layoutSubviews {
%orig;

if(!view) {
view = [[UIView alloc] initWithFrame:CGRectMake(self.bounds.size.width / 2, self.bounds.size.width / 2, 100, 162)];
view.userInteractionEnabled = TRUE;
view.backgroundColor = [UIColor whiteColor];

view.layer.cornerRadius = 19;
[self addSubview:view];
}


        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
        [panRecognizer setMinimumNumberOfTouches:1];
        [panRecognizer setDelegate:self];
        [view addGestureRecognizer:panRecognizer];
        [panRecognizer release];


UILongPressGestureRecognizer *longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(holdToHide:)];
[longPressRecognizer setMinimumPressDuration:1.25];
 [view addGestureRecognizer:longPressRecognizer];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {        
    return YES;
}


%new
- (void)move:(UIPanGestureRecognizer *)sender {
    CGPoint translatedPoint = [sender translationInView:view];
    CGPoint convertedPoint = [view convertPoint:translatedPoint fromView:view];
    if (sender.state == UIGestureRecognizerStateBegan) {
        dragOffsetX = view.center.x - convertedPoint.x;
        dragOffsetY = view.center.y - convertedPoint.y;
    }
    view.center = CGPointMake(convertedPoint.x+dragOffsetX,convertedPoint.y+dragOffsetY);
}


%new
- (void)holdToHide:(UILongPressGestureRecognizer *)recognizer 
{
NSLog(@"---Remove Button---");
view.hidden = YES;
}


%end