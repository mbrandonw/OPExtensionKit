//
//  NSMutableDictionary+Opetopic.m
//  OPKit
//
//  Created by Brandon Willians on 10/17/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

#import "NSMutableDictionary+Opetopic.h"

NSMutableDictionary *MutableDictionaryWithArrayPrivate(NSUInteger count, id __unsafe_unretained keysAndObjects[]) {
    
    id keys[count];
    id objects[count];
    
    for (NSUInteger i = 0; i < count; i++)
    {
        keys[i] = keysAndObjects[2 * i];
        objects[i] = keysAndObjects[2 * i + 1];
    }
    
    return [NSMutableDictionary dictionaryWithObjects:objects forKeys:keys count:count];
}

@implementation NSMutableDictionary (Opetopic)

-(void) setString:(NSString*)obj forKey:(id)key {
    if ([obj isKindOfClass:[NSString class]])
        [self setObject:obj forKey:key];
}

-(void) setNumber:(NSNumber*)obj forKey:(id)key {
    if ([obj isKindOfClass:[NSNumber class]])
        [self setObject:obj forKey:key];
}

-(void) setDictionary:(NSDictionary*)obj forKey:(id)key {
    if ([obj isKindOfClass:[NSDictionary class]])
        [self setObject:obj forKey:key];
}

-(void) setArray:(NSArray*)obj forKey:(id)key {
    if ([obj isKindOfClass:[NSArray class]])
        [self setObject:obj forKey:key];
}

-(void) setDate:(NSDate*)obj forKey:(id)key {
    if ([obj isKindOfClass:[NSDate class]])
        [self setObject:[NSNumber numberWithInteger:(NSInteger)[obj timeIntervalSince1970]] forKey:key];
}

-(void) setBoolean:(NSNumber*)obj forKey:(id)key {
    if ([obj isKindOfClass:[NSNumber class]])
        [self setObject:([obj boolValue] ? @"true" : @"false") forKey:key];
}

@end
