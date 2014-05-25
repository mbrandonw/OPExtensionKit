//
//  NSArray+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 11/21/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

/** NSArray Extensions
 
 Lots of fancy NSArray extensions!
 */

#import <Foundation/Foundation.h>

typedef enum {
    NSArrayCompactOptionNone            = 0,
    NSArrayCompactOptionNull            = 1 << 0,
    NSArrayCompactOptionEmptyCollection = 1 << 1,
} NSArrayCompactOptions;

#define $array(...)   [NSArray arrayWithObjects:__VA_ARGS__, nil]

@interface NSArray (Opetopic)

/**
 Returns an array with integers in the specified range (inclusive).
 */
+(id) :(NSInteger)from to:(NSInteger)to;


/**
 Returns a new array shuffled.
 */
-(id) shuffledArray;


/**
 @return An NSRange covering the whole array.
 */
-(NSRange) fullRange;


/**
 Assuming the receiver is already sorted, this will search through the array until the comparator
 block returns NSOrderedSame. At any step during the binary search if you want to continue searching
 the lower half then the comparator should return NSOrderedDescending, and if you want to continue
 search the upper half then return NSOrderedAscending. If the comparator never returns NSOrderedSame,
 then this method returns NSNotFound.
 */
-(NSUInteger) indexFromBinarySearchUsingBlock:(NSComparisonResult(^)(id))comparator;


/**
 Same as `indexFromBinarySearchUsingBlock:`, except the object at the searched index is returned, 
 or `nil` if no index was found.
 */
-(id) objectFromBinarySearchUsingBlock:(NSComparisonResult(^)(id))comparator;


/**
 A random object in the array.
 
 @return Returns a random object in the array, or `nil` if empty.
 */
-(id) anyObject;


/**
 A random object in the array, with a possible exception.
 
 @param object Any object
 @return Returns a random object in the array except for the one passed in, or `nil` if there is no such object.
 */
-(id) anyObjectExcept:(id)object;


/**
 Second object in the array.
 
 @return Returns the second object in the array, or `nil` if there is no such object.
 */
-(id) secondObject;

/**
 Second to last object in array, or nil if there is less than 2 objects in array.
 */
-(id) secondToLastObject;


/**
 Array has elements?
 */
-(BOOL) hasElements;


/**
 Removes [NSNull null] objects, empty arrays, empty dictionarys, empty sets...
 */
-(NSArray*) compactWithOptions:(NSArrayCompactOptions)options;

/**
 Recursively turns a nested array into a one-dimensional array.
 */
-(NSArray*) flatten;


/**
 Prepends an object to an array.
 
 @param object The object to prepend.
 @return Returns a new array with the passed object inserted in the front of the array.
 */
-(NSArray*) arrayByPrependingObject:(id)object;


/**
 Determines if the array contains a specified string, ignoring case sensitivity.
 
 @param string The string to search for.
 @return Returns YES if the array contains the string, NO otherwise.
 */
-(BOOL) containsCaseInsensitiveString:(NSString*)string;


/**
 Determines if the array contains an object from another collection.
 
 @param collection An object that adopts the NSFastEnumeration protocol.
 @return Returns YES if the array contains an object from the collection, NO otherwise.
 */
-(BOOL) containsAnObjectIn:(id<NSFastEnumeration>)collection;


/**
 Helpers for getting the head or tail subarray.
 */
-(NSArray*) subarrayFromIndex:(NSUInteger)index;
-(NSArray*) subarrayToIndex:(NSUInteger)index;
-(NSArray*) limit:(NSUInteger)limit;


/**
 Helper method to obtain sorted array with a single sort descriptor.
 
 @param sortDescription A single sort descriptor
 @return Returns a new array sorted by the sort descriptor
 */
-(NSArray*) sortedArrayUsingDescriptor:(NSSortDescriptor *)sortDescriptor;

/**
 Enumerates the objects of the array, but starts at `index` and loops around (if necessary).
 */
-(void) enumerateObjectsStartingAtIndex:(NSUInteger)index usingBlock:(void (^)(id obj, NSUInteger idx, BOOL *stop))block;


/**
 Syncronizes two collections of objects.
 
 @param collection The other collection to syncronize the array with.
 @param key1 The key in the caller array to use as a syncronization pivot.
 @param key2 The key in `collection` to use as a syncronization pivot.
 @param updateBlock A block that is called when 2 of the same objects are found in the 
 collections, and hence they must be updated.
 @param needsSort Determines it the collections are sorted first
 @param insertBlock A block that is called when a new object is found in `collection`.
 @param deleteBlock A block that is called when an object from the caller should be deleted.
 @return Returns a new array with the passed object inserted in the front of the array.
 */
-(void) synchronizeWith:(id)collection 
              usingKeys:(NSString*)key1 :(NSString*)key2 
            updateBlock:(void(^)(id obj1, id obj2))updateBlock
            insertBlock:(id(^)(id obj))insertBlock
            deleteBlock:(void(^)(id obj))deleteBlock;
-(void) synchronizeWith:(id)collection 
              usingKeys:(NSString*)key1 :(NSString*)key2 
              needsSort:(BOOL)needsSort
            updateBlock:(void(^)(id obj1, id obj2))updateBlock
            insertBlock:(id(^)(id obj))insertBlock
            deleteBlock:(void(^)(id obj))deleteBlock;
-(void) synchronizeWith:(id)collection 
              usingKeys:(NSString*)key1 :(NSString*)key2 
              needsSort:(BOOL)needsSort1 :(BOOL)needsSort2
            updateBlock:(void(^)(id obj1, id obj2))updateBlock
            insertBlock:(id(^)(id obj))insertBlock
            deleteBlock:(void(^)(id obj))deleteBlock;

@end

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 60000
@interface NSArray (OPSubscripts)
-(id) objectAtIndexedSubscript:(NSUInteger)idx;
@end
#endif
