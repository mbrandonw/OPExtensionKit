//
//  NSManagedObject+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/25/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "NSManagedObject+Opetopic.h"
#import <objc/runtime.h>

@interface NSManagedObject (Opetopic_Private)
-(void) addToContext:(NSManagedObjectContext *)context parentRelationshipDescription:(NSRelationshipDescription*)parentRelationshipDescription;
@end

@implementation NSManagedObject (Opetopic)

-(BOOL) isUnsaved {
    return [[self committedValuesForKeys:nil] count] == 0;
}

-(void) addToContext:(NSManagedObjectContext*)context {
    [self addToContext:context parentRelationshipDescription:nil];
}

-(void) addToContext:(NSManagedObjectContext *)context parentRelationshipDescription:(NSRelationshipDescription*)parentRelationshipDescription {
    if (! self.managedObjectContext)
    {
        // first add all relationships to the context
        NSDictionary *relationships = [[self entity] relationshipsByName];
        [relationships enumerateKeysAndObjectsUsingBlock:^(id relationshipKey, NSRelationshipDescription *relationshipDescription, BOOL *stop) {
            
            // skip relationships that have already been taken care of
            if ([[relationshipDescription inverseRelationship] isEqual:parentRelationshipDescription])
                return ;
            
            id relationship = [self valueForKey:relationshipKey];
            if ([relationship conformsToProtocol:@protocol(NSFastEnumeration)])
            {
                for (NSManagedObject *object in relationship)
                    [object addToContext:context parentRelationshipDescription:relationshipDescription];
            }
            else
            {
                [relationship addToContext:context parentRelationshipDescription:relationshipDescription];
            }
        }];
        
        [context insertObject:self];
    }
}

@end
