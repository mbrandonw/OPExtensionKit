//
//  NSOrderedSet+Opetopic.m
//  Kickstarter
//
//  Created by Brandon Williams on 1/13/14.
//  Copyright (c) 2014 Kickstarter. All rights reserved.
//

#import "NSOrderedSet+Opetopic.h"

@implementation NSOrderedSet (Opetopic)

-(void) makeObjectsPerformSelector:(SEL)aSelector {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
  for (id obj in self) {
    [obj performSelector:aSelector];
  }
#pragma clang diagnostic pop
}

-(void) makeObjectsPerformSelector:(SEL)aSelector withObject:(id)argument {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
  for (id obj in self) {
    [obj performSelector:aSelector withObject:argument];
  }
#pragma clang diagnostic pop
}

@end
