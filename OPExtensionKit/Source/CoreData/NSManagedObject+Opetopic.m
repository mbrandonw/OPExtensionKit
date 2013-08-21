//
//  NSManagedObject+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/25/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "NSManagedObject+Opetopic.h"
#import <objc/runtime.h>

@implementation NSManagedObject (Opetopic)

-(BOOL) isUnsaved {
    return [[self committedValuesForKeys:nil] count] == 0;
}

-(void) fault {
  [self.managedObjectContext refreshObject:self mergeChanges:NO];
}

-(void) addToContext:(NSManagedObjectContext*)context {
    if (! self.managedObjectContext)
    {
        [context insertObject:self];
        
        // first add all relationships to the context
        NSDictionary *relationships = [[self entity] relationshipsByName];
        [relationships enumerateKeysAndObjectsUsingBlock:^(id relationshipKey, NSRelationshipDescription *relationshipDescription, BOOL *stop) {
            
            id relationship = [self valueForKey:relationshipKey];
            if ([relationship conformsToProtocol:@protocol(NSFastEnumeration)])
            {
                for (NSManagedObject *object in relationship)
                    [object addToContext:context];
            }
            else
            {
                [relationship addToContext:context];
            }
        }];
    }
}

@end
