@interface Composite
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end


%group A
%hook Composite
-(void) layoutSubviews {
%orig;

self.backgroundColor = [UIColor blackColor];
}
%end
%end


%ctor {
      %init(A, Composite = objc_getClass("Music.CompositeCollectionView"));
}