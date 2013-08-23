//
//  NSNotificationCenter+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 10/11/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

/** NSNotificationCenter Extensions
 
 Lots of fancy NSNotificationCenter extensions!
 */

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (Opetopic)

/**
 Helper method to post notifications on the main thread.
 */
-(void) postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject;

/**
 Helper method to add observer on main queue.
 */
-(id) addObserverOnMainQueueForName:(NSString*)name object:(id)obj usingBlock:(void(^)(NSNotification *note))block;

/**
 Helper method to add observer on current queue.
 */
-(id) addObserverForName:(NSString*)name usingBlock:(void(^)(NSNotification *note))block;
-(id) addObserverForName:(NSString*)name object:(id)obj usingBlock:(void(^)(NSNotification *note))block;

@end
