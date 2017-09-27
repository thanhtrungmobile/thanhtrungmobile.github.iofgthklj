//
// Private APIs
//

@interface CKUITheme : NSObject
@end

@interface CKUIThemeDark : CKUITheme
@end

@interface CKUIBehavior : NSObject
- (id)theme;
@end

@interface CKUIBehaviorPhone : CKUIBehavior
@end

@interface CKUIBehaviorPad : CKUIBehavior
@end

@interface CKAvatarNavigationBar : UINavigationBar
- (void)_setBarStyle:(int)style;
@property (nonatomic, strong, readwrite) UIColor *barTintColor;
@end

@interface CKAvatarContactNameCollectionReusableView : UICollectionReusableView
- (void)setStyle:(int)style;
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface CKAvatarTitleCollectionReusableView : UICollectionReusableView
- (void)setStyle:(int)arg1;
@end

@interface CKNavigationBarCanvasView : UIView
- (void)setTitleView:(id)titleView;
@end

@interface CKDetailsContactsTableViewCell : UITableViewCell
- (UILabel *)nameLabel;
@end

@interface UINavigationButton
@property (nonatomic, strong, readwrite) UIColor *tintColor;
@end