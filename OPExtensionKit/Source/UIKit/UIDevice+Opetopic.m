//
//  UIDevice+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 11/28/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

#import "UIDevice+Opetopic.h"
#import "NSString+Opetopic.h"
#import <mach/mach.h>
#import <mach/mach_host.h>
#import <sys/sysctl.h>

NSString *UIDeviceOrientationToString(UIDeviceOrientation orientation) {
  switch (orientation) {
    case UIDeviceOrientationFaceDown:
      return @"Face Down";
    case UIDeviceOrientationFaceUp:
      return @"Face Up";
    case UIDeviceOrientationLandscapeLeft:
      return @"Landscape Left";
    case UIDeviceOrientationLandscapeRight:
      return @"Landscape Right";
    case UIDeviceOrientationPortrait:
      return @"Portrait";
    case UIDeviceOrientationPortraitUpsideDown:
      return @"Portrait Upside Down";
    case UIDeviceOrientationUnknown:
      return @"Unknown";
  }
  return nil;
}

@implementation UIDevice (Opetopic)

+(NSString*) deviceString {

  size_t size;
  sysctlbyname("hw.machine", NULL, &size, NULL, 0);
  char *answer = malloc(size);
  sysctlbyname("hw.machine", answer, &size, NULL, 0);
  NSString *platform = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];
  free(answer);
  return platform;
}

+(OPDeviceType) deviceType {
#if TARGET_IPHONE_SIMULATOR
  return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? OPDeviceTypeiPhoneSimulator : OPDeviceTypeiPadSimulator;
#else
  NSString *platform = self.class.deviceString;

  if ([platform isEqualToString:@"iPhone1,1"])    return OPDeviceTypeiPhone;
  if ([platform isEqualToString:@"iPhone1,2"])    return OPDeviceTypeiPhone3G;
  if ([platform hasPrefix:@"iPhone2"])            return OPDeviceTypeiPhone3GS;
  if ([platform hasPrefix:@"iPhone3"])            return OPDeviceTypeiPhone4;
  if ([platform hasPrefix:@"iPhone4"])            return OPDeviceTypeiPhone4S;
  if ([platform hasPrefix:@"iPhone5"])            return OPDeviceTypeiPhone5;

  if ([platform hasPrefix:@"iPod1"])              return OPDeviceTypeiPod1;
  if ([platform hasPrefix:@"iPod2"])              return OPDeviceTypeiPod2;
  if ([platform hasPrefix:@"iPod3"])              return OPDeviceTypeiPod3;
  if ([platform hasPrefix:@"iPod4"])              return OPDeviceTypeiPod4;
  if ([platform hasPrefix:@"iPod5"])              return OPDeviceTypeiPod5;

  if ([platform hasPrefix:@"iPad1"])              return OPDeviceTypeiPad;
  if ([platform hasPrefix:@"iPad2"])              return OPDeviceTypeiPad2;
  if ([platform hasPrefix:@"iPad3"])              return OPDeviceTypeiPad3;
  if ([platform hasPrefix:@"iPad4"])              return OPDeviceTypeiPad4;

  return OPDeviceTypeUnknown;
#endif
}

+(BOOL) isGameCenterReady {

  // Check for presence of GKLocalPlayer API.
  Class gcClass = (NSClassFromString(@"GKLocalPlayer"));

  // The device must be running running iOS 4.1 or later.
  NSString *reqSysVer = @"4.1";
  NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
  BOOL osVersionSupported = ([currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending);

  return (gcClass && osVersionSupported);
}

+(BOOL) isPhone {
  return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
}

+(BOOL) isTablet {
  return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

+(BOOL) isFast {
  return [[self class] deviceType] >= MAX(OPDeviceTypeiPad3, MAX(OPDeviceTypeiPhone4S, OPDeviceTypeiPod5));
}

+(BOOL) hasFacetime {
  return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"facetime://"]];
}

+(BOOL) hasTelephony {
  return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]];
}

+(BOOL) isiOS5OrLater {
  return [[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0f;
}

+(BOOL) isiOS5OrEarlier {
  return [[[UIDevice currentDevice] systemVersion] floatValue] < 6.0f;;
}

+(BOOL) isiOS6OrLater {
  return [[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0f;
}

+(BOOL) isiOS6OrEarlier {
  return [[[UIDevice currentDevice] systemVersion] floatValue] < 7.0f;;
}

+(BOOL) isiOS7OrLater {
  return [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f;
}

+(BOOL) isiOS7OrEarlier {
  return [[[UIDevice currentDevice] systemVersion] floatValue] < 8.0f;
}

+(BOOL) isiOS8OrLater {
  return [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0f;
}

+(BOOL) isiOS8OrEarlier {
  return [[[UIDevice currentDevice] systemVersion] floatValue] < 9.0f;
}

-(NSString*) universalUniqueIDString {
  return [UIDevice instancesRespondToSelector:@selector(identifierForVendor)] ? [[[UIDevice currentDevice] identifierForVendor] UUIDString] : nil;
}

@end
