//
//  NSManagedObject+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/25/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (Opetopic)

/**
 YES if the object has not yet been saved.
 */
-(BOOL) isUnsaved;

/**
 Faults the object.
 */
-(void) fault;

-(void) addToContext:(NSManagedObjectContext*)context;

@end
