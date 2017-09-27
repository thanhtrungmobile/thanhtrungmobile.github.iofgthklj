#import <MediaPlayer/MediaPlayer.h>

UILabel *titleLabel;


%hook CCUIControlCenterContainerView
-(void) layoutSubviews {
%orig;
UIScrollView *view = MSHookIvar<UIScrollView *>(self,"_pageScrollView");
float width = view.bounds.size.width; 

if(!titleLabel) {
titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 1, width, 24)];
titleLabel.textAlignment = NSTextAlignmentCenter;
titleLabel.backgroundColor = [UIColor clearColor];
titleLabel.textColor = [UIColor blackColor];
titleLabel.numberOfLines = 0;
[titleLabel setFont:[UIFont systemFontOfSize:10]];
[view addSubview:titleLabel];
}



MPMediaItem *song = [[MPMusicPlayerController systemMusicPlayer] nowPlayingItem];

// Song Title
NSString *songTitle = [song valueForProperty:MPMediaItemPropertyTitle];


// Label Text
titleLabel.text = songTitle;
}
%end