//
//  NSManagedObject+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/25/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "NSManagedObject+Opetopic.h"

@implementation NSManagedObject (Opetopic)

-(BOOL) isUnsaved {
    return [[self committedValuesForKeys:nil] count] == 0;
}

@end
