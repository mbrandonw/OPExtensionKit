//
//  NSObject+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 9/24/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

/** NSObject Extensions
 
 Lots of fancy NSObject extensions!
 */

#import <Foundation/Foundation.h>

@interface NSObject (Opetopic)

/**
 Determines if the object is in the array `array`.
 */
-(BOOL) in:(NSArray*)array;

/**
 Performs the selector `aSelector` on the caller and passes each object in `objects`.
 */
-(void) performSelector:(SEL)aSelector withEachObjectIn:(id<NSFastEnumeration>)objects;

/**
 Calls `block` on the next run loop pass.
 */
+(void) performBlockNextRunloop:(void(^)(void))block;

/**
 Tappity tap
 */
-(id) tap:(void(^)(id obj))tap;

@end
