//
//  NSDictionary+Opetopic.h
//  OPKit
//
//  Created by Brandon Williams on 9/21/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

/** NSDictionary Extensions
 
 Lots of fancy NSDictionary extensions!
 */

#import <Foundation/Foundation.h>

#define $dict(...)  [NSDictionary dictionaryWithObjectsAndKeys:__VA_ARGS__, nil]

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

@end
