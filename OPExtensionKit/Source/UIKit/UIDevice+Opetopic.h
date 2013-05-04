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
+(BOOL) isRetina;
+(BOOL) isPhone;
+(BOOL) isPad;
+(BOOL) isFast;
+(BOOL) hasFacetime;
+(BOOL) hasTelephony;

+(BOOL) isAtLeastiOS5;
+(BOOL) isAtLeastiOS6;

+(double) freeMemory;
+(double) appMemoryUsage;

-(NSString*) universalUniqueIDString;

@end
