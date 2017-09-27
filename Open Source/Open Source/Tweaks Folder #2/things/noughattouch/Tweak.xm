%hook CyteApplication
-(void) createDynamicShotcutItems {
%orig;

UIApplicationShortcutIcon * photoIcon = [UIApplicationShortcutIcon iconWithTemplateImageName: @"selfie-100.png"]; // your customize icon
UIApplicationShortcutItem * photoItem = [[UIApplicationShortcutItem alloc]initWithType: @"selfie" localizedTitle: @"take selfie" localizedSubtitle: nil icon: photoIcon userInfo: nil];
UIApplicationShortcutItem * videoItem = [[UIApplicationShortcutItem alloc]initWithType: @"video" localizedTitle: @"take video" localizedSubtitle: nil icon: [UIApplicationShortcutIcon iconWithType: UIApplicationShortcutIconTypeCaptureVideo] userInfo: nil];

[UIApplication sharedApplication].shortcutItems = @[photoItem,videoItem];
}
%end