#import "libcolorpicker.h"

@interface CCUIControlCenterPagePlatterView : UIView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

@interface CCUIControlCenterPushButton
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface CCUIButtonStackPagingView 
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end


@interface NCMaterialView
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@property (nonatomic, assign, readwrite) CGFloat alpha;
@end

@interface _UIBackdropView
@property (nonatomic, assign, readwrite) CGFloat alpha;
@end