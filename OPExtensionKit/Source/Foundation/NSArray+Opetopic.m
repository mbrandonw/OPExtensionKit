//
//  NSArray+Opetopic.m
//  CUArcade2
//
//  Created by Brandon Williams on 11/21/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

#import "NSArray+Opetopic.h"
#import "NSSet+Opetopic.h"

@implementation NSArray (Opetopic)

-(id) anyObject {
	if ([self count] == 0)
		return nil;
	return [self objectAtIndex:(arc4random() % self.count)];
}

-(id) anyObjectExcept:(id)object {
	
	if ([self count] == 0)
		return nil;
	
	id retVal = [self anyObject];
    NSUInteger count = 0;
	while (retVal == object)
    {
		retVal = [self anyObject];
        count++;
        if (count > [self count]*5)
            return nil;
    }
	
	return retVal;
}

-(id) firstObject {
	
	if ([self count] == 0)
		return nil;
	return [self objectAtIndex:0];
}

-(id) secondObject {
    
    if ([self count] <= 1)
        return nil;
    return [self objectAtIndex:1];
}

-(BOOL) hasElements {
    return [self count] > 0;
}

-(NSArray*) compact {
    NSMutableArray *retVal = [NSMutableArray new];
    for (id obj in self)
        if (obj != [NSNull null])
            [retVal addObject:obj];
    return retVal;
}

-(NSArray*) compactWithOptions:(NSArrayCompactOptions)options {
    NSMutableArray *retVal = [NSMutableArray new];
    for (id obj in self)
    {
        BOOL passes = YES;
        if (options & NSArrayCompactOptionNull && obj == [NSNull null])
            passes = NO;
        else if (options & NSArrayCompactOptionEmptyCollection && [obj respondsToSelector:@selector(count)] && [obj count] == 0)
            passes = NO;
        if (passes)
            [retVal addObject:obj];
    }
    return retVal;
}

-(NSArray*) arrayByPrependingObject:(id)object {
    
    NSMutableArray *array = [NSMutableArray arrayWithObject:object];
    return [array arrayByAddingObjectsFromArray:self];
}

-(BOOL) containsCaseInsensitiveString:(NSString*)string {
    for (id obj in self)
        if ([obj isKindOfClass:[NSString class]] && [obj caseInsensitiveCompare:string] == NSOrderedSame)
            return YES;
    return NO;
}

-(BOOL) containsAnObjectIn:(id<NSFastEnumeration>)collection {
    for (id obj in collection)
        if ([self containsObject:obj])
            return YES;
    return NO;
}

-(NSArray*) sortedArrayUsingDescriptor:(NSSortDescriptor *)sortDescriptor {
    return [self sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
}

-(void) synchronizeWith:(id)collection 
              usingKeys:(NSString*)key1 :(NSString*)key2 
            updateBlock:(void(^)(id obj1, id obj2))updateBlock
            insertBlock:(void(^)(id obj))insertBlock
            deleteBlock:(void(^)(id obj))deleteBlock {
    
    [self synchronizeWith:collection usingKeys:key1 :key2 needsSort:YES updateBlock:updateBlock insertBlock:insertBlock deleteBlock:deleteBlock];
}

-(void) synchronizeWith:(id)collection 
              usingKeys:(NSString *)key1 :(NSString *)key2 
              needsSort:(BOOL)needsSort 
            updateBlock:(void (^)(id, id))updateBlock 
            insertBlock:(void (^)(id))insertBlock 
            deleteBlock:(void (^)(id))deleteBlock {
    
    // let's cover the degenerate case of all new data
    if ([self count] == 0)
    {
        [collection enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            @autoreleasepool {
                insertBlock(obj);
            }
        }];
    }
    // and the degenerate case of removing all data
    else if ([collection count] == 0)
    {
        [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            @autoreleasepool {
                deleteBlock(obj);
            }
        }];
    }
    // otherwise we fallback on a full syncing of data
    else
    {
        // sort the two collects of data by their ids
        NSArray *sortedSelf = !needsSort ? self : [self respondsToSelector:@selector(sortedArrayUsingDescriptor:)] ? [self sortedArrayUsingDescriptor:[NSSortDescriptor sortDescriptorWithKey:key1 ascending:YES]] : nil;
        NSArray *sortedOther = !needsSort ? collection : [(id)collection respondsToSelector:@selector(sortedArrayUsingDescriptor:)] ? [(id)collection sortedArrayUsingDescriptor:[NSSortDescriptor sortDescriptorWithKey:key2 ascending:YES]] : nil;
        
        // loop through the collections simulateously to detect updates, inserts and deletions
        NSUInteger i = 0, j = 0;
        while (i < [sortedSelf count] || j < [sortedOther count]) {
            @autoreleasepool {
                
                id obj1 = i < [sortedSelf count] ? [sortedSelf objectAtIndex:i] : nil;
                id obj2 = j < [sortedOther count] ? [sortedOther objectAtIndex:j] : nil;
                id id1 = [obj1 valueForKey:key1];
                id id2 = [obj2 valueForKey:key2];
                
                if ([id1 isEqual:id2])
                {
                    updateBlock(obj1, obj2);
                    i++, j++;
                }
                else if (! id2 || [id1 compare:id2] == NSOrderedAscending) // doing [- compare:nil] is a crashy crash
                {
                    deleteBlock(obj1);
                    i++;
                }
                else
                {
                    insertBlock(obj2);
                    j++;
                }
            }
        }
    }
}

@end
