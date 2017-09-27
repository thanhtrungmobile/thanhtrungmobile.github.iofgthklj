#import "Bits.h"
#include <UIKit/UIKit.h>


@protocol CCUIControlCenterObserver
- (void)controlCenterDidFinishTransition;
- (void)controlCenterWillBeginTransition;
- (void)controlCenterDidDismiss;
- (void)controlCenterWillPresent;

@optional
- (void)controlCenterWillFinishTransitionOpen:(BOOL)arg1 withDuration:(NSTimeInterval)arg2;
@end

@protocol CCUIControlCenterPageContentProviding, CCUIControlCenterSystemAgent;
@protocol CCUIControlCenterPageContentViewControllerDelegate
- (void)endSuppressingPunchOutMaskCachingForReason:(NSString *)arg1;
- (void)beginSuppressingPunchOutMaskCachingForReason:(NSString *)arg1;
- (void)visibilityPreferenceChangedForContentViewController:(UIViewController<CCUIControlCenterPageContentProviding> *)arg1;
- (long long)layoutStyle;
- (id <CCUIControlCenterSystemAgent>)controlCenterSystemAgent;
- (void)contentViewControllerWantsDismissal:(UIViewController<CCUIControlCenterPageContentProviding> *)arg1;
@end

@protocol CCUIControlCenterPageContentProviding <CCUIControlCenterObserver>
@property (nonatomic, assign) id <CCUIControlCenterPageContentViewControllerDelegate> delegate;

@optional
@property(readonly, nonatomic) BOOL wantsVisible;
@property(readonly, nonatomic) struct UIEdgeInsets contentInsets;
- (void)controlCenterDidScrollToThisPage:(BOOL)arg1;
- (BOOL)dismissModalFullScreenIfNeeded;
@end

@interface CCUIControlCenterPagePlatterView : UIView

@property(retain, nonatomic) UIView *contentView;

@end

@interface CCUIControlCenterPageContainerViewController : UIViewController
@property(readonly, nonatomic) UIViewController<CCUIControlCenterPageContentProviding> *contentViewController;
@end

@class CCUIControlCenterButton;

@protocol CCUIControlCenterButtonDelegate
- (BOOL)isInternal;
- (void)buttonTapped:(CCUIControlCenterButton *)arg1;

@optional
- (void)button:(CCUIControlCenterButton *)arg1 didChangeState:(long long)arg2;
@end

@class FBSceneHostWrapperView;

@class CCUIControlCenterContainerView;
@protocol CCUIControlCenterSystemAgent;

@protocol CCUIControlCenterContainerViewDelegate <NSObject>
- (id <CCUIControlCenterSystemAgent>)controlCenterSystemAgent;
- (struct UIEdgeInsets)pageInsetForContainerView:(CCUIControlCenterContainerView *)arg1;
- (struct UIEdgeInsets)marginInsetForContainerView:(CCUIControlCenterContainerView *)arg1;
- (UIPageControl *)pageControlForContainerView:(CCUIControlCenterContainerView *)arg1;
- (UIScrollView *)scrollViewForContainerView:(CCUIControlCenterContainerView *)arg1;
- (NSArray *)pagePlatterViewsForContainerView:(CCUIControlCenterContainerView *)arg1;
- (double)contentHeightForContainerView:(CCUIControlCenterContainerView *)arg1;
@end

@interface CCUIControlCenterContainerView : UIView

@property (nonatomic, assign) id <CCUIControlCenterContainerViewDelegate> delegate;

- (void)_updateMasks;
- (void)_resetControlCenterToOffscreenState;

@end

@interface CCUIBackgroundDarkeningWithPlatterCutoutView : UIView

@property(nonatomic) struct CGRect cutOutRect;

- (id)initWithFrame:(CGRect)arg1 darkeningColor:(id)arg2 platterCornerRadius:(CGFloat)arg3;

@end

@interface CCUIFirstUsePanelViewController: UIViewController <CCUIControlCenterObserver>

- (void)viewDidLoad;
- (void)_tappedContinueButton:(id)arg1;

@end


@protocol CCUIControlCenterButtonDelegate;

@interface CCUIControlCenterButton : UIButton
+ (id)capsuleButtonWithText:(id)arg1;
+ (id)roundRectButton;
+ (id)roundRectButtonWithText:(id)arg1;
+ (id)capsuleButtonWithText:(id)arg1;
- (void)setGlyphImage:(id)arg1 selectedGlyphImage:(id)arg2 name:(id)arg3;
- (long long)_currentState;
- (void)_updateEffects;
- (void)setRoundCorners:(unsigned long long)arg1;

@property (nonatomic, assign) BOOL animatesStateChanges;
@property (nonatomic, assign) id<CCUIControlCenterButtonDelegate> delegate;
@property (nonatomic, retain) NSString *text;

@end

@interface CCUIControlCenterLabel : UILabel

- (void)setStyle:(unsigned long long)arg1;

@end


@interface CCNotesPageViewController : UIViewController <CCUIControlCenterPageContentProviding, UITextViewDelegate>

@property (nonatomic, retain) UIImageView *userImage;

@property (nonatomic, retain) UITextField *usernameText;
@property (nonatomic, retain) UILabel *userName;
@end


@interface CCUIControlCenterViewController : UIViewController
@property (nonatomic, retain) CCNotesPageViewController *notesViewController;
-(void)_addContentViewController:(id)arg1 ;
-(void)_addOrRemovePagesBasedOnVisibility;
- (void)_removeContentViewController:(UIViewController*)arg1;
- (void)_loadPages;
- (id)contentViewControllers;
- (void)_updatePageControl;
- (void)_updateScrollViewContentSize;
- (void)_layoutScrollView;
- (void)controlCenterWillPresent;
- (void)scrollViewDidEndDecelerating:(id)arg1;
- (id)sortedVisibleViewControllers;
- (void)scrollToPage:(unsigned long long)arg1 animated:(BOOL)arg2 withCompletion:(void(^)(BOOL))completion;
- (BOOL)isPresented;
@end

@interface BSAbstractDefaultDomain
@end


@interface CCUIControlCenterDefaults : BSAbstractDefaultDomain

+ (id)standardDefaults;
- (void)setHasAcknowledgedFirstUseAlert:(BOOL)arg1;

@end

@interface HKRingsView : UIView
@end