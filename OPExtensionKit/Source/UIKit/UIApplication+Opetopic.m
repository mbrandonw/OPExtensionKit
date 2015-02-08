//
//  UIApplication+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 11/1/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

#import "UIApplication+Opetopic.h"
#import "NSString+Opetopic.h"
#import "GCD+Opetopic.h"

NSString *UIInterfaceOrientationToString(UIInterfaceOrientation orientation) {
  switch (orientation) {
    case UIInterfaceOrientationLandscapeLeft:
      return  @"Landscape Left";
    case UIInterfaceOrientationLandscapeRight:
      return  @"Landscape Right";
    case UIInterfaceOrientationPortrait:
      return  @"Portrait";
    case UIInterfaceOrientationPortraitUpsideDown:
      return  @"Portrait Upside Down";
    case UIInterfaceOrientationUnknown:
      return  @"Unknown";
  }
  return nil;
}

@implementation UIApplication (Opetopic)

-(void) performBackgroundTask:(void(^)(void))task completion:(void(^)(void))completion expiration:(void(^)(void))expiration {
    
    if (task)
    {
        UIBackgroundTaskIdentifier identifier = UIBackgroundTaskInvalid;
        identifier = [self beginBackgroundTaskWithExpirationHandler:^{
            [self endBackgroundTask:identifier];
            if (expiration) {
                expiration();
            }
        }];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            if (task) {
                task();
            }
            if (completion) {
                completion();
            }
            [self endBackgroundTask:identifier];
        });
    }
}

-(void) performBackgroundTaskOnMainThread:(void(^)(void))task completion:(void(^)(void))completion expiration:(void(^)(void))expiration {
    
    if (task) {
        UIBackgroundTaskIdentifier identifier = UIBackgroundTaskInvalid;
        identifier = [self beginBackgroundTaskWithExpirationHandler:^{
            [self endBackgroundTask:identifier];
            if (expiration) {
                expiration();
            }
        }];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (task) {
                task();
            }
            if (completion) {
                completion();
            }
            [self endBackgroundTask:identifier];
        });
    }
}

-(void) preventDeviceFromIdlingWhile:(void (^)(void))task {
    
    BOOL previousValue = [UIApplication sharedApplication].idleTimerDisabled;
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        self.idleTimerDisabled = YES;
    });
    
    if (task)
        task();
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        self.idleTimerDisabled = previousValue;
    });
}

-(OPApplicationContentSizeEnum) preferredContentSizeEnum {
  
  NSString *category = nil;
  if ([UIApplication instancesRespondToSelector:@selector(preferredContentSizeCategory)]) {
    category = [self preferredContentSizeCategory];
  } else {
    return OPApplicationContentSizeEnumNA;
  }

  if ([category isEqualToString:UIContentSizeCategoryExtraSmall]) {
    return OPApplicationContentSizeEnumXSmall;
  }
  if ([category isEqualToString:UIContentSizeCategorySmall]) {
    return OPApplicationContentSizeEnumSmall;
  }
  if ([category isEqualToString:UIContentSizeCategoryMedium]) {
    return OPApplicationContentSizeEnumMedium;
  }
  if ([category isEqualToString:UIContentSizeCategoryLarge]) {
    return OPApplicationContentSizeEnumLarge;
  }
  if ([category isEqualToString:UIContentSizeCategoryExtraLarge]) {
    return OPApplicationContentSizeEnumXLarge;
  }
  if ([category isEqualToString:UIContentSizeCategoryExtraExtraLarge]) {
    return OPApplicationContentSizeEnumXXLarge;
  }
  if ([category isEqualToString:UIContentSizeCategoryExtraExtraExtraLarge]) {
    return OPApplicationContentSizeEnumXXXLarge;
  }
  return OPApplicationContentSizeEnumNA;
}

+(void) call:(NSString*)number {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", [number stripNonTelephonyCharacters]]]];
}

+(BOOL) canMakeCalls {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]];
}

+(void) facetime:(NSString*)number {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"facetime://%@", [number stripNonTelephonyCharacters]]]];
}

+(BOOL) canFacetime {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"facetime://"]];
}

+(void) openMaps:(NSString *)address {
    
    [[UIApplication sharedApplication] openURL:
     [NSURL URLWithString:
      [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", [address URLEncodedString]]]];
}

+(void) openMapsWithDirectionsTo:(NSString *)address {
    
    [[UIApplication sharedApplication] openURL:
     [NSURL URLWithString:
      [NSString stringWithFormat:@"http://maps.google.com/maps?daddr=Current%%20Location&saddr=%@", [address URLEncodedString]]]];
}

+(BOOL) isAppStoreVersion {
  return [NSBundle.mainBundle pathForResource:@"embedded" ofType:@"mobileprovision"] == nil;
}

@end
