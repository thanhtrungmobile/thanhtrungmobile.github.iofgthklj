#import <AudioToolbox/AudioToolbox.h>

@interface CCUIControlCenterSlider : UISlider
@end

@interface SBBrightnessController : NSObject
+ (id)sharedBrightnessController;
- (void)setBrightnessLevel:(float)arg1;
@end

@interface VolumeControl : NSObject
+ (id)sharedVolumeControl;
- (void)setMediaVolume:(float)arg1;
@end



#define PreferencesChangedNotification "com.antique.taptapcclight.settingschanged"
#define PreferencesFilePath @"/var/mobile/Library/Preferences/com.antique.taptapcclight.plist"

inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath] valueForKey:key] boolValue];
}

static NSDictionary* preferences;
CGFloat deltaUp = 1.0;
CGFloat deltaDown = 1.0;
NSObject * minObj = [NSObject new];
NSObject * maxObj = [NSObject new];

static void updatePrefs() {
  preferences = [[NSDictionary alloc] initWithContentsOfFile:PreferencesFilePath];
  if([preferences valueForKey:@"delta"])
    deltaUp = [[preferences valueForKey:@"delta"] floatValue];
  if([preferences valueForKey:@"deltaDown"])
    deltaDown = [[preferences valueForKey:@"deltaDown"] floatValue];
}

static void PreferencesChangedCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
  updatePrefs();
}

extern "C" void AudioServicesPlaySystemSoundWithVibration(SystemSoundID inSystemSoundID, id unknown, NSDictionary *options);
void hapticPeekVibe() {
        NSMutableDictionary* VibrationDictionary = [NSMutableDictionary dictionary];
        NSMutableArray* VibrationArray = [NSMutableArray array];
        [VibrationArray addObject:[NSNumber numberWithBool:YES]];
        [VibrationArray addObject:[NSNumber numberWithInt:20]];
        [VibrationDictionary setObject:VibrationArray forKey:@"VibePattern"];
        [VibrationDictionary setObject:[NSNumber numberWithInt:1] forKey:@"Intensity"];
        AudioServicesPlaySystemSoundWithVibration(4095,nil,VibrationDictionary);
}