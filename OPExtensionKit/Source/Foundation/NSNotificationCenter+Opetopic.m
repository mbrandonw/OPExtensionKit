//
//  NSNotificationCenter+Opetopic.m
//  OPKit
//
//  Created by Brandon Williams on 10/11/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "NSNotificationCenter+Opetopic.h"

@implementation NSNotificationCenter (Opetopic)

-(void) postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject {
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        [self postNotificationName:aName object:anObject];
    });
}

@end
