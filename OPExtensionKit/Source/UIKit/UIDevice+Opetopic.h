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

FOUNDATION_EXPORT NSString *UIDeviceOrientationToString(UIDeviceOrientation orientation)__attribute__((const));

#import <Foundation/Foundation.h>

@interface UIDevice (Opetopic)

+(NSString*) deviceString;
+(OPDeviceType) deviceType;

+(BOOL) isGameCenterReady;

+(BOOL) isPhone;
+(BOOL) isTablet;

+(BOOL) isCompact;
+(BOOL) isVerticallyCompact;
+(BOOL) isHorizontallyCompact;
+(BOOL) isCompactPhone;

-(CGRect) bounds;

+(BOOL) isFast;
+(BOOL) hasFacetime;
+(BOOL) hasTelephony;

+(BOOL) isiOS5OrLater;
+(BOOL) isiOS5OrEarlier;
+(BOOL) isiOS6OrLater;
+(BOOL) isiOS6OrEarlier;
+(BOOL) isiOS7OrLater;
+(BOOL) isiOS7OrEarlier;
+(BOOL) isiOS8OrLater;
+(BOOL) isiOS8OrEarlier;

-(NSString*) universalUniqueIDString;

@end
