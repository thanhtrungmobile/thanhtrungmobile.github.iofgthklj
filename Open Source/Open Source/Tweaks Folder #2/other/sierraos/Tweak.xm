#import "Bits.h"

%hook SBFolderContainerView
-(void) layoutSubviews {
       %orig;

if(!window) {
window = [[UIView alloc] initWithFrame:self.bounds];
[window setBackgroundColor:[UIColor whiteColor]];
[self addSubview:window];
}

if(!wallpaper) {
wallpaper = [[UIImageView alloc] initWithFrame:window.bounds];
wallpaper.userInteractionEnabled = YES;
  wallpaper.image = [UIImage imageWithContentsOfFile:@"/Library/Application Support/SierraOS/wallpaper.png"];
  [window addSubview:wallpaper];
}


if(!dockBase) {
dockBase = [[UIView alloc] initWithFrame:CGRectMake(8, [[UIScreen mainScreen] bounds].size.height - 58, [[UIScreen mainScreen] bounds].size.width - 16, 50)];
dockBase.userInteractionEnabled = YES;
dockBase.layer.cornerRadius = 13.5;
dockBase.layer.masksToBounds = YES;
dockBase.backgroundColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:0.4];
[wallpaper addSubview:dockBase];
}

if(!dockBlur) {
dockBlur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
}

if(!dockBlurView) {
dockBlurView = [[UIVisualEffectView alloc] initWithEffect:dockBlur];
dockBlurView.alpha = 0.30;
dockBlurView.userInteractionEnabled = YES;

dockBlurView.frame = dockBase.bounds;
[dockBase addSubview:dockBlurView];
}


if(!finder) {
finder = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
[finder setCenter:CGPointMake(dockBase.bounds.size.width/2, dockBase.bounds.size.height/2)];
finder.userInteractionEnabled = YES;

  finder.image = [UIImage imageWithContentsOfFile:@"/Library/Application Support/SierraOS/finder.png"];
  [dockBase addSubview:finder];
}

if(!finderButton) {
finderButton = [UIButton buttonWithType:UIButtonTypeCustom];
finderButton.userInteractionEnabled = YES;
[finderButton addTarget:self 
           action:@selector(openFinder:)
 forControlEvents:UIControlEventTouchUpInside];
[finderButton setTitle:@"" forState:UIControlStateNormal];
finderButton.frame = finder.bounds;
[finder addSubview:finderButton];
}



/* FINDER */
if(!finderBase) {
finderBase = [[UIView alloc] initWithFrame:CGRectMake(8, 28, self.bounds.size.width - 16, 298)];
finderBase.layer.cornerRadius = 10;
    [finderBase setBackgroundColor:[UIColor colorWithRed:242/255.0f green:238/255.0f blue:245/255.0f alpha:0.48]];
finderBase.hidden = YES;
finderBase.layer.masksToBounds = YES;
finderBase.userInteractionEnabled = YES;
[wallpaper addSubview:finderBase];
}

if(!viewBase) {
viewBase = [[UIScrollView alloc] initWithFrame:CGRectMake(110, 52, finderBase.bounds.size.width - 110, finderBase.bounds.size.height - 52)]; 
     viewBase.showsVerticalScrollIndicator = YES;
     viewBase.scrollEnabled = YES;
    viewBase.userInteractionEnabled = YES;
    [finderBase addSubview:viewBase];
     viewBase.contentSize = CGSizeMake(finderBase.bounds.size.width - 110, finderBase.bounds.size.height - 52 +38);
     [viewBase release];
}

if(!firstRow) {
firstRow = [[UIStackView alloc] initWithFrame:CGRectMake(18, 9, viewBase.bounds.size.width - 36, 60)];

    firstRow.axis = UILayoutConstraintAxisHorizontal;
    firstRow.distribution = UIStackViewDistributionEqualSpacing;
    firstRow.alignment = UIStackViewAlignmentCenter;

    firstRow.spacing = 5;
[viewBase addSubview:firstRow];
}

if(!secondRow) {
secondRow = [[UIStackView alloc] initWithFrame:CGRectMake(18, 9 + firstRow.bounds.size.height + 2, viewBase.bounds.size.width - 36, 60)];

    secondRow.axis = UILayoutConstraintAxisHorizontal;
    secondRow.distribution = UIStackViewDistributionEqualSpacing;
    secondRow.alignment = UIStackViewAlignmentCenter;

    secondRow.spacing = 5;
[viewBase addSubview:secondRow];
}

if(!thirdRow) {
thirdRow = [[UIStackView alloc] initWithFrame:CGRectMake(18, 9 + firstRow.bounds.size.height + secondRow.bounds.size.height + 2, viewBase.bounds.size.width - 36, 60)];

    thirdRow.axis = UILayoutConstraintAxisHorizontal;
    thirdRow.distribution = UIStackViewDistributionEqualSpacing;
    thirdRow.alignment = UIStackViewAlignmentCenter;

    thirdRow.spacing = 5;
[viewBase addSubview:thirdRow];
}

if(!fourthRow) {
fourthRow = [[UIStackView alloc] initWithFrame:CGRectMake(18, 9 + firstRow.bounds.size.height + secondRow.bounds.size.height + thirdRow.bounds.size.height + 2, viewBase.bounds.size.width - 36, 60)];

    fourthRow.axis = UILayoutConstraintAxisHorizontal;
    fourthRow.distribution = UIStackViewDistributionEqualSpacing;
    fourthRow.alignment = UIStackViewAlignmentCenter;

    fourthRow.spacing = 5;
[viewBase addSubview:fourthRow];
}


if(!tableView) {
tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 52, 110, finderBase.bounds.size.height - 52)];
tableView.rowHeight = 30.0;

[finderBase addSubview:tableView];
}

if(!topBar) {
topBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width - 8, 52)];
    [topBar setBackgroundColor:[UIColor colorWithRed:242/255.0f green:238/255.0f blue:245/255.0f alpha:0.70]];
[finderBase addSubview:topBar];
}

if(!viewLabel) {
viewLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 22)];
viewLabel.center = CGPointMake(topBar.bounds.size.width / 2, 8);
viewLabel.text = @"Applications";
[viewLabel setFont:[UIFont systemFontOfSize:12]];
viewLabel.textAlignment = NSTextAlignmentCenter;
[topBar addSubview:viewLabel];
}

CAShapeLayer *close = [CAShapeLayer layer];
[close setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(5, 5, 12, 12)] CGPath]];
[close setFillColor:[[UIColor redColor] CGColor]];

CAShapeLayer *mini = [CAShapeLayer layer];
[mini setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(23, 5, 12, 12)] CGPath]];
[mini setFillColor:[[UIColor orangeColor] CGColor]];

CAShapeLayer *big = [CAShapeLayer layer];
[big setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(41, 5, 12, 12)] CGPath]];
[big setFillColor:[[UIColor colorWithRed:36/255.0 green:216/255.0 blue:48/255.0 alpha:1.0] CGColor]];


CAShapeLayer *control = [CAShapeLayer layer];
[control setPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(5, 22, 48, 24) cornerRadius:5.5] CGPath]];
[control setFillColor:[[UIColor whiteColor] CGColor]];


    CAShapeLayer *line = [CAShapeLayer layer];
    UIBezierPath *linePath=[UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(29.25, 22)];
    [linePath addLineToPoint:CGPointMake(29.25, 46)];
    line.path=linePath.CGPath;
    line.fillColor = nil;
    line.opacity = 1.0;
    line.strokeColor = [UIColor lightGrayColor].CGColor;
    [control addSublayer:line];

[[topBar layer] addSublayer:close];
[[topBar layer] addSublayer:mini];
[[topBar layer] addSublayer:big];
[[topBar layer] addSublayer:control];


if(!closeButton) {
closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
closeButton.userInteractionEnabled = YES;
[closeButton addTarget:self 
           action:@selector(closeFinder:)
 forControlEvents:UIControlEventTouchUpInside];
[closeButton setTitle:@"" forState:UIControlStateNormal];
closeButton.frame = CGRectMake(5, 5, 12, 12);
[topBar addSubview:closeButton];
}



if(!appStore) {
appStore = [[UIImageView alloc] initWithFrame:CGRectMake(viewBase.bounds.size.width - viewBase.bounds.size.width + 12, 12, 60, 60)];
appStore.userInteractionEnabled = YES;
appStore.layer.cornerRadius = 12;
appStore.layer.masksToBounds = YES;
appStore.clipsToBounds = YES;
  appStore.image = [UIImage imageWithContentsOfFile:@"/Applications/AppStore.app/AppIcon40x40@2x.png"];
// [viewBase addSubview:appStore];
}

if(!appStoreButton) {
appStoreButton = [UIButton buttonWithType:UIButtonTypeCustom];
appStoreButton.userInteractionEnabled = YES;
[appStoreButton addTarget:self 
           action:@selector(openAppStore:)
 forControlEvents:UIControlEventTouchUpInside];
[appStoreButton setTitle:@"" forState:UIControlStateNormal];
appStoreButton.frame = appStore.bounds;
[appStore addSubview:appStoreButton];
}


if(!bridgeApp) {
bridgeApp = [[UIImageView alloc] initWithFrame:CGRectMake(viewBase.bounds.size.width - viewBase.bounds.size.width + 82, 12, 60, 60)];
bridgeApp.userInteractionEnabled = YES;
bridgeApp.layer.cornerRadius = 12.0;
bridgeApp.layer.masksToBounds = YES;
bridgeApp.clipsToBounds = YES;
  bridgeApp.image = [UIImage imageWithContentsOfFile:@"/Applications/Bridge.app/AppIcon40x40@2x.png"];
// [viewBase addSubview:bridgeApp];
}

if(!bridgeAppButton) {
bridgeAppButton = [UIButton buttonWithType:UIButtonTypeCustom];
bridgeAppButton.userInteractionEnabled = YES;
[bridgeAppButton addTarget:self 
           action:@selector(openBridgeApp:)
 forControlEvents:UIControlEventTouchUpInside];
[bridgeAppButton setTitle:@"" forState:UIControlStateNormal];
bridgeAppButton.frame = bridgeApp.bounds;
[bridgeApp addSubview:bridgeAppButton];
}


if(!calculatorApp) {
calculatorApp = [[UIImageView alloc] initWithFrame:CGRectMake(viewBase.bounds.size.width - viewBase.bounds.size.width + 152, 12, 60, 60)];
calculatorApp.userInteractionEnabled = YES;
calculatorApp.layer.cornerRadius = 12.0;
calculatorApp.layer.masksToBounds = YES;
calculatorApp.clipsToBounds = YES;
  calculatorApp.image = [UIImage imageWithContentsOfFile:@"/Applications/Calculator.app/icon-about@2x.png"];
// [viewBase addSubview:calculatorApp];
}

if(!calculatorAppButton) {
calculatorAppButton = [UIButton buttonWithType:UIButtonTypeCustom];
calculatorAppButton.userInteractionEnabled = YES;
[calculatorAppButton addTarget:self 
           action:@selector(openCalculatorApp:)
 forControlEvents:UIControlEventTouchUpInside];
[calculatorAppButton setTitle:@"" forState:UIControlStateNormal];
calculatorAppButton.frame = calculatorApp.bounds;
[calculatorApp addSubview:calculatorAppButton];
}


if(!cameraApp) {
cameraApp = [[UIImageView alloc] initWithFrame:CGRectMake(viewBase.bounds.size.width - viewBase.bounds.size.width + 222, 12, 60, 60)];
cameraApp.userInteractionEnabled = YES;
cameraApp.layer.cornerRadius = 12.0;
cameraApp.layer.masksToBounds = YES;
cameraApp.clipsToBounds = YES;
  cameraApp.image = [UIImage imageWithContentsOfFile:@"/Applications/Camera.app/AppIcon40x40@2x.png"];
// [viewBase addSubview:cameraApp];
}

if(!cameraAppButton) {
cameraAppButton = [UIButton buttonWithType:UIButtonTypeCustom];
cameraAppButton.userInteractionEnabled = YES;
[cameraAppButton addTarget:self 
           action:@selector(openCameraApp:)
 forControlEvents:UIControlEventTouchUpInside];
[cameraAppButton setTitle:@"" forState:UIControlStateNormal];
cameraAppButton.frame = cameraApp.bounds;
[cameraApp addSubview:cameraAppButton];
}


if(!compassApp) {
compassApp = [[UIImageView alloc] initWithFrame:CGRectMake(viewBase.bounds.size.width - viewBase.bounds.size.width + 12, 76.5, 52.5, 52.5)];
compassApp.userInteractionEnabled = YES;
compassApp.layer.cornerRadius = 12.0;
compassApp.layer.masksToBounds = YES;
compassApp.clipsToBounds = YES;
  compassApp.image = [UIImage imageWithContentsOfFile:@"/Applications/Compass.app/AppIcon40x40@2x.png"];
  // [viewBase addSubview:compassApp];
}

if(!compassAppButton) {
compassAppButton = [UIButton buttonWithType:UIButtonTypeCustom];
compassAppButton.userInteractionEnabled = YES;
[compassAppButton addTarget:self 
           action:@selector(openCompassApp:)
 forControlEvents:UIControlEventTouchUpInside];
[compassAppButton setTitle:@"" forState:UIControlStateNormal];
compassAppButton.frame = compassApp.bounds;
[compassApp addSubview:compassAppButton];
}


if(!contactsApp) {
contactsApp = [[UIImageView alloc] initWithFrame:CGRectMake(viewBase.bounds.size.width - viewBase.bounds.size.width + 82, 76.5, 52.5, 52.5)];
contactsApp.userInteractionEnabled = YES;
contactsApp.layer.cornerRadius = 12.0;
contactsApp.layer.masksToBounds = YES;
contactsApp.clipsToBounds = YES;
  contactsApp.image = [UIImage imageWithContentsOfFile:@"/Applications/Contacts.app/AppIcon40x40@2x.png"];
  // [viewBase addSubview:contactsApp];
}

if(!contactsAppButton) {
contactsAppButton = [UIButton buttonWithType:UIButtonTypeCustom];
contactsAppButton.userInteractionEnabled = YES;
[contactsAppButton addTarget:self 
           action:@selector(openContactsApp:)
 forControlEvents:UIControlEventTouchUpInside];
[contactsAppButton setTitle:@"" forState:UIControlStateNormal];
contactsAppButton.frame = contactsApp.bounds;
[contactsApp addSubview:contactsAppButton];
}


if(!facetimeApp) {
facetimeApp = [[UIImageView alloc] initWithFrame:CGRectMake(viewBase.bounds.size.width - viewBase.bounds.size.width + 152, 76.5, 52.5, 52.5)];
facetimeApp.userInteractionEnabled = YES;
facetimeApp.layer.cornerRadius = 12.0;
facetimeApp.layer.masksToBounds = YES;
facetimeApp.clipsToBounds = YES;
  facetimeApp.image = [UIImage imageWithContentsOfFile:@"/Applications/FaceTime.app/AppIcon40x40@2x.png"];
  // [viewBase addSubview:facetimeApp];
}

if(!facetimeAppButton) {
facetimeAppButton = [UIButton buttonWithType:UIButtonTypeCustom];
facetimeAppButton.userInteractionEnabled = YES;
[facetimeAppButton addTarget:self 
           action:@selector(openFacetimeApp:)
 forControlEvents:UIControlEventTouchUpInside];
[facetimeAppButton setTitle:@"" forState:UIControlStateNormal];
facetimeAppButton.frame = facetimeApp.bounds;
[facetimeApp addSubview:facetimeAppButton];
}


if(!findMyFriendsApp) {
findMyFriendsApp = [[UIImageView alloc] initWithFrame:CGRectMake(viewBase.bounds.size.width - viewBase.bounds.size.width + 222, 76.5, 52.5, 52.5)];
findMyFriendsApp.userInteractionEnabled = YES;
findMyFriendsApp.layer.cornerRadius = 12.0;
findMyFriendsApp.layer.masksToBounds = YES;
findMyFriendsApp.clipsToBounds = YES;
  findMyFriendsApp.image = [UIImage imageWithContentsOfFile:@"/Applications/FindMyFriends.app/AppIcon40x40@2x.png"];
  // [viewBase addSubview:findMyFriendsApp];
}

if(!findMyFriendsAppButton) {
findMyFriendsAppButton = [UIButton buttonWithType:UIButtonTypeCustom];
findMyFriendsAppButton.userInteractionEnabled = YES;
[findMyFriendsAppButton addTarget:self 
           action:@selector(openFindMyFriendsApp:)
 forControlEvents:UIControlEventTouchUpInside];
[findMyFriendsAppButton setTitle:@"" forState:UIControlStateNormal];
findMyFriendsAppButton.frame = findMyFriendsApp.bounds;
[findMyFriendsApp addSubview:findMyFriendsAppButton];
}


if(!findMyiPhoneApp) {
findMyiPhoneApp = [[UIImageView alloc] initWithFrame:CGRectMake(viewBase.bounds.size.width - viewBase.bounds.size.width + 12, 141, 52.5, 52.5)];
findMyiPhoneApp.userInteractionEnabled = YES;
findMyiPhoneApp.layer.cornerRadius = 12.0;
findMyiPhoneApp.layer.masksToBounds = YES;
findMyiPhoneApp.clipsToBounds = YES;
  findMyiPhoneApp.image = [UIImage imageWithContentsOfFile:@"/Applications/FindMyiPhone.app/AppIcon40x40@2x.png"];
  // [viewBase addSubview:findMyiPhoneApp];
}

if(!findMyiPhoneAppButton) {
findMyiPhoneAppButton = [UIButton buttonWithType:UIButtonTypeCustom];
findMyiPhoneAppButton.userInteractionEnabled = YES;
[findMyiPhoneAppButton addTarget:self 
           action:@selector(openFindMyiPhoneApp:)
 forControlEvents:UIControlEventTouchUpInside];
[findMyiPhoneAppButton setTitle:@"" forState:UIControlStateNormal];
findMyiPhoneAppButton.frame = findMyiPhoneApp.bounds;
[findMyiPhoneApp addSubview:findMyiPhoneAppButton];
}


if(!fitnessApp) {
fitnessApp = [[UIImageView alloc] initWithFrame:CGRectMake(viewBase.bounds.size.width - viewBase.bounds.size.width + 82, 141, 52.5, 52.5)];
fitnessApp.userInteractionEnabled = YES;
fitnessApp.layer.cornerRadius = 12.0;
fitnessApp.layer.masksToBounds = YES;
fitnessApp.clipsToBounds = YES;
  fitnessApp.image = [UIImage imageWithContentsOfFile:@"/Library/Application Support/SierraOS/fitness@2x.png"];
[fitnessApp setContentMode:UIViewContentModeCenter];
  // [viewBase addSubview:fitnessApp];
}

if(!fitnessAppButton) {
fitnessAppButton = [UIButton buttonWithType:UIButtonTypeCustom];
fitnessAppButton.userInteractionEnabled = YES;
[fitnessAppButton addTarget:self 
           action:@selector(openFitnessApp:)
 forControlEvents:UIControlEventTouchUpInside];
[fitnessAppButton setTitle:@"" forState:UIControlStateNormal];
fitnessAppButton.frame = fitnessApp.bounds;
[fitnessApp addSubview:fitnessAppButton];
}


if(!healthApp) {
healthApp = [[UIImageView alloc] initWithFrame:CGRectMake(viewBase.bounds.size.width - viewBase.bounds.size.width + 152, 141, 52.5, 52.5)];
healthApp.userInteractionEnabled = YES;
healthApp.layer.cornerRadius = 12.0;
healthApp.layer.masksToBounds = YES;
healthApp.clipsToBounds = YES;
  healthApp.image = [UIImage imageWithContentsOfFile:@"/Applications/Health.app/AppIcon40x40@2x.png"];
  // [viewBase addSubview:healthApp];
}

if(!healthAppButton) {
healthAppButton = [UIButton buttonWithType:UIButtonTypeCustom];
healthAppButton.userInteractionEnabled = YES;
[healthAppButton addTarget:self 
           action:@selector(openHealthApp:)
 forControlEvents:UIControlEventTouchUpInside];
[healthAppButton setTitle:@"" forState:UIControlStateNormal];
healthAppButton.frame = healthApp.bounds;
[healthApp addSubview:healthAppButton];
}


if(!homeApp) {
homeApp = [[UIImageView alloc] initWithFrame:CGRectMake(viewBase.bounds.size.width - viewBase.bounds.size.width + 222, 141, 52.5, 52.5)];
homeApp.userInteractionEnabled = YES;
homeApp.layer.cornerRadius = 12.0;
homeApp.layer.masksToBounds = YES;
homeApp.clipsToBounds = YES;
  homeApp.image = [UIImage imageWithContentsOfFile:@"/Applications/Home.app/AppIcon40x40@2x.png"];
  // [viewBase addSubview:homeApp];
}

if(!homeAppButton) {
homeAppButton = [UIButton buttonWithType:UIButtonTypeCustom];
homeAppButton.userInteractionEnabled = YES;
[homeAppButton addTarget:self 
           action:@selector(openHomeApp:)
 forControlEvents:UIControlEventTouchUpInside];
[homeAppButton setTitle:@"" forState:UIControlStateNormal];
homeAppButton.frame = homeApp.bounds;
[homeApp addSubview:homeAppButton];
}


if(!mapsApp) {
mapsApp = [[UIImageView alloc] initWithFrame:CGRectMake(viewBase.bounds.size.width - viewBase.bounds.size.width + 222, 141, 52.5, 52.5)];
mapsApp.userInteractionEnabled = YES;
mapsApp.layer.cornerRadius = 12.0;
mapsApp.layer.masksToBounds = YES;
mapsApp.clipsToBounds = YES;
  mapsApp.image = [UIImage imageWithContentsOfFile:@"/Applications/Maps.app/Icon-40.png"];
  // [viewBase addSubview:mapsApp];
}

if(!mapsAppButton) {
mapsAppButton = [UIButton buttonWithType:UIButtonTypeCustom];
mapsAppButton.userInteractionEnabled = YES;
[mapsAppButton addTarget:self 
           action:@selector(openMapsApp:)
 forControlEvents:UIControlEventTouchUpInside];
[mapsAppButton setTitle:@"" forState:UIControlStateNormal];
mapsAppButton.frame = mapsApp.bounds;
[mapsApp addSubview:mapsAppButton];
}


if(!calendarApp) {
calendarApp = [[UIImageView alloc] initWithFrame:CGRectMake(viewBase.bounds.size.width - viewBase.bounds.size.width + 222, 141, 52.5, 52.5)];
calendarApp.userInteractionEnabled = YES;
calendarApp.layer.cornerRadius = 12.0;
calendarApp.layer.masksToBounds = YES;
calendarApp.clipsToBounds = YES;
  calendarApp.image = [UIImage imageWithContentsOfFile:@"/Applications/MobileCal.app/CalendarMonth-40.png"];
  // [viewBase addSubview:calendarApp];
}

if(!calendarAppButton) {
calendarAppButton = [UIButton buttonWithType:UIButtonTypeCustom];
calendarAppButton.userInteractionEnabled = YES;
[calendarAppButton addTarget:self 
           action:@selector(openCalendarApp:)
 forControlEvents:UIControlEventTouchUpInside];
[calendarAppButton setTitle:@"" forState:UIControlStateNormal];
calendarAppButton.frame = calendarApp.bounds;
[calendarApp addSubview:calendarAppButton];
}


if(!mailApp) {
mailApp = [[UIImageView alloc] initWithFrame:CGRectMake(viewBase.bounds.size.width - viewBase.bounds.size.width + 222, 141, 52.5, 52.5)];
mailApp.userInteractionEnabled = YES;
mailApp.layer.cornerRadius = 12.0;
mailApp.layer.masksToBounds = YES;
mailApp.clipsToBounds = YES;
  mailApp.image = [UIImage imageWithContentsOfFile:@"/Applications/MobileMail.app/AppIcon40x40@2x.png"];
  // [viewBase addSubview:calendarApp];
}

if(!mailAppButton) {
mailAppButton = [UIButton buttonWithType:UIButtonTypeCustom];
mailAppButton.userInteractionEnabled = YES;
[mailAppButton addTarget:self 
           action:@selector(openMailApp:)
 forControlEvents:UIControlEventTouchUpInside];
[mailAppButton setTitle:@"" forState:UIControlStateNormal];
mailAppButton.frame = mailApp.bounds;
[mailApp addSubview:mailAppButton];
}


if(!notesApp) {
notesApp = [[UIImageView alloc] initWithFrame:CGRectMake(viewBase.bounds.size.width - viewBase.bounds.size.width + 222, 141, 52.5, 52.5)];
notesApp.userInteractionEnabled = YES;
notesApp.layer.cornerRadius = 12.0;
notesApp.layer.masksToBounds = YES;
notesApp.clipsToBounds = YES;
  notesApp.image = [UIImage imageWithContentsOfFile:@"/Applications/MobileNotes.app/AppIcon40x40@2x.png"];
  // [viewBase addSubview:calendarApp];
}

if(!notesAppButton) {
notesAppButton = [UIButton buttonWithType:UIButtonTypeCustom];
notesAppButton.userInteractionEnabled = YES;
[notesAppButton addTarget:self 
           action:@selector(openNotesApp:)
 forControlEvents:UIControlEventTouchUpInside];
[notesAppButton setTitle:@"" forState:UIControlStateNormal];
notesAppButton.frame = notesApp.bounds;
[notesApp addSubview:notesAppButton];
}




    [firstRow addArrangedSubview:appStore];
    [firstRow addArrangedSubview:bridgeApp];
    [firstRow addArrangedSubview:calculatorApp];
    [firstRow addArrangedSubview:cameraApp];

    [secondRow addArrangedSubview:compassApp];
    [secondRow addArrangedSubview:contactsApp];
    [secondRow addArrangedSubview:facetimeApp];
    [secondRow addArrangedSubview:findMyFriendsApp];

    [thirdRow addArrangedSubview:findMyiPhoneApp];
    [thirdRow addArrangedSubview:fitnessApp];
    [thirdRow addArrangedSubview:healthApp];
    [thirdRow addArrangedSubview:homeApp];

    [fourthRow addArrangedSubview:mapsApp];
    [fourthRow addArrangedSubview:calendarApp];
    [fourthRow addArrangedSubview:mailApp];
    [fourthRow addArrangedSubview:notesApp];

}


%new
-(void) openFinder:(UIButton *)arg1 {
finderBase.hidden = NO;
}

%new
-(void) closeFinder:(UIButton *)arg1 {
finderBase.hidden = YES;
}


%new
-(void) openAppStore:(UIButton *)app {
[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.AppStore" suspended:NO];
}

%new
-(void) openBridgeApp:(UIButton *)app {
[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.Bridge" suspended:NO];
}

%new
-(void) openCalculatorApp:(UIButton *)app {
[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.calculator" suspended:NO];
}

%new
-(void) openCameraApp:(UIButton *)app {
[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.camera" suspended:NO];
}

%new
-(void) openCompassApp:(UIButton *)app {
[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.compass" suspended:NO];
}

%new
-(void) openContactsApp:(UIButton *)app {
[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.MobileAddressBook" suspended:NO];
}

%new
-(void) openFacetimeApp:(UIButton *)app {
[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.facetime" suspended:NO];
}

%new
-(void) openFindMyFriendsApp:(UIButton *)app {
[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.mobileme.fmf1" suspended:NO];
}

%new
-(void) openFindMyiPhoneApp:(UIButton *)app {
[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.mobileme.fmip1" suspended:NO];
}

%new
-(void) openFitnessApp:(UIButton *)app {
[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.Fitness" suspended:NO];
}

%new
-(void) openHealthApp:(UIButton *)app {
[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.Health" suspended:NO];
}

%new
-(void) openHomeApp:(UIButton *)app {
[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.Home" suspended:NO];
}

%new
-(void) openMapsApp:(UIButton *)app {
[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.Maps" suspended:NO];
}

%new
-(void) openCalendarApp:(UIButton *)app {
[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.mobilecal" suspended:NO];
}

%new
-(void) openMailApp:(UIButton *)app {
[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.mobilemail" suspended:NO];
}

%new
-(void) openNotesApp:(UIButton *)app {
[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.mobilenotes" suspended:NO];
}
%end

%hook SBRootFolderView
-(void)_layoutSubviews {
      %orig;
self.hidden = YES;
}
%end