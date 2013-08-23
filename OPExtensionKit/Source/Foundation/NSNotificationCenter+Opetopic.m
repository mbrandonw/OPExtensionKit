//
//  NSNotificationCenter+Opetopic.m
//  OPExtensionKit
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

-(id) addObserverOnMainQueueForName:(NSString*)name object:(id)obj usingBlock:(void(^)(NSNotification *note))block {
  return [self addObserverForName:name object:obj queue:[NSOperationQueue mainQueue] usingBlock:block];
}

-(id) addObserverForName:(NSString*)name usingBlock:(void(^)(NSNotification *note))block {
  return [self addObserverForName:name object:nil usingBlock:block];
}

-(id) addObserverForName:(NSString*)name object:(id)obj usingBlock:(void(^)(NSNotification *note))block {
  return [self addObserverForName:name object:obj queue:nil usingBlock:block];
}

@end
