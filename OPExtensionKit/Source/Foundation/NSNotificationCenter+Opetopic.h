//
//  NSNotificationCenter+Opetopic.h
//  OPKit
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

@end
