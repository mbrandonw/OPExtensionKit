//
//  NSMutableDictionary+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Willians on 10/17/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

/** NSMutableDictionary Extensions
 
 Lots of fancy NSMutableDictionary extensions!
 */

#import <Foundation/Foundation.h>

/**
 Macro for concisely creating a mutable dictionary with key/value order, as opposed to value/key.
 */
#define $mdict(...)  MutableDictionaryWithArrayPrivate(VA_ARGS_COUNT(__VA_ARGS__)/2, VA_ARGS_C_ARRAY(__VA_ARGS__))
NSMutableDictionary *MutableDictionaryWithArrayPrivate(NSUInteger count, id __unsafe_unretained keysAndObjects[]);

@interface NSMutableDictionary (Opetopic)

/**
 Sets the object for a key with a string, or does nothing if object is not a string.
 */
-(void) setString:(NSString*)obj forKey:(id)key;

/**
 Sets the object for a key with a number, or does nothing if object is not a number.
 */
-(void) setNumber:(NSNumber*)obj forKey:(id)key;

/**
 Sets the object for a key with a dictionary, or does nothing if object is not a dictionary.
 */
-(void) setDictionary:(NSDictionary*)obj forKey:(id)key;

/**
 Sets the object for a key with a array, or does nothing if object is not a array.
 */
-(void) setArray:(NSArray*)obj forKey:(id)key;

/**
 Sets the object for a key with a date (represnted as number of seconds since epoch), or does 
 nothing if object is not a date.
 */
-(void) setDate:(NSDate*)obj forKey:(id)key;

/**
 Sets the object for a key with a boolean (represented as the string "true" or "false"), or does 
 nothing if object is not a number.
 */
-(void) setBoolean:(NSNumber*)obj forKey:(id)key;

@end
