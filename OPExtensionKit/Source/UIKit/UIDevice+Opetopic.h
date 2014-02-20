//
//  UIDevice+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 11/28/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

/** UIDevice Extensions
 
 Lots of fancy UIDevice extensions!
 */

/**
 Enumerated iOS device types, ordered by increasing performance.
 */
typedef NS_ENUM(NSInteger, OPDeviceType) {
    OPDeviceTypeiPhone,
    OPDeviceTypeiPod1,
    OPDeviceTypeiPhone3G,
    OPDeviceTypeiPod2,
    OPDeviceTypeiPhone3GS,
    OPDeviceTypeiPad,
    OPDeviceTypeiPod3,
    OPDeviceTypeiPhone4,
    OPDeviceTypeiPad2,
    OPDeviceTypeiPod4,
    OPDeviceTypeiPhone4S,
    OPDeviceTypeiPad3,
    OPDeviceTypeiPod5,
    OPDeviceTypeiPhone5,
    OPDeviceTypeiPad4,
    OPDeviceTypeUnknown,
    OPDeviceTypeiPhoneSimulator,
    OPDeviceTypeiPadSimulator,
};

#import <Foundation/Foundation.h>

@interface UIDevice (Opetopic)

+(NSString*) deviceString;
+(OPDeviceType) deviceType;

+(BOOL) isGameCenterReady;
+(BOOL) isPhone;
+(BOOL) isPad;
+(BOOL) isFast;
+(BOOL) hasFacetime;
+(BOOL) hasTelephony;

+(BOOL) isiOS5OrLater;
+(BOOL) isiOS5OrEarlier;
+(BOOL) isiOS6OrLater;
+(BOOL) isiOS6OrEarlier;
+(BOOL) isiOS7OrLater;
+(BOOL) isiOS7OrEarlier;

+(double) freeMemory;
+(double) appMemoryUsage;

-(NSString*) universalUniqueIDString;

@end
