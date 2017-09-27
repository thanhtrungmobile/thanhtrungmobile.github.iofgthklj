#import <MediaPlayer/MediaPlayer.h>

@interface MusicView : UIViewController <MPMediaPickerControllerDelegate>

@property (nonatomic, retain) MPMusicPlayerController *musicPlayer;
@property (nonatomic, retain) UIImageView *artworkImageView;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *artistLabel;



@property (nonatomic, retain) UIButton *playButton;
@property (nonatomic, retain) UIImageView *playImage;
@property (nonatomic, retain) UIImageView *pauseImage;


@property (nonatomic, retain) UIButton *prevButton;
@property (nonatomic, retain) UIImageView *nextImage;

@property (nonatomic, retain) UIButton *nextButton;
@property (nonatomic, retain) UIImageView *prevImage;

- (void) registerMediaPlayerNotifications;
@end