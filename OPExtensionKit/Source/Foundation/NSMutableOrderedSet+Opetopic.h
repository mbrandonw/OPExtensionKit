//
//  NSMutableOrderedSet+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 6/14/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableOrderedSet (Opetopic)

/**
 Swaps objects at index i and j.
 */
-(void) swapObjectAtIndex:(NSUInteger)i withObjectAtIndex:(NSUInteger)j;
-(void) swapObject:(id)obj withObjectAtIndex:(NSUInteger)i;
-(void) swapObject:(id)obj1 withObject:(id)obj2;

@end
