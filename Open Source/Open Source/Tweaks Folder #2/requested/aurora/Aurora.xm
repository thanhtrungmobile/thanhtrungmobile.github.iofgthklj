#import <MediaPlayer/MediaPlayer.h>

/* Globally create a label for use anywhere */
UILabel *songLabel;



/* Hook the CC buttons and toggles page */
%hook CCUIControlCenterPagePlatterView
-(void) setMarginInsets:(UIEdgeInsets)edge {
%orig;

/* Change the insets - (top, left, bottom, right) */
edge = (UIEdgeInsetsMake(4, 0, 0, 0));

/* Use the new edge insets */
%orig(edge);
}
%end



/* Hook the CC's first page */
%hook CCUIControlCenterContainerView
-(void) layoutSubviews {
%orig;

/* Use the scroll view when displaying the label */
UIScrollView *view = MSHookIvar<UIScrollView *>(self,"_pageScrollView");

/* Get the UIScrollView's full width */
float width = view.bounds.size.width; 

/* Create a label displayed on the top of the CC */
if(!songLabel) {
songLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 4, width, 15)];
songLabel.textAlignment = NSTextAlignmentCenter;
songLabel.backgroundColor = [UIColor clearColor];
songLabel.textColor = [UIColor blackColor];
songLabel.numberOfLines = 0;
[songLabel setFont:[UIFont systemFontOfSize:15]];
/* Add the label to the scroll view */
[view addSubview:songLabel];
}


MPMediaItem *song = [[MPMusicPlayerController systemMusicPlayer] nowPlayingItem];

// Song Title
NSString *songTitle = [song valueForProperty:MPMediaItemPropertyTitle];


// Label Text
songLabel.text = songTitle;
}
%end

