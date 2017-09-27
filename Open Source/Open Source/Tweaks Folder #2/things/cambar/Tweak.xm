%hook CAMTopBar
-(double)_opacityForBackgroundStyle:(double)arg1 {
%orig;
return 0.0;
}
%end

%hook CAMBottomBar
-(double)_opacityForBackgroundStyle:(double)arg1 {
%orig;
return 0.0;
}
%end

%hook CAMViewfinderViewController
- (long long)_aspectRatioForMode:(long long)mode {
	return 1;
}
%end