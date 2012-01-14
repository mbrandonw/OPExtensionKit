//
//  NSPersistentStoreCoordinator+Opetopic.m
//  //  OPExtensionKit
//
//  Created by Brandon Williams on 9/26/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "NSPersistentStoreCoordinator+Opetopic.h"

@implementation NSPersistentStoreCoordinator (Opetopic)

-(void) removeStores {
    
	NSArray *stores = [self persistentStores];
	for (NSPersistentStore *store in stores)
	{
		[self removePersistentStore:store error:NULL];
		[[NSFileManager defaultManager] removeItemAtPath:store.URL.path error:NULL];
	}
}

@end
