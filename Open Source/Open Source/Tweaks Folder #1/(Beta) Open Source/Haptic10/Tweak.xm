#import <AudioToolbox/AudioToolbox.h>
#import <UIKit/UIKit.h>

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.haptic10.plist"

inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

extern "C" void AudioServicesPlaySystemSoundWithVibration(SystemSoundID inSystemSoundID, id unknown, NSDictionary *options);

void hapticPopVibe(){
        NSMutableDictionary* VibrationDictionary = [NSMutableDictionary dictionary];
        NSMutableArray* VibrationArray = [NSMutableArray array ];
        [VibrationArray addObject:[NSNumber numberWithBool:YES]];
        [VibrationArray addObject:[NSNumber numberWithInt:2]]; //vibrate for 50ms
        [VibrationDictionary setObject:VibrationArray forKey:@"VibePattern"];
        [VibrationDictionary setObject:[NSNumber numberWithInt:2] forKey:@"Intensity"];
        AudioServicesPlaySystemSoundWithVibration(4095,nil,VibrationDictionary);
}

%hook SpringBoard
- (void)_menuButtonDown:(struct __IOHIDEvent *)arg1 {
if(GetPrefBool(@"HomeVibrate")) {
hapticPopVibe();
} return %orig;
}

- (BOOL)_volumeChanged:(struct __IOHIDEvent *)arg1 {
if(GetPrefBool(@"VolumeVibrate")) {
hapticPopVibe();
} return %orig;
}
%end