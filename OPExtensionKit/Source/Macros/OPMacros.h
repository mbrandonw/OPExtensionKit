//
//  OPMacros.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/2/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Opetopic.h"
#import <mach/mach_time.h>

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

#define DLogLevelUrgent     0
#define DLogLevelDebug      1
#define DLogLevelInfo       2
#define DLogLevelProfiling  4

#ifdef DEBUG
    #define DLogMessageCompat(fmt, ...)         LogMessageCompat(fmt, ##__VA_ARGS__)
    #define DLogMessage(tag, level, fmt, ...)   LogMessage(tag, level, fmt, ##__VA_ARGS__)
    #define DLogMessageF(tag, level, fmt, ...)  LogMessageF(__FILE__, __LINE__, __PRETTY_FUNCTION__, tag, level, fmt, ##__VA_ARGS__)

    #define DLogData(tag, level, data)          LogData(tag, level, data)
    #define DLogDataF(tag, level, data)         LogDataF(__FILE__, __LINE__, __PRETTY_FUNCTION__, tag, level, data)

    #define DLogImageData(tag, level, width, height, data)      LogImageData(tag, level, width, height, data)
    #define DLogImageDataF(tag, level, width, height, data)     LogImageDataF(__FILE__, __LINE__, __PRETTY_FUNCTION__, tag, level, width, height, data)

    #define DLogImage(tag, level, image)      LogImageData(tag, level, image.size.width, image.size.height, UIImagePNGRepresentation(image))
    #define DLogImageF(tag, level, image)     LogImageDataF(__FILE__, __LINE__, __PRETTY_FUNCTION__, tag, level, image.size.width, image.size.height, UIImagePNGRepresentation(image))

    #define DLogClassAndMethod()   DLogMessageF(nil, DLogLevelInfo, @"%@ %@", [self class], NSStringFromSelector(_cmd))
    #define DLogMemoryUsage()      DLogMessageF(nil, DLogLevelInfo, @"***Memory Usage***\nApp: %f\nDevice: %f", [UIDevice appMemoryUsage], [UIDevice freeMemory])

    #define DLogStartBlock(fmt, ...)                LogStartBlock(fmt, ##__VA_ARGS__)
    #define DLogEndBlock()                          LogEndBlock()
    #define DLogMarker(marker)                      LogMarker(marker)
    #define DLoggerFlush(logger, waitForConnection) LoggerFlush(logger, waitForConnection)
    #define DLogFlush(waitForConnection)    LoggerFlush(NULL, waitForConnection)
#else
    #define DLogMessageCompat(fmt, ...)         do{}while(0)
    #define DLogMessage(tag, level, fmt, ...)   do{}while(0)
    #define DLogMessageF(tag, level, fmt, ...)  do{}while(0)

    #define DLogData(tag, level, data)          do{}while(0)
    #define DLogDataF(tag, level, data)         do{}while(0)

    #define DLogImageData(tag, level, width, height, data)      do{}while(0)
    #define DLogImageDataF(tag, level, width, height, data)     do{}while(0)

    #define DLogImage(tag, level, image)      do{}while(0)
    #define DLogImageF(tag, level, image)     do{}while(0)

    #define DLogClassAndMethod()    do{}while(0)
    #define DLogMemoryUsage()       do{}while(0)

    #define DLogStartBlock(fmt, ...)                do{}while(0)
    #define DLogEndBlock()                          do{}while(0)
    #define DLogMarker(marker)                      do{}while(0)
    #define DLoggerFlush(logger, waitForConnection) do{}while(0)
    #define DLogFlush(waitForConnection)            do{}while(0)
#endif

#define OP_SAFE_RELEASE(p)	{[p release]; p = nil;}

/*
 Turns a variable # of arguments into a C array of id's
 */
#define VA_ARGS_C_ARRAY(...)   (id __unsafe_unretained []){__VA_ARGS__}

/*
 Determines the # of arguments in a variable list of id's
 */
#define VA_ARGS_COUNT(...)  (sizeof(VA_ARGS_C_ARRAY(__VA_ARGS__)) / sizeof(id))

// Allows all orientations for the iPad, and everything but upside down portrait on the iPhone
#define UI_ACCEPTABLE_INTERFACE_ORIENTATIONS(orientation)  (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad ? YES : (UIInterfaceOrientationIsLandscape(orientation)||orientation==UIInterfaceOrientationPortrait))

// Allows all orientations on the iPad, and only portrait on the iPhone
#define UI_RESTRICTIVE_INTERFACE_ORIENTATIONS(orientation)  (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad ? YES : orientation==UIInterfaceOrientationPortrait)

#define OP_SYNTHESIZE_SINGLETON_FOR_CLASS(className, singletonMethod) \
\
+(id) singletonMethod { \
    static className *shared##className = nil; \
    static dispatch_once_t once; \
    dispatch_once(&once, ^{ \
        shared##className = [[[self class] alloc] init]; \
    }); \
    return shared##className; \
}

#define randi(a,b) ({ \
    __typeof__(a) __a=(a); \
    __typeof__(b) __b=(b); \
    (arc4random() % (__b - __a) + __a); \
})

#define randf(a,b) ({ \
    __typeof__(a) __a=(a); \
    __typeof__(b) __b=(b); \
    (((float)(arc4random() % ((unsigned)RAND_MAX+1)) / (float)RAND_MAX) * (__b - __a) + __a); \
})

#define randd(a,b) ({ \
    __typeof__(a) __a=(a); \
    __typeof__(b) __b=(b); \
    (((double)(arc4random() % ((unsigned)RAND_MAX+1)) / (float)RAND_MAX) * (__b - __a) + __a); \
})

#define clip(f,a,b) ({ \
    __typeof__(f) __f=(f); \
    __typeof__(a) __a=(a); \
    __typeof__(b) __b=(b); \
    __f < __a ? __a : __f > __b ? __b : __f; \
})

#define signf(a)	({ __typeof__(a) __a=(a); __a > 0.0f ? 1.0f : __a < 0.0f ? -1.0f : 0.0f; })
