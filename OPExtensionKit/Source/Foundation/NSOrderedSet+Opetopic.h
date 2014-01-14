//
//  NSOrderedSet+Opetopic.h
//  Kickstarter
//
//  Created by Brandon Williams on 1/13/14.
//  Copyright (c) 2014 Kickstarter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSOrderedSet (Opetopic)

-(void) makeObjectsPerformSelector:(SEL)aSelector;
-(void) makeObjectsPerformSelector:(SEL)aSelector withObject:(id)argument;

@end
