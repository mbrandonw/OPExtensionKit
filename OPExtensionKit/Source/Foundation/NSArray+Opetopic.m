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

+(id) :(NSInteger)from to:(NSInteger)to {
    NSMutableArray *retVal = [NSMutableArray new];
    if (from > to)
        return retVal;
    for (NSInteger i = from; i <= to; i++)
        [retVal addObject:[NSNumber numberWithInteger:i]];
    return retVal;
}

-(id) shuffledArray {
    return [self sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        int a = rand();
        int b = rand();
        return a < b ? NSOrderedAscending : a > b ? NSOrderedDescending : NSOrderedSame;
    }];
}

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

-(id) secondToLastObject {
    
    if ([self count] >= 2)
        return [self objectAtIndex:[self count]-2];
    return nil;
}

-(BOOL) hasElements {
    return [self count] > 0;
}

-(NSArray*) compact {
    NSMutableArray *retVal = [[NSMutableArray alloc] initWithCapacity:[self count]];
    for (id obj in self)
        if (obj != [NSNull null])
            [retVal addObject:obj];
    return retVal;
}

-(NSArray*) compactWithOptions:(NSArrayCompactOptions)options {
    NSMutableArray *retVal = [[NSMutableArray alloc] initWithCapacity:[self count]];
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
            insertBlock:(id(^)(id obj))insertBlock
            deleteBlock:(void(^)(id obj))deleteBlock {
    
    [self synchronizeWith:collection usingKeys:key1 :key2 needsSort:YES updateBlock:updateBlock insertBlock:insertBlock deleteBlock:deleteBlock];
}

-(void) synchronizeWith:(id)collection 
              usingKeys:(NSString *)key1 :(NSString *)key2 
              needsSort:(BOOL)needsSort 
            updateBlock:(void (^)(id, id))updateBlock 
            insertBlock:(id (^)(id))insertBlock 
            deleteBlock:(void (^)(id))deleteBlock {
    
    [self synchronizeWith:collection usingKeys:key1 :key2 needsSort:needsSort :needsSort updateBlock:updateBlock insertBlock:insertBlock deleteBlock:deleteBlock];
}


-(void) synchronizeWith:(id)collection 
              usingKeys:(NSString*)key1 :(NSString*)key2 
              needsSort:(BOOL)needsSort1 :(BOOL)needsSort2
            updateBlock:(void(^)(id obj1, id obj2))updateBlock
            insertBlock:(id(^)(id obj))insertBlock
            deleteBlock:(void(^)(id obj))deleteBlock {
    
    // let's cover the degenerate case of all new data
    if ([self count] == 0)
    {
        NSArray *sortedCollection = !needsSort2 ? collection : [(id)collection respondsToSelector:@selector(sortedArrayUsingDescriptor:)] ? [(id)collection sortedArrayUsingDescriptor:[NSSortDescriptor sortDescriptorWithKey:key2 ascending:YES]] : nil;
        __block id lastInsertedObj = nil;
        
        [sortedCollection enumerateObjectsUsingBlock:^(id obj2, NSUInteger idx, BOOL *stop) {
            @autoreleasepool {
                if (! [[lastInsertedObj valueForKey:key1] isEqual:[obj2 valueForKey:key2]])
                    lastInsertedObj = insertBlock(obj2);
                updateBlock(lastInsertedObj, obj2);
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
        NSArray *sortedSelf = !needsSort1 ? self : [self respondsToSelector:@selector(sortedArrayUsingDescriptor:)] ? [self sortedArrayUsingDescriptor:[NSSortDescriptor sortDescriptorWithKey:key1 ascending:YES]] : nil;
        NSArray *sortedCollection = !needsSort2 ? collection : [(id)collection respondsToSelector:@selector(sortedArrayUsingDescriptor:)] ? [(id)collection sortedArrayUsingDescriptor:[NSSortDescriptor sortDescriptorWithKey:key2 ascending:YES]] : nil;
        
        // loop through the collections simulateously to detect updates, inserts and deletions
        NSUInteger i = 0, j = 0;
        id lastInsertedObj = nil;
        while (i < [sortedSelf count] || j < [sortedCollection count]) {
            @autoreleasepool {
                
                id obj1 = i < [sortedSelf count] ? [sortedSelf objectAtIndex:i] : nil;
                id obj2 = j < [sortedCollection count] ? [sortedCollection objectAtIndex:j] : nil;
                id id1 = [obj1 valueForKey:key1];
                id id2 = [obj2 valueForKey:key2];
                
                if ([id1 isEqual:id2])
                {
                    updateBlock(obj1, obj2);
                    i++, j++;
                    lastInsertedObj = obj1;
                }
                else if (! id2 || [id1 compare:id2] == NSOrderedAscending) // doing [- compare:nil] is a crashy crash
                {
                    deleteBlock(obj1);
                    i++;
                }
                else
                {
                    if (! [[lastInsertedObj valueForKey:key1] isEqual:[obj2 valueForKey:key2]])
                        lastInsertedObj = insertBlock(obj2);
                    
                    updateBlock(lastInsertedObj, obj2);
                    j++;
                }
            }
        }
    }
}

@end
