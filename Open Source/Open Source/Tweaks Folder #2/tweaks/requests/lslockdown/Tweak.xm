UILabel *clockLabel;

%hook SBDashBoardView
-(void) layoutSubviews {
%orig;
float width = view.bounds.size.width; 

if(!clockLabel) {
clockLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 38, width, 62)];
clockLabel.textAlignment = NSTextAlignmentCenter;
clockLabel.backgroundColor = [UIColor clearColor];
clockLabel.textColor = [UIColor whiteColor];
clockLabel.numberOfLines = 0;
[clockLabel setFont:[UIFont systemFontOfSize:68]];
[view addSubview:clockLabel];
[clockLabel setText:@"Antique"];
}
}
%end