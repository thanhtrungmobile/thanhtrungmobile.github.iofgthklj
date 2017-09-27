#import "MusicView.h"

@implementation MusicView
@synthesize musicPlayer; @synthesize titleLabel;
@synthesize artistLabel;
-(void) viewDidLoad {
       [super viewDidLoad];
musicPlayer = [MPMusicPlayerController systemMusicPlayer];
[self registerMediaPlayerNotifications];

if([musicPlayer playbackState] == MPMusicPlaybackStatePlaying) {
     _playImage.image = [UIImage imageWithContentsOfFile:@"/Library/Application Support/Glimpse/stop.png"];
} else {
      _playImage.image = [UIImage imageWithContentsOfFile:@"/Library/Application Support/Glimpse/play.png"];
}


UIView *base = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - 16, self.view.bounds.size.height - self.view.bounds.size.height / 2.55)];
[self.view addSubview:base];


UIImageView *musicIcon = [[UIImageView alloc] initWithFrame:CGRectMake(5, base.bounds.size.height - 30, 25, 25)];
[musicIcon.layer setCornerRadius:8];
musicIcon.image = [UIImage imageWithContentsOfFile:@"/Applications/Music.app/App Icon40x40@2x.png"];
musicIcon.clipsToBounds = YES;
[base addSubview:musicIcon];


titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 25)];
[titleLabel setCenter:CGPointMake(base.bounds.size.width / 2, base.bounds.size.height / 2 + 98)];
[titleLabel setFont:[UIFont systemFontOfSize:12.5]];
titleLabel.textAlignment = NSTextAlignmentCenter;
titleLabel.textColor = [UIColor blackColor];
[base addSubview:titleLabel];

artistLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
[artistLabel setCenter:CGPointMake(base.bounds.size.width / 2, base.bounds.size.height / 2 + 108)];
[artistLabel setFont:[UIFont systemFontOfSize:8]];
artistLabel.textAlignment = NSTextAlignmentCenter;
artistLabel.textColor = [UIColor blackColor];
[base addSubview:artistLabel];



  _artworkImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280, 280)];
[_artworkImageView setCenter:CGPointMake(base.bounds.size.width / 2, base.bounds.size.height / 2 - 50)];
_artworkImageView.image = [UIImage imageWithContentsOfFile:@"/Applications/Music.app/App Icon60x60@3x.png"];
[_artworkImageView.layer setCornerRadius:13.5];
_artworkImageView.clipsToBounds = YES;
_artworkImageView.userInteractionEnabled = YES;
[base addSubview:_artworkImageView];

  _playImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
_playImage.center = CGPointMake(base.bounds.size.width / 2, base.bounds.size.height - 42);
_playImage.image = [UIImage imageWithContentsOfFile:@"/Library/Application Support/Glimpse/play.png"];
[_playImage.layer setCornerRadius:13.5];
_playImage.clipsToBounds = YES;
_playImage.userInteractionEnabled = YES;
[base addSubview:_playImage];

_playButton = [UIButton buttonWithType:UIButtonTypeCustom];
_playButton.userInteractionEnabled = YES;
[_playButton addTarget:self 
           action:@selector(playMusic:)
 forControlEvents:UIControlEventTouchUpInside];
 [_prevButton setTitle:@"" forState:UIControlStateNormal];
_playButton.frame = _playImage.bounds;
[_playImage addSubview:_playButton];


  _prevImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
_prevImage.center = CGPointMake(base.bounds.size.width / 2 - 50, base.bounds.size.height - 42);
_prevImage.image = [UIImage imageWithContentsOfFile:@"/Library/Application Support/Glimpse/back.png"];
[_prevImage.layer setCornerRadius:13.5];
_prevImage.clipsToBounds = YES;
_prevImage.userInteractionEnabled = YES;
[base addSubview:_prevImage];

_prevButton = [UIButton buttonWithType:UIButtonTypeCustom];
_prevButton.userInteractionEnabled = YES;
[_prevButton addTarget:self 
           action:@selector(prevSong:)
 forControlEvents:UIControlEventTouchUpInside];
 [_prevButton setTitle:@"" forState:UIControlStateNormal];
_prevButton.frame = _prevImage.bounds;
[_prevImage addSubview:_prevButton];


  _nextImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
_nextImage.center = CGPointMake(base.bounds.size.width / 2 + 50, base.bounds.size.height - 42);
_nextImage.image = [UIImage imageWithContentsOfFile:@"/Library/Application Support/Glimpse/next.png"];
[_nextImage.layer setCornerRadius:13.5];
_nextImage.clipsToBounds = YES;
_nextImage.userInteractionEnabled = YES;
[base addSubview:_nextImage];

_nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
_nextButton.userInteractionEnabled = YES;
[_nextButton addTarget:self 
           action:@selector(nextSong:)
 forControlEvents:UIControlEventTouchUpInside];
 [_nextButton setTitle:@"" forState:UIControlStateNormal];
_nextButton.frame = _nextImage.bounds;
[_nextImage addSubview:_nextButton];
}

- (void) registerMediaPlayerNotifications {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
 
    [notificationCenter addObserver: self
                           selector: @selector (handle_NowPlayingItemChanged:)
                               name: MPMusicPlayerControllerNowPlayingItemDidChangeNotification
                             object: musicPlayer];
 
    [notificationCenter addObserver: self
                           selector: @selector (handle_PlaybackStateChanged:)
                               name: MPMusicPlayerControllerPlaybackStateDidChangeNotification
                             object: musicPlayer];
 
/*
    [notificationCenter addObserver: self
                           selector: @selector (handle_VolumeChanged:)
                               name: MPMusicPlayerControllerVolumeDidChangeNotification
                             object: musicPlayer];
*/
 
    [musicPlayer beginGeneratingPlaybackNotifications];
}

- (void) handle_NowPlayingItemChanged: (id) notification {
    MPMediaItem *currentItem = [musicPlayer nowPlayingItem];
    MPMediaItemArtwork *artwork = [currentItem valueForProperty: MPMediaItemPropertyArtwork];
 
_artworkImageView.image = [artwork imageWithSize:CGSizeMake(180, 180)];


    NSString *titleString = [currentItem valueForProperty:MPMediaItemPropertyTitle];
        titleLabel.text = titleString;

    NSString *artistString = [currentItem valueForProperty:MPMediaItemPropertyArtist];
        artistLabel.text = artistString;
}

- (void) handle_PlaybackStateChanged: (id) notification {
    MPMusicPlaybackState playbackState = [musicPlayer playbackState];
 
    if (playbackState == MPMusicPlaybackStatePaused) {
          _playImage.image = [UIImage imageWithContentsOfFile:@"/Library/Application Support/Glimpse/play.png"];
    } else if (playbackState == MPMusicPlaybackStatePlaying) {
           _playImage.image = [UIImage imageWithContentsOfFile:@"/Library/Application Support/Glimpse/stop.png"];
    }
}

- (void) playMusic:(UIButton *)sender {
    if([musicPlayer playbackState] == MPMusicPlaybackStatePlaying) {
        [musicPlayer pause];
    } else {
        [musicPlayer play];
    }
}

- (void) prevSong:(UIButton *)sender {
    [musicPlayer skipToPreviousItem];
}
- (void) nextSong:(UIButton *)sender {
    [musicPlayer skipToNextItem];
}



-(void) dealloc {
      [super dealloc];
[[NSNotificationCenter defaultCenter] removeObserver: self
                                                name: MPMusicPlayerControllerNowPlayingItemDidChangeNotification
                                              object: musicPlayer];
 
[[NSNotificationCenter defaultCenter] removeObserver: self
                                                name: MPMusicPlayerControllerPlaybackStateDidChangeNotification
                                              object: musicPlayer];
 
/*
[[NSNotificationCenter defaultCenter] removeObserver: self
                                                name: MPMusicPlayerControllerVolumeDidChangeNotification
                                              object: musicPlayer];
*/
 
[musicPlayer endGeneratingPlaybackNotifications];

      [musicPlayer release];
}
@end