//
//  NSSet+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 12/22/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

#import "NSSet+Opetopic.h"
#import "NSArray+Opetopic.h"

@implementation NSSet (Opetopic)

-(BOOL) hasElements {
    return [self count] > 0;
}

-(NSSet*) compact {
    NSMutableSet *retVal = [NSMutableSet new];
    for (id obj in self)
        if (obj != [NSNull null])
            [retVal addObject:obj];
    return retVal;
}

-(NSArray*) sortedArrayUsingDescriptor:(NSSortDescriptor *)sortDescriptor {
    return [self sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
}

-(void) synchronizeWith:(id)collection 
              usingKeys:(NSString*)key1 :(NSString*)key2 
            updateBlock:(void(^)(id obj1, id obj2))updateBlock
            insertBlock:(void(^)(id obj))insertBlock
            deleteBlock:(void(^)(id obj))deleteBlock {
    
    [[self allObjects] synchronizeWith:collection 
                             usingKeys:key1 :key2 
                           updateBlock:updateBlock
                           insertBlock:insertBlock
                           deleteBlock:deleteBlock];
}
@end
