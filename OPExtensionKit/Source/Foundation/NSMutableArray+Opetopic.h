//
//  NSMutableArray+Opetopic.h
//  OPExtensionKit
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

/**
 */
-(void) prependObject:(id)object;


/**
 Swaps objects at index i and j.
 */
-(void) swapObjectAtIndex:(NSUInteger)i withObjectAtIndex:(NSUInteger)j;
-(void) swapObject:(id)obj withObjectAtIndex:(NSUInteger)i;
-(void) swapObject:(id)obj1 withObject:(id)obj2;

@end

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 60000
@interface NSMutableArray (OPSubscripts)
-(void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx;
@end
#endif
