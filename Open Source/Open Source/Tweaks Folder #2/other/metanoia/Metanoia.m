#import "Metanoia.h"
#import "libcolorpicker.h"

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.antique.metanoia.plist"

@implementation Metanoia
-(void) start {
	timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateClock:) userInfo:nil repeats:YES];
}

-(void) stop {
	[timer invalidate];
	timer = nil;
}


- (void) setHourHandImage:(CGImageRef)image {
/* -- Hour Hand Colour -- */
NSDictionary *hourh = [NSDictionary dictionaryWithContentsOfFile:PLIST_PATH];
NSString *coolColorHex = [hourh objectForKey:@"hourHand"];

if (image == NULL) {
hourHand.backgroundColor = LCPParseColorString(coolColorHex, @"#000000").CGColor;
		hourHand.cornerRadius = 2.4;
} else {
		hourHand.backgroundColor = [UIColor clearColor].CGColor;
		hourHand.cornerRadius = 0.0;
		
    }
	hourHand.contents = (__bridge id)image;
}

-(void) setMinHandImage:(CGImageRef)image {
/* -- Minute Hand Colour -- */
NSDictionary *minuteh = [NSDictionary dictionaryWithContentsOfFile:PLIST_PATH];
NSString *coolColorHex = [minuteh objectForKey:@"minuteHand"];

if (image == NULL) {
minHand.backgroundColor = LCPParseColorString(coolColorHex, @"#000000").CGColor;
             minHand.cornerRadius = 2.4;
} else {
		minHand.backgroundColor = [UIColor clearColor].CGColor;
    }
	minHand.contents = (__bridge id)image;
}

-(void) setSecHandImage:(CGImageRef)image {
/* -- Second Hand Colour -- */
NSDictionary *secondh = [NSDictionary dictionaryWithContentsOfFile:PLIST_PATH];
NSString *coolColorHex = [secondh objectForKey:@"secondHand"];

if (image == NULL) {
secHand.backgroundColor = LCPParseColorString(coolColorHex, @"#f49609").CGColor;
             secHand.cornerRadius = 1.125;
} else {
		secHand.backgroundColor = [UIColor clearColor].CGColor;
		secHand.borderWidth = 0.0;
		secHand.borderColor = [UIColor clearColor].CGColor;
    }
	secHand.contents = (__bridge id)image;
}

-(void) setBackgroundImage:(CGImageRef)image {
if (image == NULL) {
             [containerLayer setCornerRadius:self.bounds.size.width / 2];
		containerLayer.borderColor = [UIColor blackColor].CGColor;
		containerLayer.borderWidth = 1.78;
} else {
		containerLayer.borderColor = [UIColor clearColor].CGColor;
		containerLayer.borderWidth = 0.0;
		containerLayer.cornerRadius = 0.0;
    }
	containerLayer.contents = (__bridge id)image;
}


#define HOURS_HAND_LENGTH 0.38
#define MIN_HAND_LENGTH 0.6
#define SEC_HAND_LENGTH 0.85

#define HOURS_HAND_WIDTH 5
#define MIN_HAND_WIDTH 5
#define SEC_HAND_WIDTH 2.25


float Degrees2Radians(float degrees) { 
    return degrees * M_PI / 180; 
}

-(void) updateClock:(NSTimer *)theTimer {
	
	NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:[NSDate date]];
	NSInteger seconds = [dateComponents second];
	NSInteger minutes = [dateComponents minute];
	NSInteger hours = [dateComponents hour];


	if(hours > 12) hours -=12;

	CGFloat secAngle = Degrees2Radians(seconds/60.0*360);
	CGFloat minAngle = Degrees2Radians(minutes/60.0*360);
	CGFloat hourAngle = Degrees2Radians(hours/12.0*360) + minAngle/12.0;
	
	if(self.secHandContinuous) {
		CGFloat prevSecAngle = Degrees2Radians((seconds -1)/60.0*360);
		[secHand removeAnimationForKey:@"transform"];
		CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform"];
		ani.duration = 1.f;
		ani.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(prevSecAngle+M_PI, 0, 0, 1)];
		ani.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(secAngle+M_PI, 0, 0, 1)];
		[secHand addAnimation:ani forKey:@"transform"];
	} else {
		secHand.transform = CATransform3DMakeRotation (secAngle+M_PI, 0, 0, 1);
	}
	minHand.transform = CATransform3DMakeRotation (minAngle+M_PI, 0, 0, 1);
	hourHand.transform = CATransform3DMakeRotation (hourAngle+M_PI, 0, 0, 1);
}

-(void) defaultSetup {
    containerLayer = [CALayer layer];
    hourHand = [CALayer layer];
    minHand = [CALayer layer];
    secHand = [CALayer layer];
    
    [self setBackgroundImage:NULL];
    [self setHourHandImage:NULL];
    [self setMinHandImage:NULL];
    [self setSecHandImage:NULL];
    
    [containerLayer addSublayer:hourHand];
    [containerLayer addSublayer:minHand];
    [containerLayer addSublayer:secHand];
    [self.layer addSublayer:containerLayer];
}

- (void) layoutSubviews {
	[super layoutSubviews];

	containerLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);

	float length = MIN(self.frame.size.width, self.frame.size.height)/2;
	CGPoint c = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
	hourHand.position = minHand.position = secHand.position = c;

	CGFloat w, h;
	CGFloat scale = 1;
	if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
		scale = [UIScreen mainScreen].scale;
	}
	
	if (hourHand.contents == NULL){
		w = HOURS_HAND_WIDTH;
		h = length*HOURS_HAND_LENGTH;
	}else{
		w = CGImageGetWidth((__bridge CGImageRef)hourHand.contents)/scale;
		h = CGImageGetHeight((__bridge CGImageRef)hourHand.contents)/scale;
	}
	hourHand.bounds = CGRectMake(0,0,w,h);
	
	if (minHand.contents == NULL){
		w = MIN_HAND_WIDTH;
		h = length*MIN_HAND_LENGTH;
	}else{
		w = CGImageGetWidth((__bridge CGImageRef)minHand.contents)/scale;
		h = CGImageGetHeight((__bridge CGImageRef)minHand.contents)/scale;
	}
	minHand.bounds = CGRectMake(0,0,w,h);
	
	if (secHand.contents == NULL){
		w = SEC_HAND_WIDTH;
		h = length*SEC_HAND_LENGTH;
	}else{
		w = CGImageGetWidth((__bridge CGImageRef)secHand.contents)/scale;
		h = CGImageGetHeight((__bridge CGImageRef)secHand.contents)/scale;
	}
	secHand.bounds = CGRectMake(0,0,w,h);

	hourHand.anchorPoint = CGPointMake(0.5,0.0);
	minHand.anchorPoint = CGPointMake(0.5,0.0);
	secHand.anchorPoint = CGPointMake(0.5,0.0);
	containerLayer.anchorPoint = CGPointMake(0.5, 0.5);
}

-(id) initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if(self) {
	      [self defaultSetup];
	}
	return self;
}

-(void) awakeFromNib {
        [super awakeFromNib];
        [self defaultSetup];
}

-(void) removeFromSuperview {
	 [self stop];
	 [super removeFromSuperview];
}

-(void) dealloc {
        [super dealloc];
        [self stop];
}
@end