//
//  NSSet+Opetopic.h
//  OPKit
//
//  Created by Brandon Williams on 12/22/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

/** NSSet Extensions
 
 Lots of fancy NSSet extensions!
 */

#import <Foundation/Foundation.h>

#define $set(...)   [NSSet setWithObjects:__VA_ARGS__, nil]
#define $mset(...)  [NSMutableSet setWithObjects:__VA_ARGS__, nil]

@interface NSSet (Opetopic)

/**
 Sorts into an array using a single sort descriptor.
 */
-(NSArray*) sortedArrayUsingDescriptor:(NSSortDescriptor *)sortDescriptor;

/**
 Syncronizes two collections of objects.
 
 @param collection The other collection to syncronize the set with.
 @param key1 The key in the caller array to use as a syncronization pivot.
 @param key2 The key in `collection` to use as a syncronization pivot.
 @param updateBlock A block that is called when 2 of the same objects are found in the 
 collections, and hence they must be updated.
 @param insertBlock A block that is called when a new object is found in `collection`.
 @param deleteBlock A block that is called when an object from the caller should be deleted.
 @return Returns a new array with the passed object inserted in the front of the array.
 */
-(void) synchronizeWith:(id)collection 
              usingKeys:(NSString*)key1 :(NSString*)key2 
            updateBlock:(void(^)(id obj1, id obj2))updateBlock
            insertBlock:(void(^)(id obj))insertBlock
            deleteBlock:(void(^)(id obj))deleteBlock;

@end
