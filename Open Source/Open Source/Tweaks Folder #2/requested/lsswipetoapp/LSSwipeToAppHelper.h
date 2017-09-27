#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include <substrate.h>

@interface LSSwipeToAppHelper : NSObject
+ (NSString *)preferencesPath;
+ (CFStringRef)preferencesChanged;

+ (UIWindow *)mainLSSwipeToAppWindow;
+ (UIViewController *)mainLSSwipeToAppViewController;

+ (BOOL)isAppVersionGreaterThanOrEqualTo:(NSString *)appversion;
+ (BOOL)isAppVersionLessThanOrEqualTo:(NSString *)appversion;

+ (BOOL)isIOS83_OrGreater;
+ (BOOL)isIOS80_OrGreater;
+ (BOOL)isIOS70_OrGreater;
+ (BOOL)isIOS60_OrGreater;
+ (BOOL)isIOS50_OrGreater;
+ (BOOL)isIOS40_OrGreater;

+ (BOOL)isIPhone6_Plus;
+ (BOOL)isIPhone6;
+ (BOOL)isIPhone5;
+ (BOOL)isIPhone4_OrLess;

+ (BOOL)isIPad;
+ (BOOL)isIPhone;

+ (BOOL)isRetina;

+ (CGFloat)screenWidth;
+ (CGFloat)screenHeight;
@end
