%hook UISlider
-(void) layoutSubviews {
%orig;

NSString *imagePath = @"/var/slider.png";


UIImageView *thumb = MSHookIvar<UIImageView *>(self, "_thumbView");
UIImageView *innerThumb = MSHookIvar<UIImageView *>(self, "_innerThumbView");

innerThumb.image = [UIImage imageWithContentsOfFile:imagePath];
innerThumb.center = CGPointMake(innerThumb.center.x, innerThumb.center.y);

thumb.image = [UIImage imageWithContentsOfFile:imagePath];
thumb.center = CGPointMake(innerThumb.center.x, innerThumb.center.y);
}


%end