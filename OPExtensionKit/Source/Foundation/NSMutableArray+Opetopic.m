//
//  NSMutableArray+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 5/28/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "NSMutableArray+Opetopic.h"

@implementation NSMutableArray (Opetopic)

+(instancetype) nullArrayWithCapacity:(NSUInteger)count {
    id retVal = [[self class] arrayWithCapacity:count];
    for (NSUInteger i = 0; i < count; i++) {
        retVal[i] = [NSNull null];
    }
    return retVal;
}

-(void) shuffle {
	
	for (NSUInteger i = 0; i < [self count]; i++) {
		[self exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform([self count])];
  }
}

-(id) pop {
	
	id retVal = [self lastObject];
	if ([self count])
		[self removeLastObject];
	return retVal;
}

-(void) prependObject:(id)object {
    [self insertObject:object atIndex:0];
}

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
