//
//  UIApplication+Opetopic.h
//  //  OPExtensionKit
//
//  Created by Brandon Williams on 11/1/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

/** UIApplication Extensions
 
 Lots of fancy UIApplication extensions!
 */

#import <UIKit/UIKit.h>

@interface UIApplication (Opetopic)

/**
 */
-(void) performBackgroundTask:(void(^)(void))task completion:(void(^)(void))completion expiration:(void(^)(void))expiration;

/**
 */
-(void) preventDeviceFromIdlingWhile:(void(^)(void))task;

/**
 Invoke particular -openURL: schemes.
 */
+(void) call:(NSString*)number;
+(void) facetime:(NSString*)number;
+(void) openMaps:(NSString*)address;
+(void) openMapsWithDirectionsTo:(NSString*)address;

@end
