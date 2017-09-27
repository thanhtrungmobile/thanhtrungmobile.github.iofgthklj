@interface CCUIControlCenterPageControl
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

%hook CCUIControlCenterPageControl 
-(void) layoutSubviews {
self.hidden = YES;
}
%end