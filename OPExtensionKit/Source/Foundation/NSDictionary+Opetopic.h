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

@interface NSDictionary (Opetopic)

/**
 The string object for a key.
 
 @return The string object for a key, or `nil` if the object isn't a string.
 */
-(NSString*) stringForKey:(id)key;
-(NSString*) stringForKeyPath:(id)keyPath;

/**
 The number object for a key.
 
 @return The number object for a key, or `nil` if the object isn't a number.
 */
-(NSNumber*) numberForKey:(id)key;
-(NSNumber*) numberForKeyPath:(id)keyPath;

/**
 A native BOOL for the object at the key.
*/
-(BOOL) boolForKey:(id)key;
-(BOOL) boolForKeyPath:(id)keyPath;

/**
 The dictionary object for a key.
 
 @return The dictionary object for a key, or `nil` if the object isn't a dictionary.
 */
-(NSDictionary*) dictionaryForKey:(id)key;
-(NSDictionary*) dictionaryForKeyPath:(id)keyPath;

/**
 The array object for a key.
 
 @return The array object for a key, or `nil` if the object isn't a array.
 */
-(NSArray*) arrayForKey:(id)key;
-(NSArray*) arrayForKeyPath:(id)keyPath;

/**
 The date object for a key.
 
 @return The date object for a key, or `nil` if the object isn't a date (in this case
 we only allow numbers which are interpreted as number of seconds since epoch, and we
 return `nil` if the object is 0).
 */
-(NSDate*) dateForKey:(id)key;
-(NSDate*) dateForKeyPath:(id)keyPath;

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
 Returns new dictionary with all keys prefixed.
 */
-(NSDictionary*) withPrefixedKeys:(NSString*)prefix;

/**
 Dictionary has elements?
 */
-(BOOL) hasElements;

/**
 */
-(NSDictionary*) takeKeys:(NSArray*)keys;
-(NSDictionary*) takeKeyPaths:(NSArray*)keyPaths;

@end

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 60000
@interface NSDictionary(OPSubscripts)
- (id)objectForKeyedSubscript:(id)key;
@end
#endif
