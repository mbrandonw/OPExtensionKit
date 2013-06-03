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

-(NSArray*) sortedArrayUsingDescriptor:(NSSortDescriptor *)sortDescriptor {
    return [self sortedArrayUsingDescriptors:@[sortDescriptor]];
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
    
    [[self allObjects] synchronizeWith:collection 
                             usingKeys:key1 :key2 
                             needsSort:needsSort1 :needsSort2
                           updateBlock:updateBlock
                           insertBlock:insertBlock
                           deleteBlock:deleteBlock];
}

@end
