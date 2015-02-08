//
//  UIApplication+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 11/1/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

/** UIApplication Extensions
 
 Lots of fancy UIApplication extensions!
 */

typedef NS_ENUM(NSInteger, OPApplicationContentSizeEnum) {
  OPApplicationContentSizeEnumNA,
  OPApplicationContentSizeEnumXSmall,
  OPApplicationContentSizeEnumSmall,
  OPApplicationContentSizeEnumMedium,
  OPApplicationContentSizeEnumLarge,
  OPApplicationContentSizeEnumXLarge,
  OPApplicationContentSizeEnumXXLarge,
  OPApplicationContentSizeEnumXXXLarge,
};

FOUNDATION_EXPORT NSString *UIInterfaceOrientationToString(UIInterfaceOrientation orientation)__attribute__((const));

#import <UIKit/UIKit.h>

@interface UIApplication (Opetopic)

/**
 Takes care of setting up `UIBackgroundTaskIdentifier` and running the task on a background thread. Both `task` and `completion`
 are called on the same background thread.
 */
-(void) performBackgroundTask:(void(^)(void))task completion:(void(^)(void))completion expiration:(void(^)(void))expiration;

/**
 Same as above except blocks are exceuted on main thread.
 */
-(void) performBackgroundTaskOnMainThread:(void(^)(void))task completion:(void(^)(void))completion expiration:(void(^)(void))expiration;

/**
 */
-(void) preventDeviceFromIdlingWhile:(void(^)(void))task;

/**
 */
-(OPApplicationContentSizeEnum) preferredContentSizeEnum;

/**
 Invoke particular -openURL: schemes.
 */
+(void) call:(NSString*)number;
+(BOOL) canMakeCalls;
+(void) facetime:(NSString*)number;
+(BOOL) canFacetime;
+(void) openMaps:(NSString*)address;
+(void) openMapsWithDirectionsTo:(NSString*)address;

+(BOOL) isAppStoreVersion;

@end
