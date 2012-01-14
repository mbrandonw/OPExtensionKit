//
//  NSObject+Opetopic.m
//  //  OPExtensionKit
//
//  Created by Brandon Williams on 9/24/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "NSObject+Opetopic.h"

@implementation NSObject (Opetopic)

-(BOOL) in:(NSArray*)array {
    return [array containsObject:self];
}

-(void) performSelector:(SEL)aSelector withEachObjectIn:(id<NSFastEnumeration>)objects {
    
    for (id object in objects)
    {
#pragma clang diagnostic push 
#pragma clang diagnostic ignored "-Warc-performSelector-leaks" 
        [self performSelector:aSelector withObject:object]; 
#pragma clang diagnostic pop 
    }
}

+(void) performBlockNextRunloop:(void(^)(void))block {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0), dispatch_get_main_queue(), ^(void){
        if (block)
            block();
    });
}

-(id) tap:(void(^)(id obj))tap {
    tap(self);
    return self;
}

@end
