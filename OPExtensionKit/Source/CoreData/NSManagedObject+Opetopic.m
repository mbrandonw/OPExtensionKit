//
//  NSManagedObject+Opetopic.m
//  Kickstarter
//
//  Created by Brandon Williams on 1/25/12.
//  Copyright (c) 2012 Kickstarter. All rights reserved.
//

#import "NSManagedObject+Opetopic.h"

@implementation NSManagedObject (Opetopic)

-(BOOL) isNew {
    return [[self committedValuesForKeys:nil] count] == 0;
}

@end
