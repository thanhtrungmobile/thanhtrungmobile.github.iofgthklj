@interface PSTableCell : UIView
@property (nonatomic, assign, readwrite, setter=_setCornerRadius:) CGFloat _cornerRadius;
@end

%hook PSTableCell
-(void) layoutSubviews {
%orig;

[self _setCornerRadius:13.5];
}
%end