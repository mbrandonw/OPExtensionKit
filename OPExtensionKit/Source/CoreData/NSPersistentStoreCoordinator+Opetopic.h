//
//  NSPersistentStoreCoordinator+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 9/26/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

/** NSPersistentStoreCoordinator Extensions
 
 Lots of fancy NSPersistentStoreCoordinator extensions!
 */

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface NSPersistentStoreCoordinator (Opetopic)

/**
 Removes all stores.
 */
-(void) removeStores;

@end
