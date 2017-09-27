@interface UIApplication (SierraOS)
+(id) sharedApplication;
-(BOOL) launchApplicationWithIdentifier:(id)arg1 suspended:(BOOL)arg2;
@end

@interface UICollectionView (SierraOS)
@property(nonatomic, getter=isPrefetchingEnabled) BOOL prefetchingEnabled;
@end

@interface SBRootFolderView : UIView
@end
UIView *window;
UIImageView *wallpaper;
    
UIView *dockBase;
UIBlurEffect *dockBlur;
UIVisualEffectView *dockBlurView;

UIImageView *finder;
UIButton *finderButton;

UIView *finderBase;
UIScrollView *viewBase;
UIView *topBar;
UIButton *closeButton;
UILabel *viewLabel;
UITableView *tableView;

UIStackView *firstRow;
UIStackView *secondRow;
UIStackView *thirdRow;
UIStackView *fourthRow;
UIStackView *fifthRow;


UIImageView *appStore;
UIButton *appStoreButton;

UIImageView *bridgeApp;
UIButton *bridgeAppButton;

UIImageView *calculatorApp;
UIButton *calculatorAppButton;

UIImageView *cameraApp;
UIButton *cameraAppButton;

UIImageView *compassApp;
UIButton *compassAppButton;

UIImageView *contactsApp;
UIButton *contactsAppButton;

UIImageView *facetimeApp;
UIButton *facetimeAppButton;

UIImageView *findMyFriendsApp;
UIButton *findMyFriendsAppButton;

UIImageView *findMyiPhoneApp;
UIButton *findMyiPhoneAppButton;

UIImageView *fitnessApp;
UIButton *fitnessAppButton;

UIImageView *healthApp;
UIButton *healthAppButton;

UIImageView *homeApp;
UIButton *homeAppButton;

UIImageView *mapsApp;
UIButton *mapsAppButton;

UIImageView *calendarApp;
UIButton *calendarAppButton;

UIImageView *mailApp;
UIButton *mailAppButton;

UIImageView *notesApp;
UIButton *notesAppButton;

UIImageView *phoneApp;
UIButton *phoneAppButton;

UIImageView *smsApp;
UIButton *smsAppButton;

UIImageView *safariApp;
UIButton *safariAppButton;

UIImageView *photosApp;
UIButton *photosAppButton;

       

@interface SBFolderContainerView : UIView <UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@end