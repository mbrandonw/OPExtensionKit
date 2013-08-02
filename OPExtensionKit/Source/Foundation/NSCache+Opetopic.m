//
//  NSCache+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/2/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "NSCache+Opetopic.h"

@implementation NSCache (Opetopic)

OP_SINGLETON_IMPLEMENTATION_FOR(NSCache, sharedCache);

-(id) fetch:(id)key do:(id(^)(void))block {
    
	id object = [self objectForKey:key];
	if (object)
		return object;
	
	if (block) {
		object = block();
        if (object)
            [self setObject:object forKey:key];
	}
	
	return object;
}

@end
