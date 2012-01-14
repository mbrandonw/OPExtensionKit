//
//  NSDictionary+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 9/21/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "NSDictionary+Opetopic.h"

NSDictionary *DictionaryWithArrayPrivate(NSUInteger count, id __unsafe_unretained keysAndObjects[]) {
    
    id keys[count];
    id objects[count];
    
    for (NSUInteger i = 0; i < count; i++)
    {
        keys[i] = keysAndObjects[2 * i];
        objects[i] = keysAndObjects[2 * i + 1];
    }
    
    return [NSDictionary dictionaryWithObjects:objects forKeys:keys count:count];
}

@implementation NSDictionary (Opetopic)

- (NSString*) stringForKey:(id)key {
	id r = [self objectForKey:key];
    
    if ([r isKindOfClass:[NSString class]])
        return r;
    
    return nil;
}

- (NSNumber*) numberForKey:(id)key {
	id r = [self objectForKey:key];
	
    if ([r isKindOfClass:[NSNumber class]])
		return r;
    
    if ([r isKindOfClass:[NSString class]])
    {
        NSNumberFormatter *f = [NSNumberFormatter new];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        return [f numberFromString:r];
    }
    
	return nil;
}

- (NSDictionary*) dictionaryForKey:(id)key {
	id r = [self objectForKey:key];
    
	if ([r isKindOfClass:[NSDictionary class]])
		return r;
    
	return nil;
}

- (NSArray*) arrayForKey:(id)key {
	id r = [self objectForKey:key];
    
	if ([r isKindOfClass:[NSArray class]])
		return r;
    
	return nil;
}

-(NSDate*) dateForKey:(id)key {
	id r = [self objectForKey:key];
	
    if ([r isKindOfClass:[NSNumber class]])
        return [NSDate dateWithTimeIntervalSince1970:[r doubleValue]];
    
    return nil;
}

-(NSDictionary*) merge:(NSDictionary*)dict {
    return [self merge:dict conflicts:^id(id key, id lvalue, id rvalue) {
        return rvalue;
    }];
}

-(NSDictionary*) mergeInto:(NSDictionary*)dict {
    return [self merge:dict conflicts:^id(id key, id lvalue, id rvalue) {
        return lvalue;
    }];
}

-(NSDictionary*) merge:(NSDictionary *)dict conflicts:(id(^)(id key, id lvalue, id rvalue))conflict {
    
    NSMutableDictionary *retVal = [NSMutableDictionary dictionaryWithDictionary:self];
    
    for (id key in dict)
    {
        if ([self objectForKey:key])
        {
            id obj = conflict ? conflict(key, [self objectForKey:key], [dict objectForKey:key]) : [dict objectForKey:key];
            [retVal setObject:obj forKey:key];
        }
        else
            [retVal setObject:[dict objectForKey:key] forKey:key];
    }
    
    return retVal;
}

@end
