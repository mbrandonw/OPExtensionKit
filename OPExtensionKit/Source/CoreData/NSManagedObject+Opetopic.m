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

-(void) addToContext:(NSManagedObjectContext*)context {
    if (! self.managedObjectContext)
    {
        NSDictionary *relationships = [[self entity] relationshipsByName];
        for (NSRelationshipDescription *relationship in relationships)
        {
            NSString *key = [NSString stringWithFormat:@"%@", relationship];
            for (NSManagedObject *object in [self valueForKey:key])
            {
                [object addToContext:context];
            }
        }
        
        [context insertObject:self];
    }
}

@end
