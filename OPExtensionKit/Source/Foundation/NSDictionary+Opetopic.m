//
//  NSDictionary+Opetopic.m
//  OPKit
//
//  Created by Brandon Williams on 9/21/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "NSDictionary+Opetopic.h"

@implementation NSDictionary (Opetopic)

- (NSString*) stringForKey:(id)key {
	id r = [self objectForKey:key];
    
    if ([r isKindOfClass:[NSString class]])
        return r;
    if ([r isKindOfClass:[NSNumber class]])
        return [r stringValue];
    
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

@end
