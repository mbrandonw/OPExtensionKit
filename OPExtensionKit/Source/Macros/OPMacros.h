//
//  OPMacros.h
//  OPKit
//
//  Created by Brandon Williams on 1/2/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>

// Measures how long it takes to perform a task
void OPProfile(NSString *label, void(^task)(void));

// DLog is almost a drop-in replacement for NSLog
// DLog();
// DLog(@"here");
// DLog(@"value: %d", x);
// Unfortunately this doesn't work DLog(aStringVariable); you have to do this instead DLog(@"%@", aStringVariable);
#if defined(DEBUG)
#	define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#	define DLog(...)	do{}while(0);
#endif

// ALog always displays output regardless of the DEBUG setting
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#define OP_SAFE_RELEASE(p)	{[p release]; p = nil;}

// returns the first non-nil object
id OPCoalesce(NSUInteger count, ...);

// Allows all orientations for the iPad, and everything but upside down portrait on the iPhone
#define UI_ACCEPTABLE_INTERFACE_ORIENTATIONS(orientation)  (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad ? YES : (UIInterfaceOrientationIsLandscape(orientation)||orientation==UIInterfaceOrientationPortrait))

// Allows all orientations on the iPad, and only portrait on the iPhone
#define UI_RESTRICTIVE_INTERFACE_ORIENTATIONS(orientation)  (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad ? YES : orientation==UIInterfaceOrientationPortrait)

#define OP_SYNTHESIZE_SINGLETON_FOR_CLASS(className, singletonMethod) \
\
+(className *)singletonMethod { \
    static className *shared##className = nil; \
    static dispatch_once_t once; \
    dispatch_once(&once, ^{ \
        shared##className = [[self alloc] init]; \
    }); \
    return shared##className; \
}


// shortcuts for creating helper objc objects
#define NSInt(i)	[NSNumber numberWithInt:(i)]
#define NSFloat(f)	[NSNumber numberWithFloat:(f)]
#define NSDouble(d)	[NSNumber numberWithDouble:(d)]
#define NSBool(b)	[NSNumber numberWithBool:(b)]


#define randi(a,b)	({ __typeof__(a) __a=(a); __typeof__(b) __b=(b); (arc4random() % (__b - __a) + __a); })
#define randf(a,b)	({ __typeof__(a) __a=(a); __typeof__(b) __b=(b); (((float)(arc4random() % ((unsigned)RAND_MAX+1)) / (float)RAND_MAX) * (__b - __a) + __a); })
#define randd(a,b)	({ __typeof__(a) __a=(a); __typeof__(b) __b=(b); (((double)(arc4random() % ((unsigned)RAND_MAX+1)) / (float)RAND_MAX) * (__b - __a) + __a); })

#define signf(a)	({ __typeof__(a) __a=(a); __a > 0.0f ? 1.0f : __a < 0.0f ? -1.0f : 0.0f; })
