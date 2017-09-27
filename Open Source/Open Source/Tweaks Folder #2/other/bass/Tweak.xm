#import <SpringBoard/SpringBoard.h>
#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVAudioPlayer.h>

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define Bass10 @"/System/Library/Audio/UISounds/connect_power.caf"
#define Bass @"/System/Library/Audio/UISounds/bassdrop.caf"

NSURL *bass10url = [NSURL fileURLWithPath:[NSString stringWithFormat:Bass10]];
NSURL *bassurl = [NSURL fileURLWithPath:[NSString stringWithFormat:Bass]];

%hook SBUIController
-(void)playConnectedToPowerSoundIfNecessary {
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.antique.bassdrop.plist"];

    NSString *currentSound = [prefs objectForKey:@"currentSound"];
    if ([currentSound length] > 3) { currentSound = [currentSound substringToIndex:[currentSound length] - 4]; }
    NSString *mySoundPath = [[NSBundle bundleWithPath:@"/Library/Application Support/BassDrop/Sounds/"] pathForResource:currentSound ofType:@"caf"];
    NSURL *mySoundURL = [[NSURL alloc] initFileURLWithPath:mySoundPath];

    BOOL enabled = [[prefs objectForKey:@"enabled"] boolValue];
    BOOL sound = [[prefs objectForKey:@"sound"] boolValue];
    BOOL custom = [[prefs objectForKey:@"custom"] boolValue];
    BOOL vibration = [[prefs objectForKey:@"vibration"] boolValue];

    AVAudioPlayer *audioPlayer;

    if (enabled) {
        if (sound) {
            if (!custom) {
                if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.0")) {
                audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:bass10url error:nil];
                audioPlayer.numberOfLoops = 0;
                audioPlayer.volume = 1.0;
                [audioPlayer play];
            } else {
                audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:bassurl error:nil];
                audioPlayer.numberOfLoops = 0;
                audioPlayer.volume = 1.0;
                [audioPlayer play];
   }
}

        else if (custom) {
            audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:mySoundURL error:nil];
                audioPlayer.numberOfLoops = 0;
                audioPlayer.volume = 1.0;
                [audioPlayer play];
   }
}

        if (vibration) {
AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            [NSThread sleepForTimeInterval:0.5];
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
   }
}

    else if (!enabled) {
                if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.0")) {
                audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:bass10url error:nil];
                audioPlayer.numberOfLoops = 0;
                audioPlayer.volume = 1.0;
                [audioPlayer play];
            } else {
                audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:bassurl error:nil];
                audioPlayer.numberOfLoops = 0;
                audioPlayer.volume = 1.0;
                [audioPlayer play];
}

AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        [NSThread sleepForTimeInterval:0.5];
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
}

-(void) ACPowerChanged {
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.antique.bassdrop.plist"];

    BOOL enabled = [[prefs objectForKey:@"enabled"] boolValue];
    BOOL screen = [[prefs objectForKey:@"screen"] boolValue];

    if (enabled) {
        if (screen) {
        }

        else if (!screen) {
        %orig;
        }
    }

    else if (!enabled) {
        %orig;
    }
}
%end