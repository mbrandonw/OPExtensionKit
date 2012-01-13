//
//  NSMutableArray+Opetopic.h
//  OPKit
//
//  Created by Brandon Williams on 5/28/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

/** NSMutableArray Extensions
 
 Lots of fancy NSMutableArray extensions!
 */

#import <Foundation/Foundation.h>

#define $marray(...)  [NSMutableArray arrayWithObjects:__VA_ARGS__, nil]

@interface NSMutableArray (Opetopic)

/**
 Shuffles the array.
 */
-(void) shuffle;

/**
 Removes the last element and returns it.
 
 @return The last element of the array.
 */
-(id) pop;

@end
