//
//  NSDictionary+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 9/21/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

/** NSDictionary Extensions
 
 Lots of fancy NSDictionary extensions!
 */

#import <Foundation/Foundation.h>
#import "OPMacros.h"

/**
 Macro for concisely creating a dictionary with key/value order, as opposed to value/key.
 */
#define $dict(...)      DictionaryWithArrayPrivate(VA_ARGS_COUNT(__VA_ARGS__)/2, VA_ARGS_C_ARRAY(__VA_ARGS__), NO)
#define $dictsafe(...)  DictionaryWithArrayPrivate(VA_ARGS_COUNT(__VA_ARGS__)/2, VA_ARGS_C_ARRAY(__VA_ARGS__), YES)
NSDictionary *DictionaryWithArrayPrivate(NSUInteger count, id __unsafe_unretained keysAndObjects[], BOOL coalesceNils);

@interface NSDictionary (Opetopic)

/**
 The string object for a key.
 
 @return The string object for a key, or `nil` if the object isn't a string.
 */
-(NSString*) stringForKey:(id)key;

/**
 The number object for a key.
 
 @return The number object for a key, or `nil` if the object isn't a number.
 */
-(NSNumber*) numberForKey:(id)key;

/**
 The dictionary object for a key.
 
 @return The dictionary object for a key, or `nil` if the object isn't a dictionary.
 */
-(NSDictionary*) dictionaryForKey:(id)key;

/**
 The array object for a key.
 
 @return The array object for a key, or `nil` if the object isn't a array.
 */
-(NSArray*) arrayForKey:(id)key;

/**
 The date object for a key.
 
 @return The date object for a key, or `nil` if the object isn't a date (in this case
 we only allow numbers which are interpreted as number of seconds since epoch).
 */
-(NSDate*) dateForKey:(id)key;

/**
 Merges `dict` into the dictionary, keeping the values in the `dict` if there are any conflicts.
 */
-(NSDictionary*) merge:(NSDictionary*)dict;

/** Merges `dict` into the dictionary, keeping the values of the caller if there are any conflicts.
 */
-(NSDictionary*) mergeInto:(NSDictionary*)dict;

/**
 Merges `dict` into the dictionary, allowing an additional block to determine how to handle conflcits.
 */
-(NSDictionary*) merge:(NSDictionary *)dict conflicts:(id(^)(id key, id lvalue, id rvalue))conflict;

/**
 Dictionary has elements?
 */
-(BOOL) hasElements;

@end
