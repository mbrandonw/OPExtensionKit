//
//  NSDictionary+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 9/21/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "NSDictionary+Opetopic.h"

NSDictionary *DictionaryWithArrayPrivate(NSUInteger count, id __unsafe_unretained keysAndObjects[], BOOL coalesceNils) {
    
    id keys[count];
    id objects[count];
    
    for (NSUInteger i = 0; i < count; i++)
    {
        keys[i] = keysAndObjects[2 * i];
        objects[i] = keysAndObjects[2 * i + 1];
        
        if (coalesceNils && !keys[i])
            keys[i] = [NSNull null];
        if (coalesceNils && !objects[i])
            objects[i] = [NSNull null];
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

-(NSString*) stringForKeyPath:(id)keyPath {
	id r = [self valueForKeyPath:keyPath];
    if ([r isKindOfClass:[NSString class]])
        return r;
    return nil;
}

- (NSNumber*) numberForKey:(id)key {
	id r = [self objectForKey:key];
    if ([r isKindOfClass:[NSNumber class]])
		return r;
    if ([r isKindOfClass:[NSString class]])
        return @([r doubleValue]);
	return nil;
}

-(NSNumber*) numberForKeyPath:(id)keyPath {
	id r = [self valueForKeyPath:keyPath];
    if ([r isKindOfClass:[NSNumber class]])
		return r;
    if ([r isKindOfClass:[NSString class]])
        return @([r doubleValue]);
	return nil;
}

-(BOOL) boolForKey:(id)key {
  return [[self numberForKey:key] boolValue];
}

-(BOOL) boolForKeyPath:(id)keyPath {
  return [[self numberForKeyPath:keyPath] boolValue];
}

- (NSDictionary*) dictionaryForKey:(id)key {
	id r = [self objectForKey:key];
	if ([r isKindOfClass:[NSDictionary class]])
		return r;
	return nil;
}

-(NSDictionary*) dictionaryForKeyPath:(id)keyPath {
	id r = [self valueForKeyPath:keyPath];
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

-(NSArray*) arrayForKeyPath:(id)keyPath {
	id r = [self valueForKeyPath:keyPath];
	if ([r isKindOfClass:[NSArray class]])
		return r;
	return nil;
}

-(NSDate*) dateForKey:(id)key {
	id r = [self objectForKey:key];
    if ([r isKindOfClass:[NSNumber class]] && [r doubleValue] > 0.0f)
        return [NSDate dateWithTimeIntervalSince1970:[r doubleValue]];
    return nil;
}

-(NSDate*) dateForKeyPath:(id)keyPath {
	id r = [self valueForKeyPath:keyPath];
    if ([r isKindOfClass:[NSNumber class]] && [r doubleValue] > 0.0f)
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

-(BOOL) hasElements {
    return [self count] > 0;
}

-(NSDictionary*) takeKeys:(NSArray *)keys {
    NSMutableDictionary *retVal = [NSMutableDictionary new];
    for (id key in keys)
        if (self[key])
            retVal[key] = self[key];
    return retVal;
}

-(NSDictionary*) takeKeyPaths:(NSArray *)keyPaths {
    NSMutableDictionary *retVal = [NSMutableDictionary new];
    for (id keyPath in keyPaths)
    {
        if (self[keyPath])
        {
            retVal[keyPath] = self[keyPath];
        }
        else if ([self valueForKeyPath:keyPath])
        {
            NSArray *components = [keyPath componentsSeparatedByString:@"."];
            NSMutableDictionary *obj = retVal;
            for (id component in components)
            {
                if (component == [components lastObject]) {
                    obj[component] = [self valueForKeyPath:keyPath];
                } else {
                    obj[component] = obj[component] ?: [NSMutableDictionary new];
                    obj = obj[component];
                }
            }
        }
    }
    return retVal;
}

@end
