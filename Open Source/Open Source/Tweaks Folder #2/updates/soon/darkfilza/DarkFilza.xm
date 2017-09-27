@interface ICTextView : UIView
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

%hook ICTextView
-(void) layoutSubviews {
      %orig;

self.backgroundColor = [UIColor darkGrayColor];
}
%end