//
//  NSFetchedResultsController+Opetopic.m
//  Kickstarter
//
//  Created by Brandon Williams on 7/3/12.
//  Copyright (c) 2012 Kickstarter. All rights reserved.
//

#import "NSFetchedResultsController+Opetopic.h"

@implementation NSFetchedResultsController (Opetopic)

-(void) faultUnfaultedFetchedObjects {
    
    for (NSManagedObject *object in [self fetchedObjects])
        if (! [object isFault])
            [object.managedObjectContext refreshObject:object mergeChanges:NO];
}

@end
