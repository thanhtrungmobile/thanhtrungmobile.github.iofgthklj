#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface Metanoia : UIView {
	CALayer *containerLayer;
	CALayer *hourHand;
	CALayer *minHand;
	CALayer *secHand;
	NSTimer *timer;
}

- (void)start;
- (void)stop;

- (void)setHourHandImage:(CGImageRef)image;
- (void)setMinHandImage:(CGImageRef)image;
- (void)setSecHandImage:(CGImageRef)image;
- (void)setBackgroundImage:(CGImageRef)image;

@property (assign, nonatomic) BOOL secHandContinuous;
@property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end
