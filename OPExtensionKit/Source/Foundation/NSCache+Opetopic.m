//
//  NSCache+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/2/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "NSCache+Opetopic.h"
#import "OPMacros.h"

@implementation NSCache (Opetopic)

OP_SYNTHESIZE_SINGLETON_FOR_CLASS(NSCache, sharedCache);

-(id) fetch:(id)key :(id(^)(void))block {
    
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
