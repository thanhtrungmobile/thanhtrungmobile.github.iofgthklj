@interface WDHealthDataTopLevelCategoryTableViewCell
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

%hook WDHealthDataTopLevelCategoryTableViewCell
-(void) layoutSubviews {
%orig;

self.backgroundColor = [UIColor blackColor];
}
%end