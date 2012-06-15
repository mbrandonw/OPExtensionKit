//
//  NSMutableOrderedSet+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 6/14/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "NSMutableOrderedSet+Opetopic.h"

@implementation NSMutableOrderedSet (Opetopic)

-(void) swapObjectAtIndex:(NSUInteger)i withObjectAtIndex:(NSUInteger)j {
    
    if (i != j && i < [self count] && j < [self count])
    {
        id obj1 = [self objectAtIndex:i];
        id obj2 = [self objectAtIndex:j];
        [self replaceObjectAtIndex:i withObject:obj2];
        [self replaceObjectAtIndex:j withObject:obj1];
    }
}

-(void) swapObject:(id)obj withObjectAtIndex:(NSUInteger)i {
    [self swapObjectAtIndex:[self indexOfObject:obj] withObjectAtIndex:i];
}

-(void) swapObject:(id)obj1 withObject:(id)obj2 {
    [self swapObjectAtIndex:[self indexOfObject:obj1] withObjectAtIndex:[self indexOfObject:obj2]];
}

@end
