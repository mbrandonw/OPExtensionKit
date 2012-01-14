//
//  NSManagedObjectContext+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 12/4/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

#import "NSManagedObjectContext+Opetopic.h"

@implementation NSManagedObjectContext (Opetopic)

- (NSManagedObject *)objectWithURI:(NSURL *)uri {
    
    NSManagedObjectID *objectID = [[self persistentStoreCoordinator] managedObjectIDForURIRepresentation:uri];
    
    if (! objectID)
        return nil;
    
    NSManagedObject *objectForID = [self objectWithID:objectID];
    if (![objectForID isFault])
        return objectForID;
    
    NSFetchRequest *request = [NSFetchRequest new];
    [request setEntity:[objectID entity]];
    
    NSPredicate *predicate = [NSComparisonPredicate predicateWithLeftExpression:[NSExpression expressionForEvaluatedObject]
                                                                rightExpression:[NSExpression expressionForConstantValue:objectForID]
                                                                       modifier:NSDirectPredicateModifier
                                                                           type:NSEqualToPredicateOperatorType
                                                                        options:0];
    [request setPredicate:predicate];
    
    NSArray *results = [self executeFetchRequest:request error:nil];
    if ([results count] > 0 )
        return [results objectAtIndex:0];
    
    return nil;
}

@end
