@interface SKUICollectionView 
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface SKUIShelfCollectionViewCell
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface SKUIAttributedStringView 
@property (nonatomic, strong, readwrite) UIColor *textColor;
@property (nonatomic, strong, readwrite) UIColor *treatmentColor;
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface UINavigationButton
@property (nonatomic, strong, readwrite) UIColor *tintColor;
@end



%hook SKUICollectionView
-(void) layoutSubviews {
%orig;
self.backgroundColor = [UIColor blackColor];
}
%end

%hook SKUIShelfCollectionViewCell
-(void) layoutSubviews {
%orig;
self.backgroundColor = [UIColor blackColor];
}
%end

%hook UICollectionView
-(void) layoutSubviews {
%orig;
self.backgroundColor = [UIColor blackColor];
}
%end

%hook SKUIAttributedStringView
-(void) setTextColor:(id)arg1 {
arg1 = [UIColor whiteColor];
%orig(arg1);
}
-(void) setTextColorFollowsTintColor:(BOOL)arg1 {
 %orig(TRUE);
}
%end

%hook UINavigationBar
-(void) layoutSubviews {
%orig;
self.barTintColor = [UIColor blackColor];
}
%end

%hook UINavigationButton
-(void) layoutSubviews {
%orig;
self.tintColor = [UIColor whiteColor];;
}
%end

%hook UILabel
-(void) setTextColor:(id)arg1 {
arg1 = [UIColor whiteColor];
%orig(arg1);
}
-(void)_setTextColor:(id)arg1 {
arg1 = [UIColor whiteColor];
%orig(arg1);
}
%end